# Meraki Olympus Contracts

Contracts that implement Profit Sharing for [Meraki Gen Art](https://mraki.io/)

### Development

**Getting Started**

Before attempting to setup the repo, first make sure you have Foundry installed and updated, which can be done [here](https://github.com/foundry-rs/foundry#installation).

**Building**

Install Foundry dependencies and build the project.

```bash
forge build
```

To install new libraries.

```bash
forge install <GITHUB_USER>/<REPO>
```

Example

```bash
forge install transmissions11/solmate
```

Whenever you install new libraries using Foundry, make sure to update your `remappings.txt` file.

**Testing**

Before running test, rename `sample.env` to `.env`, and add your matic RPC. If you want to deploy any contracts, you will need that networks RPC, a Private Key, and an Etherscan key(if you want foundry to verify the contracts).
Note in order to run tests against forked mainnet, your RPC must be an archive node. My favorite archive node is [Alchemy](https://www.alchemy.com).

Run tests with Foundry:

```bash
npm run forkTest
```

**Context**

Meraki hosts several generative art NFT sales. When artists collect their sale revenue, Meraki's cut is sent to the `OlympusAggregator` contract. Once the balance of WETH in the aggregator is sufficient, a Chainlink Keeper will automatically deposit the balance into `Olympus`. Users enter `Olympus` by staking their Meraki tokens(ERC721). They then earn their share of profit by calling `claimRewards(USER ADDRESS)`. When users stake they receive an ERC20 receipt token that is NOT transferrable. The NFTs a user stakes are sent to `Olympus`, and the ids are stored in an Openzeppelin Enumerable Set. Founders have an adjustable balance in `Olympus` that is set on deployment, and changeable by calling `adjustFounderInfo`.

**Attack Vectors/Thoughts**

- Reentrancy attacks have been mitigated using OZ Reentrancy Guard.
- Reward deposits are immediate so technically they are susceptible to sandwich attacks, though Meraki Tokens being NFTs make them relatively illiquid, plus there is a 5% secondary sale royalty. This means that in order for an attacker to profit, they need to make at least 10% on their investment in order to actually start making money, but given how rewards will be constantly added by keepers, it is very unlikely that a massive sum of rewards will be deposited in 1 TX.
- Wherever possible values are tied to specific users, IE the OZ Enumerable Set storing token ids is tied to a specific address(which is why the receipt token is non transferrable).
- The security of the aggregator is of low importance compared to the security needed for `Olympus`. The aggregator is easy to change, but changing `Olympus` would require getting all the users to move their tokens.
- Claiming rewards is an O(1) operation no matter how many `depositReward` TXs have happened since the last claim.

**Reward Logic**

When rewards are deposited, `Olympus` updates `cumulativeRewardShare`. This mapping stores the cumulative reward token per share, mapped by `depositReward` TXs.

Example:

- Alice deposits 25 Meraki Tokens into `Olympus`.
- Bob deposits 75 Meraki Tokens into `Olympus`.
- 1 WETH is deposited as rewards, and the cumulative reward share for deposit 1 is now 0.01 WETH/Share.
- Another 1 WETH is deposited as rewards, and the cumulative reward share for deposit 2 is not 0.02 WETH/Share.
- Bob claims rewards and is sent 75 Shares \* (0.02 WETH/Share - 0.0 WETH/Share) or 1.5 WETH.
- Another 1 WETH is deposited as rewards, and the cumulative reward share for deposit 3 is not 0.03 WETH/Share.
- Alice claims rewards and is sent 25 Shares \* (0.03 WETH/Share - 0.0 WETH/Share) or 0.75 WETH.
- Bob claims rewards and is sent 75 Shares \* (0.03 WETH/Share - 0.2 WETH/Share) or 0.75 WETH.
- In total Bob got 2.25 WETH, and Alice got 0.75 WETH. Which totals to 3 WETH.

Note: Everytime users enter/exit `Olympus`, or `claimRewards`, any pending rewards are saved/sent to them, and there `rewardCountLastClaim` value is updated to the most recent deposit Id(which is `rewardCount - 1`)
