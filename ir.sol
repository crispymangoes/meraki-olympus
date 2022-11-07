/// @use-src 7:"lib/openzeppelin-contracts/contracts/access/Ownable.sol", 8:"lib/openzeppelin-contracts/contracts/security/Pausable.sol", 9:"lib/openzeppelin-contracts/contracts/security/ReentrancyGuard.sol", 10:"lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol", 11:"lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol", 12:"lib/openzeppelin-contracts/contracts/token/ERC20/extensions/IERC20Metadata.sol", 17:"lib/openzeppelin-contracts/contracts/token/ERC721/IERC721Receiver.sol", 19:"lib/openzeppelin-contracts/contracts/token/ERC721/utils/ERC721Holder.sol", 21:"lib/openzeppelin-contracts/contracts/utils/Context.sol", 32:"src/Olympus.sol", 33:"src/RewardDistributor.sol"
object "Olympus_28391" {
    code {
        {
            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
            let _1 := 64
            mstore(_1, memoryguard(0xc0))
            if callvalue() { revert(0, 0) }
            let programSize := datasize("Olympus_28391")
            let argSize := sub(codesize(), programSize)
            let memoryDataOffset := allocate_memory(argSize)
            codecopy(memoryDataOffset, programSize, argSize)
            let _2 := add(memoryDataOffset, argSize)
            if slt(sub(_2, memoryDataOffset), 128)
            {
                revert(/** @src -1:-1:-1 */ 0, 0)
            }
            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
            let value := mload(memoryDataOffset)
            if iszero(eq(value, and(value, sub(shl(160, 1), 1))))
            {
                revert(/** @src -1:-1:-1 */ 0, 0)
            }
            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
            let value_1 := mload(add(memoryDataOffset, 32))
            if iszero(eq(value_1, and(value_1, sub(shl(160, 1), 1))))
            {
                revert(/** @src -1:-1:-1 */ 0, 0)
            }
            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
            let offset := mload(add(memoryDataOffset, _1))
            let _3 := sub(shl(64, 1), 1)
            if gt(offset, _3)
            {
                revert(/** @src -1:-1:-1 */ 0, 0)
            }
            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
            let _4 := add(memoryDataOffset, offset)
            if iszero(slt(add(_4, 0x1f), _2))
            {
                revert(/** @src -1:-1:-1 */ 0, 0)
            }
            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
            let _5 := mload(_4)
            let dst := allocate_memory(array_allocation_size_array_address_dyn(_5))
            let dst_1 := dst
            mstore(dst, _5)
            dst := add(dst, 32)
            let dst_2 := dst
            let srcEnd := add(add(_4, shl(5, _5)), 32)
            if gt(srcEnd, _2)
            {
                revert(/** @src -1:-1:-1 */ 0, 0)
            }
            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
            let src := add(_4, 32)
            for { } lt(src, srcEnd) { src := add(src, 32) }
            {
                let value_2 := mload(src)
                if iszero(eq(value_2, and(value_2, sub(shl(160, 1), 1))))
                {
                    /// @src -1:-1:-1
                    let _6 := 0
                    /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                    revert(/** @src -1:-1:-1 */ _6, _6)
                }
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                mstore(dst, value_2)
                dst := add(dst, 32)
            }
            let offset_1 := mload(add(memoryDataOffset, 96))
            if gt(offset_1, _3)
            {
                revert(/** @src -1:-1:-1 */ 0, 0)
            }
            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
            let _7 := add(memoryDataOffset, offset_1)
            if iszero(slt(add(_7, 0x1f), _2))
            {
                revert(/** @src -1:-1:-1 */ 0, 0)
            }
            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
            let _8 := mload(_7)
            let dst_3 := allocate_memory(array_allocation_size_array_address_dyn(_8))
            let dst_4 := dst_3
            mstore(dst_3, _8)
            dst_3 := add(dst_3, 32)
            let srcEnd_1 := add(add(_7, shl(5, _8)), 32)
            if gt(srcEnd_1, _2)
            {
                revert(/** @src -1:-1:-1 */ 0, 0)
            }
            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
            let src_1 := add(_7, 32)
            for { } lt(src_1, srcEnd_1) { src_1 := add(src_1, 32) }
            {
                mstore(dst_3, mload(src_1))
                dst_3 := add(dst_3, 32)
            }
            let memPtr := allocate_memory_8925()
            mstore(memPtr, 19)
            mstore(add(memPtr, 32), "Staked Meraki Token")
            let memPtr_1 := allocate_memory_8925()
            mstore(memPtr_1, 5)
            mstore(add(memPtr_1, 32), "sMRKI")
            let _9 := sload(/** @src -1:-1:-1 */ 0)
            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
            sstore(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ or(and(_9, not(sub(shl(160, 1), 1))), /** @src 21:719:729  "msg.sender" */ caller()))
            /// @src 7:2573:2613  "OwnershipTransferred(oldOwner, newOwner)"
            log3(/** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mload(_1), /** @src -1:-1:-1 */ 0, /** @src 7:2573:2613  "OwnershipTransferred(oldOwner, newOwner)" */ 0x8be0079c531659141344cd1fd0a4f28419497f9722a3daafe3b4186f6b6457e0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ and(_9, sub(shl(160, 1), 1)), /** @src 21:719:729  "msg.sender" */ caller())
            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
            let newLen := mload(memPtr)
            if gt(newLen, _3)
            {
                mstore(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ shl(224, 0x4e487b71))
                mstore(/** @src 10:2042:2055  "_name = name_" */ 0x04, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0x41)
                revert(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0x24)
            }
            let _10 := sload(/** @src 10:2042:2055  "_name = name_" */ 0x04)
            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
            let length := /** @src -1:-1:-1 */ 0
            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
            length := shr(1, _10)
            let outOfPlaceEncoding := and(_10, 1)
            if iszero(outOfPlaceEncoding) { length := and(length, 0x7f) }
            if eq(outOfPlaceEncoding, lt(length, 32))
            {
                mstore(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ shl(224, 0x4e487b71))
                mstore(/** @src 10:2042:2055  "_name = name_" */ 0x04, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0x22)
                revert(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0x24)
            }
            if gt(length, 0x1f)
            {
                mstore(/** @src -1:-1:-1 */ 0, /** @src 10:2042:2055  "_name = name_" */ 0x04)
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                let data := keccak256(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 32)
                let deleteStart := add(data, shr(5, add(newLen, 0x1f)))
                if lt(newLen, 32) { deleteStart := data }
                clear_storage_range_address(deleteStart, add(data, shr(5, add(length, 0x1f))))
            }
            let srcOffset := /** @src -1:-1:-1 */ 0
            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
            srcOffset := 32
            switch gt(newLen, 0x1f)
            case 1 {
                let loopEnd := and(newLen, not(31))
                mstore(/** @src -1:-1:-1 */ 0, /** @src 10:2042:2055  "_name = name_" */ 0x04)
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                let dstPtr := keccak256(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 32)
                let i := /** @src -1:-1:-1 */ 0
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                for { } lt(i, loopEnd) { i := add(i, 32) }
                {
                    sstore(dstPtr, mload(add(memPtr, srcOffset)))
                    dstPtr := add(dstPtr, 1)
                    srcOffset := add(srcOffset, 32)
                }
                if lt(loopEnd, newLen)
                {
                    let lastValue := mload(add(memPtr, srcOffset))
                    sstore(dstPtr, and(lastValue, not(shr(and(shl(3, newLen), 248), not(0)))))
                }
                sstore(/** @src 10:2042:2055  "_name = name_" */ 0x04, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ add(shl(1, newLen), 1))
            }
            default {
                let value_3 := /** @src -1:-1:-1 */ 0
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                if newLen
                {
                    value_3 := mload(add(memPtr, srcOffset))
                }
                sstore(/** @src 10:2042:2055  "_name = name_" */ 0x04, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ or(and(value_3, not(shr(shl(3, newLen), not(0)))), shl(1, newLen)))
            }
            let newLen_1 := mload(memPtr_1)
            if gt(newLen_1, _3)
            {
                mstore(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ shl(224, 0x4e487b71))
                mstore(/** @src 10:2042:2055  "_name = name_" */ 0x04, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0x41)
                revert(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0x24)
            }
            let _11 := sload(5)
            let length_1 := /** @src -1:-1:-1 */ 0
            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
            length_1 := shr(1, _11)
            let outOfPlaceEncoding_1 := and(_11, 1)
            if iszero(outOfPlaceEncoding_1)
            {
                length_1 := and(length_1, 0x7f)
            }
            if eq(outOfPlaceEncoding_1, lt(length_1, 32))
            {
                mstore(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ shl(224, 0x4e487b71))
                mstore(/** @src 10:2042:2055  "_name = name_" */ 0x04, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0x22)
                revert(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0x24)
            }
            if gt(length_1, 0x1f)
            {
                mstore(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 5)
                let data_1 := keccak256(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 32)
                let deleteStart_1 := add(data_1, shr(5, add(newLen_1, 0x1f)))
                if lt(newLen_1, 32) { deleteStart_1 := data_1 }
                clear_storage_range_address(deleteStart_1, add(data_1, shr(5, add(length_1, 0x1f))))
            }
            let srcOffset_1 := /** @src -1:-1:-1 */ 0
            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
            srcOffset_1 := 32
            switch gt(newLen_1, 0x1f)
            case 1 {
                let loopEnd_1 := and(newLen_1, not(31))
                mstore(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 5)
                let dstPtr_1 := keccak256(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 32)
                let i_1 := /** @src -1:-1:-1 */ 0
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                for { } lt(i_1, loopEnd_1) { i_1 := add(i_1, 32) }
                {
                    sstore(dstPtr_1, mload(add(memPtr_1, srcOffset_1)))
                    dstPtr_1 := add(dstPtr_1, 1)
                    srcOffset_1 := add(srcOffset_1, 32)
                }
                if lt(loopEnd_1, newLen_1)
                {
                    let lastValue_1 := mload(add(memPtr_1, srcOffset_1))
                    sstore(dstPtr_1, and(lastValue_1, not(shr(and(shl(3, newLen_1), 248), not(0)))))
                }
                sstore(5, add(shl(1, newLen_1), 1))
            }
            default {
                let value_4 := /** @src -1:-1:-1 */ 0
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                if newLen_1
                {
                    value_4 := mload(add(memPtr_1, srcOffset_1))
                }
                sstore(5, or(and(value_4, not(shr(shl(3, newLen_1), not(0)))), shl(1, newLen_1)))
            }
            sstore(/** @src 8:996:1011  "_paused = false" */ 0x06, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ and(sload(/** @src 8:996:1011  "_paused = false" */ 0x06), /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ not(255)))
            sstore(/** @src 9:1806:1828  "_status = _NOT_ENTERED" */ 0x07, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 1)
            /// @src 33:2368:2394  "rewardToken = _rewardToken"
            mstore(/** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 128, /** @src 33:2368:2394  "rewardToken = _rewardToken" */ value_1)
            /// @src 32:1125:1151  "MerakiToken = _merakiToken"
            mstore(160, value)
            /// @src 32:1166:1182  "_founders.length"
            let expr := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mload(/** @src 32:1166:1182  "_founders.length" */ dst_1)
            /// @src 32:1162:1239  "if (_founders.length != _balances.length) revert Olympus__MisMatchedLengths()"
            if /** @src 32:1166:1202  "_founders.length != _balances.length" */ iszero(eq(expr, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mload(/** @src 32:1186:1202  "_balances.length" */ dst_4)))
            /// @src 32:1162:1239  "if (_founders.length != _balances.length) revert Olympus__MisMatchedLengths()"
            {
                /// @src 32:1211:1239  "Olympus__MisMatchedLengths()"
                let _12 := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mload(_1)
                /// @src 32:1211:1239  "Olympus__MisMatchedLengths()"
                mstore(_12, shl(224, 0xe9b829e7))
                revert(_12, /** @src 10:2042:2055  "_name = name_" */ 0x04)
            }
            /// @src 32:1249:1273  "uint256 _foundersCap = 0"
            let var_foundersCap := /** @src -1:-1:-1 */ 0
            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
            let length_2 := mload(dst_1)
            if gt(length_2, _3)
            {
                mstore(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ shl(224, 0x4e487b71))
                mstore(/** @src 10:2042:2055  "_name = name_" */ 0x04, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0x41)
                revert(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0x24)
            }
            if gt(length_2, 18446744073709551616)
            {
                mstore(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ shl(224, 0x4e487b71))
                mstore(/** @src 10:2042:2055  "_name = name_" */ 0x04, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0x41)
                revert(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0x24)
            }
            /// @src 32:1283:1306  "founderList = _founders"
            let _13 := 0x0f
            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
            let oldLen := sload(/** @src 32:1283:1306  "founderList = _founders" */ _13)
            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
            sstore(/** @src 32:1283:1306  "founderList = _founders" */ _13, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ length_2)
            if lt(length_2, oldLen)
            {
                mstore(/** @src -1:-1:-1 */ 0, /** @src 32:1283:1306  "founderList = _founders" */ _13)
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                let data_2 := keccak256(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 32)
                clear_storage_range_address(add(data_2, length_2), add(data_2, oldLen))
            }
            let srcPtr := dst_2
            mstore(/** @src -1:-1:-1 */ 0, /** @src 32:1283:1306  "founderList = _founders" */ _13)
            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
            let data_3 := keccak256(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 32)
            let i_2 := /** @src -1:-1:-1 */ 0
            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
            for { } lt(i_2, length_2) { i_2 := add(i_2, 1) }
            {
                let cleaned := and(mload(srcPtr), sub(shl(160, 1), 1))
                srcPtr := add(srcPtr, 32)
                sstore(add(data_3, i_2), cleaned)
            }
            /// @src 32:1321:1334  "uint256 i = 0"
            let var_i := /** @src -1:-1:-1 */ 0
            /// @src 32:1316:1475  "for (uint256 i = 0; i < _founders.length; i++) {..."
            for { }
            /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 1
            /// @src 32:1321:1334  "uint256 i = 0"
            {
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                if eq(var_i, not(0))
                {
                    mstore(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ shl(224, 0x4e487b71))
                    mstore(/** @src 10:2042:2055  "_name = name_" */ 0x04, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0x11)
                    revert(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0x24)
                }
                /// @src 32:1358:1361  "i++"
                var_i := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ add(var_i, 1)
            }
            /// @src 32:1358:1361  "i++"
            {
                /// @src 32:1336:1356  "i < _founders.length"
                if iszero(lt(var_i, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mload(/** @src 32:1340:1356  "_founders.length" */ dst_1)))
                /// @src 32:1336:1356  "i < _founders.length"
                { break }
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                let sum := add(var_foundersCap, mload(/** @src 32:1393:1405  "_balances[i]" */ memory_array_index_access_uint256_dyn(dst_4, var_i)))
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                if gt(var_foundersCap, sum)
                {
                    mstore(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ shl(224, 0x4e487b71))
                    mstore(/** @src 10:2042:2055  "_name = name_" */ 0x04, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0x11)
                    revert(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0x24)
                }
                /// @src 32:1377:1405  "_foundersCap += _balances[i]"
                var_foundersCap := sum
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                let _14 := mload(/** @src 32:1452:1464  "_balances[i]" */ memory_array_index_access_uint256_dyn(dst_4, var_i))
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                if iszero(lt(var_i, sload(/** @src 32:1283:1306  "founderList = _founders" */ _13)))
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                {
                    mstore(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ shl(224, 0x4e487b71))
                    mstore(/** @src 10:2042:2055  "_name = name_" */ 0x04, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0x32)
                    revert(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0x24)
                }
                mstore(/** @src -1:-1:-1 */ 0, /** @src 32:1283:1306  "founderList = _founders" */ _13)
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                mstore(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ and(sload(add(keccak256(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 32), var_i)), sub(shl(160, 1), 1)))
                mstore(32, /** @src 32:1419:1433  "founderBalance" */ 0x0e)
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                sstore(keccak256(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _1), _14)
            }
            sstore(/** @src 32:1484:1516  "founderDepositCap = _foundersCap" */ 0x10, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ var_foundersCap)
            sstore(/** @src 32:1526:1554  "totalDeposits = _foundersCap" */ 0x08, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ var_foundersCap)
            let _15 := mload(_1)
            let _16 := datasize("Olympus_28391_deployed")
            codecopy(_15, dataoffset("Olympus_28391_deployed"), _16)
            setimmutable(_15, "28438", mload(128))
            setimmutable(_15, "27908", mload(/** @src 32:1125:1151  "MerakiToken = _merakiToken" */ 160))
            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
            return(_15, _16)
        }
        function allocate_memory_8925() -> memPtr
        {
            memPtr := mload(64)
            let newFreePtr := add(memPtr, 64)
            if or(gt(newFreePtr, sub(shl(64, 1), 1)), lt(newFreePtr, memPtr))
            {
                mstore(0, shl(224, 0x4e487b71))
                mstore(4, 0x41)
                revert(0, 0x24)
            }
            mstore(64, newFreePtr)
        }
        function allocate_memory(size) -> memPtr
        {
            memPtr := mload(64)
            let newFreePtr := add(memPtr, and(add(size, 31), not(31)))
            if or(gt(newFreePtr, sub(shl(64, 1), 1)), lt(newFreePtr, memPtr))
            {
                mstore(0, shl(224, 0x4e487b71))
                mstore(4, 0x41)
                revert(0, 0x24)
            }
            mstore(64, newFreePtr)
        }
        function array_allocation_size_array_address_dyn(length) -> size
        {
            if gt(length, sub(shl(64, 1), 1))
            {
                mstore(0, shl(224, 0x4e487b71))
                mstore(4, 0x41)
                revert(0, 0x24)
            }
            size := add(shl(5, length), 0x20)
        }
        function clear_storage_range_address(start, end)
        {
            for { } lt(start, end) { start := add(start, 1) }
            { sstore(start, 0) }
        }
        function memory_array_index_access_uint256_dyn(baseRef, index) -> addr
        {
            if iszero(lt(index, mload(baseRef)))
            {
                mstore(0, shl(224, 0x4e487b71))
                mstore(4, 0x32)
                revert(0, 0x24)
            }
            addr := add(add(baseRef, shl(5, index)), 32)
        }
    }
    /// @use-src 7:"lib/openzeppelin-contracts/contracts/access/Ownable.sol", 8:"lib/openzeppelin-contracts/contracts/security/Pausable.sol", 9:"lib/openzeppelin-contracts/contracts/security/ReentrancyGuard.sol", 10:"lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol", 14:"lib/openzeppelin-contracts/contracts/token/ERC20/utils/SafeERC20.sol", 19:"lib/openzeppelin-contracts/contracts/token/ERC721/utils/ERC721Holder.sol", 20:"lib/openzeppelin-contracts/contracts/utils/Address.sol", 21:"lib/openzeppelin-contracts/contracts/utils/Context.sol", 25:"lib/openzeppelin-contracts/contracts/utils/math/Math.sol", 26:"lib/openzeppelin-contracts/contracts/utils/structs/EnumerableSet.sol", 32:"src/Olympus.sol", 33:"src/RewardDistributor.sol"
    object "Olympus_28391_deployed" {
        code {
            {
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                let _1 := 64
                mstore(_1, memoryguard(0x80))
                let _2 := 4
                if iszero(lt(calldatasize(), _2))
                {
                    let _3 := 0
                    switch shr(224, calldataload(_3))
                    case 0x0103c92b {
                        if callvalue() { revert(_3, _3) }
                        if slt(add(calldatasize(), not(3)), 32) { revert(_3, _3) }
                        let ret := fun_userBalance(abi_decode_address_26444())
                        let memPos := mload(_1)
                        mstore(memPos, ret)
                        return(memPos, 32)
                    }
                    case 0x06fdde03 {
                        if callvalue() { revert(_3, _3) }
                        if slt(add(calldatasize(), not(3)), _3) { revert(_3, _3) }
                        let memPtr := mload(_1)
                        let ret_1 := _3
                        let slotValue := sload(_2)
                        let length := _3
                        let _4 := 1
                        length := shr(_4, slotValue)
                        let outOfPlaceEncoding := and(slotValue, _4)
                        if iszero(outOfPlaceEncoding) { length := and(length, 0x7f) }
                        let _5 := 32
                        if eq(outOfPlaceEncoding, lt(length, _5))
                        {
                            mstore(_3, shl(224, 0x4e487b71))
                            mstore(_2, 0x22)
                            revert(_3, 0x24)
                        }
                        mstore(memPtr, length)
                        switch outOfPlaceEncoding
                        case 0 {
                            mstore(add(memPtr, _5), and(slotValue, not(255)))
                            ret_1 := add(add(memPtr, shl(5, iszero(iszero(length)))), _5)
                        }
                        case 1 {
                            mstore(_3, _2)
                            let dataPos := 62514009886607029107290561805838585334079798074568712924583230797734656856475
                            let i := _3
                            for { } lt(i, length) { i := add(i, _5) }
                            {
                                mstore(add(add(memPtr, i), _5), sload(dataPos))
                                dataPos := add(dataPos, _4)
                            }
                            ret_1 := add(add(memPtr, i), _5)
                        }
                        finalize_allocation(memPtr, sub(ret_1, memPtr))
                        let memPos_1 := mload(_1)
                        return(memPos_1, sub(abi_encode_string(memPos_1, memPtr), memPos_1))
                    }
                    case 0x095ea7b3 {
                        if callvalue() { revert(_3, _3) }
                        if slt(add(calldatasize(), not(3)), _1) { revert(_3, _3) }
                        let value0 := abi_decode_address_26444()
                        /// @src 10:4593:4599  "amount"
                        fun_approve(/** @src 21:719:729  "msg.sender" */ caller(), /** @src 10:4593:4599  "amount" */ value0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ calldataload(36))
                        let memPos_2 := mload(_1)
                        mstore(memPos_2, 1)
                        return(memPos_2, 32)
                    }
                    case 0x0e15561a {
                        if callvalue() { revert(_3, _3) }
                        if slt(add(calldatasize(), not(3)), _3) { revert(_3, _3) }
                        let _6 := sload(/** @src 33:1630:1657  "uint256 public totalRewards" */ 9)
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        let memPos_3 := mload(_1)
                        mstore(memPos_3, _6)
                        return(memPos_3, 32)
                    }
                    case 0x0fbf0a93 {
                        if callvalue() { revert(_3, _3) }
                        let _7 := 32
                        if slt(add(calldatasize(), not(3)), _7) { revert(_3, _3) }
                        let offset := calldataload(_2)
                        if gt(offset, 0xffffffffffffffff) { revert(_3, _3) }
                        let value0_1 := abi_decode_array_uint256_dyn(add(_2, offset), calldatasize())
                        /// @src 8:1204:1276  "modifier whenNotPaused() {..."
                        fun_requireNotPaused()
                        /// @src 9:2212:2315  "modifier nonReentrant() {..."
                        fun_nonReentrantBefore()
                        /// @src 32:4456:4505  "if (_ids.length == 0) revert Olympus__ZeroInput()"
                        if /** @src 32:4460:4476  "_ids.length == 0" */ iszero(/** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mload(/** @src 32:4460:4471  "_ids.length" */ value0_1))
                        /// @src 32:4456:4505  "if (_ids.length == 0) revert Olympus__ZeroInput()"
                        {
                            /// @src 32:4485:4505  "Olympus__ZeroInput()"
                            let _8 := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mload(_1)
                            /// @src 32:4485:4505  "Olympus__ZeroInput()"
                            mstore(_8, shl(225, 0x04185247))
                            revert(_8, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _2)
                        }
                        /// @src 32:4559:4569  "msg.sender"
                        fun_updateRewards(caller())
                        /// @src 32:4585:4594  "uint256 i"
                        let var_i := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _3
                        let _9 := and(/** @src 32:4632:4643  "MerakiToken" */ loadimmutable("27908"), /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ sub(shl(160, 1), 1))
                        /// @src 32:4580:4760  "for (uint256 i; i < _ids.length; i++) {..."
                        for { }
                        /** @src 32:4585:4594  "uint256 i" */ 1
                        {
                            /// @src 32:4613:4616  "i++"
                            var_i := increment_uint256(var_i)
                        }
                        {
                            /// @src 32:4596:4611  "i < _ids.length"
                            if iszero(lt(var_i, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mload(/** @src 32:4600:4611  "_ids.length" */ value0_1)))
                            /// @src 32:4596:4611  "i < _ids.length"
                            { break }
                            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                            let _10 := mload(/** @src 32:4688:4695  "_ids[i]" */ memory_array_index_access_address_dyn(value0_1, var_i))
                            /// @src 32:4632:4700  "MerakiToken.safeTransferFrom(msg.sender, address(this), _ids[i], \"\")"
                            if iszero(extcodesize(_9))
                            {
                                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                                revert(_3, _3)
                            }
                            /// @src 32:4632:4700  "MerakiToken.safeTransferFrom(msg.sender, address(this), _ids[i], \"\")"
                            let _11 := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mload(_1)
                            /// @src 32:4632:4700  "MerakiToken.safeTransferFrom(msg.sender, address(this), _ids[i], \"\")"
                            mstore(_11, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ shl(225, 0x5c46a7ef))
                            mstore(/** @src 32:4632:4700  "MerakiToken.safeTransferFrom(msg.sender, address(this), _ids[i], \"\")" */ add(_11, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _2), /** @src 32:4559:4569  "msg.sender" */ caller())
                            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                            mstore(add(/** @src 32:4632:4700  "MerakiToken.safeTransferFrom(msg.sender, address(this), _ids[i], \"\")" */ _11, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 36), /** @src 32:4681:4685  "this" */ address())
                            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                            mstore(add(/** @src 32:4632:4700  "MerakiToken.safeTransferFrom(msg.sender, address(this), _ids[i], \"\")" */ _11, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 68), _10)
                            mstore(add(/** @src 32:4632:4700  "MerakiToken.safeTransferFrom(msg.sender, address(this), _ids[i], \"\")" */ _11, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 100), 128)
                            mstore(add(/** @src 32:4632:4700  "MerakiToken.safeTransferFrom(msg.sender, address(this), _ids[i], \"\")" */ _11, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 132), _3)
                            /// @src 32:4632:4700  "MerakiToken.safeTransferFrom(msg.sender, address(this), _ids[i], \"\")"
                            let _12 := call(gas(), _9, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _3, /** @src 32:4632:4700  "MerakiToken.safeTransferFrom(msg.sender, address(this), _ids[i], \"\")" */ _11, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 164, /** @src 32:4632:4700  "MerakiToken.safeTransferFrom(msg.sender, address(this), _ids[i], \"\")" */ _11, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _3)
                            /// @src 32:4632:4700  "MerakiToken.safeTransferFrom(msg.sender, address(this), _ids[i], \"\")"
                            if iszero(_12)
                            {
                                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                                let pos := mload(_1)
                                returndatacopy(pos, _3, returndatasize())
                                revert(pos, returndatasize())
                            }
                            /// @src 32:4632:4700  "MerakiToken.safeTransferFrom(msg.sender, address(this), _ids[i], \"\")"
                            if _12
                            {
                                finalize_allocation_26446(_11)
                            }
                            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                            mstore(_3, /** @src 32:4559:4569  "msg.sender" */ caller())
                            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                            mstore(_7, /** @src 32:4714:4724  "userNFTIds" */ 0x0d)
                            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                            let dataSlot := keccak256(_3, _1)
                            /// @src 26:10875:10907  "_add(set._inner, bytes32(value))"
                            pop(fun_add(dataSlot, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mload(/** @src 32:4741:4748  "_ids[i]" */ memory_array_index_access_address_dyn(value0_1, var_i))))
                        }
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        sstore(/** @src 32:4769:4797  "totalDeposits += _ids.length" */ 0x08, checked_add_uint256(/** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ sload(/** @src 32:4769:4797  "totalDeposits += _ids.length" */ 0x08), /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mload(/** @src 32:4786:4797  "_ids.length" */ value0_1)))
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        let _13 := mload(/** @src 32:4825:4836  "_ids.length" */ value0_1)
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        if /** @src 10:8650:8671  "account != address(0)" */ iszero(/** @src 32:4559:4569  "msg.sender" */ caller())
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        {
                            let memPtr_1 := mload(_1)
                            mstore(memPtr_1, shl(229, 4594637))
                            mstore(add(memPtr_1, _2), _7)
                            mstore(add(memPtr_1, 36), 31)
                            mstore(add(memPtr_1, 68), "ERC20: mint to the zero address")
                            revert(memPtr_1, 100)
                        }
                        sstore(/** @src 10:8778:8800  "_totalSupply += amount" */ 0x03, checked_add_uint256(/** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ sload(/** @src 10:8778:8800  "_totalSupply += amount" */ 0x03), _13))
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        mstore(_3, /** @src 32:4559:4569  "msg.sender" */ caller())
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        mstore(_7, /** @src 33:6117:6135  "from != address(0)" */ 1)
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        let dataSlot_1 := keccak256(_3, _1)
                        sstore(dataSlot_1, add(sload(/** @src 10:8946:8974  "_balances[account] += amount" */ dataSlot_1), /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _13))
                        /// @src 10:8999:9036  "Transfer(address(0), account, amount)"
                        let _14 := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mload(_1)
                        mstore(_14, _13)
                        /// @src 10:8999:9036  "Transfer(address(0), account, amount)"
                        log3(_14, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _7, /** @src 10:8999:9036  "Transfer(address(0), account, amount)" */ 0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _3, /** @src 32:4559:4569  "msg.sender" */ caller())
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        sstore(/** @src 9:2790:2812  "_status = _NOT_ENTERED" */ 0x07, /** @src 33:6117:6135  "from != address(0)" */ 1)
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        return(mload(_1), _3)
                    }
                    case 0x150b7a02 {
                        if callvalue() { revert(_3, _3) }
                        if slt(add(calldatasize(), not(3)), 128) { revert(_3, _3) }
                        pop(abi_decode_address_26444())
                        pop(abi_decode_address())
                        let offset_1 := calldataload(100)
                        if gt(offset_1, 0xffffffffffffffff) { revert(_3, _3) }
                        if iszero(slt(add(offset_1, 35), calldatasize())) { revert(_3, _3) }
                        let _15 := calldataload(add(_2, offset_1))
                        let _16 := array_allocation_size_bytes(_15)
                        let memPtr_2 := mload(_1)
                        finalize_allocation(memPtr_2, _16)
                        mstore(memPtr_2, _15)
                        if gt(add(add(offset_1, _15), 36), calldatasize()) { revert(_3, _3) }
                        calldatacopy(add(memPtr_2, 32), add(offset_1, 36), _15)
                        mstore(add(add(memPtr_2, _15), 32), _3)
                        let memPos_4 := mload(_1)
                        mstore(memPos_4, shl(225, 0x0a85bd01))
                        return(memPos_4, 32)
                    }
                    case 0x18160ddd {
                        if callvalue() { revert(_3, _3) }
                        if slt(add(calldatasize(), not(3)), _3) { revert(_3, _3) }
                        let _17 := sload(/** @src 10:3329:3341  "_totalSupply" */ 0x03)
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        let memPos_5 := mload(_1)
                        mstore(memPos_5, _17)
                        return(memPos_5, 32)
                    }
                    case 0x23b872dd {
                        if callvalue() { revert(_3, _3) }
                        if slt(add(calldatasize(), not(3)), 96) { revert(_3, _3) }
                        let value0_2 := abi_decode_address_26444()
                        let value1 := abi_decode_address()
                        let value := calldataload(68)
                        mstore(_3, and(value0_2, sub(shl(160, 1), 1)))
                        mstore(32, /** @src 10:4089:4100  "_allowances" */ 0x02)
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        let _18 := keccak256(_3, _1)
                        mstore(_3, /** @src 21:719:729  "msg.sender" */ caller())
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        mstore(32, _18)
                        let _19 := sload(keccak256(_3, _1))
                        /// @src 10:11347:11590  "if (currentAllowance != type(uint256).max) {..."
                        if /** @src 10:11351:11388  "currentAllowance != type(uint256).max" */ iszero(eq(_19, /** @src 10:11371:11388  "type(uint256).max" */ not(0)))
                        /// @src 10:11347:11590  "if (currentAllowance != type(uint256).max) {..."
                        {
                            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                            if /** @src 10:11412:11438  "currentAllowance >= amount" */ lt(_19, value)
                            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                            {
                                let memPtr_3 := mload(_1)
                                mstore(memPtr_3, shl(229, 4594637))
                                mstore(add(memPtr_3, _2), 32)
                                mstore(add(memPtr_3, 36), 29)
                                mstore(add(memPtr_3, 68), "ERC20: insufficient allowance")
                                revert(memPtr_3, 100)
                            }
                            /// @src 10:11539:11564  "currentAllowance - amount"
                            fun_approve(value0_2, /** @src 21:719:729  "msg.sender" */ caller(), /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ sub(/** @src 10:11539:11564  "currentAllowance - amount" */ _19, value))
                        }
                        /// @src 10:5441:5447  "amount"
                        fun_transfer(value0_2, value1, value)
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        let memPos_6 := mload(_1)
                        mstore(memPos_6, 1)
                        return(memPos_6, 32)
                    }
                    case 0x2e17de78 {
                        if callvalue() { revert(_3, _3) }
                        let _20 := 32
                        if slt(add(calldatasize(), not(3)), _20) { revert(_3, _3) }
                        let value_1 := calldataload(_2)
                        /// @src 9:2212:2315  "modifier nonReentrant() {..."
                        fun_nonReentrantBefore()
                        /// @src 32:5045:5090  "if (_amount == 0) revert Olympus__ZeroInput()"
                        if /** @src 32:5049:5061  "_amount == 0" */ iszero(value_1)
                        /// @src 32:5045:5090  "if (_amount == 0) revert Olympus__ZeroInput()"
                        {
                            /// @src 32:5070:5090  "Olympus__ZeroInput()"
                            let _21 := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mload(_1)
                            /// @src 32:5070:5090  "Olympus__ZeroInput()"
                            mstore(_21, /** @src 32:4485:4505  "Olympus__ZeroInput()" */ shl(225, 0x04185247))
                            /// @src 32:5070:5090  "Olympus__ZeroInput()"
                            revert(_21, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _2)
                        }
                        /// @src 32:5144:5154  "msg.sender"
                        fun_updateRewards(caller())
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        sstore(/** @src 32:5166:5190  "totalDeposits -= _amount" */ 0x08, checked_sub_uint256(/** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ sload(/** @src 32:5166:5190  "totalDeposits -= _amount" */ 0x08), value_1))
                        /// @src 10:9505:9526  "account != address(0)"
                        let _22 := iszero(/** @src 32:5144:5154  "msg.sender" */ caller())
                        /// @src 10:9505:9526  "account != address(0)"
                        let _23 := iszero(_22)
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        if _22
                        {
                            let memPtr_4 := mload(_1)
                            mstore(memPtr_4, shl(229, 4594637))
                            mstore(add(memPtr_4, _2), _20)
                            mstore(add(memPtr_4, 36), 33)
                            mstore(add(memPtr_4, 68), "ERC20: burn from the zero addres")
                            mstore(add(memPtr_4, 100), "s")
                            revert(memPtr_4, 132)
                        }
                        /// @src 33:6117:6155  "from != address(0) && to != address(0)"
                        let expr := _23
                        if _23
                        {
                            expr := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _3
                        }
                        /// @src 33:6113:6204  "if (from != address(0) && to != address(0)) revert RewardDistributor__TransfersNotAllowed()"
                        if expr
                        {
                            /// @src 33:6164:6204  "RewardDistributor__TransfersNotAllowed()"
                            let _24 := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mload(_1)
                            /// @src 33:6164:6204  "RewardDistributor__TransfersNotAllowed()"
                            mstore(_24, shl(226, 0x08e4188f))
                            revert(_24, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _2)
                        }
                        mstore(_3, /** @src 32:5144:5154  "msg.sender" */ caller())
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        mstore(_20, 1)
                        let _25 := sload(keccak256(_3, _1))
                        if /** @src 10:9696:9720  "accountBalance >= amount" */ lt(_25, value_1)
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        {
                            let memPtr_5 := mload(_1)
                            mstore(memPtr_5, shl(229, 4594637))
                            mstore(add(memPtr_5, _2), _20)
                            mstore(add(memPtr_5, 36), 34)
                            mstore(add(memPtr_5, 68), "ERC20: burn amount exceeds balan")
                            mstore(add(memPtr_5, 100), "ce")
                            revert(memPtr_5, 132)
                        }
                        mstore(_3, /** @src 32:5144:5154  "msg.sender" */ caller())
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        mstore(_20, 1)
                        sstore(keccak256(_3, _1), sub(/** @src 10:9814:9837  "accountBalance - amount" */ _25, value_1))
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        sstore(/** @src 10:9930:9952  "_totalSupply -= amount" */ 0x03, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ sub(sload(/** @src 10:9930:9952  "_totalSupply -= amount" */ 0x03), /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ value_1))
                        /// @src 10:9978:10015  "Transfer(account, address(0), amount)"
                        let _26 := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mload(_1)
                        mstore(_26, value_1)
                        /// @src 10:9978:10015  "Transfer(account, address(0), amount)"
                        log3(_26, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _20, /** @src 10:9978:10015  "Transfer(account, address(0), amount)" */ 0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef, /** @src 32:5144:5154  "msg.sender" */ caller(), /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _3)
                        /// @src 32:5303:5312  "uint256 i"
                        let var_i_1 := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _3
                        let _27 := and(/** @src 32:5460:5471  "MerakiToken" */ loadimmutable("27908"), /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ sub(shl(160, 1), 1))
                        /// @src 32:5298:5540  "for (uint256 i; i < _amount; i++) {..."
                        for { }
                        /** @src 32:5314:5325  "i < _amount" */ lt(var_i_1, value_1)
                        /// @src 32:5303:5312  "uint256 i"
                        {
                            /// @src 32:5327:5330  "i++"
                            var_i_1 := increment_uint256(var_i_1)
                        }
                        {
                            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                            mstore(_3, /** @src 32:5144:5154  "msg.sender" */ caller())
                            /// @src 32:5361:5371  "userNFTIds"
                            let _28 := 0x0d
                            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                            mstore(_20, /** @src 32:5361:5371  "userNFTIds" */ _28)
                            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                            let _29 := keccak256(_3, _1)
                            if iszero(sload(_29))
                            {
                                mstore(_3, shl(224, 0x4e487b71))
                                mstore(_2, 0x32)
                                revert(_3, 36)
                            }
                            mstore(_3, _29)
                            let _30 := sload(keccak256(_3, _20))
                            mstore(_3, /** @src 32:5144:5154  "msg.sender" */ caller())
                            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                            mstore(_20, /** @src 32:5361:5371  "userNFTIds" */ _28)
                            /// @src 26:11175:11210  "_remove(set._inner, bytes32(value))"
                            pop(fun_remove(/** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ keccak256(_3, _1), /** @src 26:11195:11209  "bytes32(value)" */ _30))
                            /// @src 32:5460:5529  "MerakiToken.safeTransferFrom(address(this), msg.sender, idToTransfer)"
                            if iszero(extcodesize(_27))
                            {
                                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                                revert(_3, _3)
                            }
                            /// @src 32:5460:5529  "MerakiToken.safeTransferFrom(address(this), msg.sender, idToTransfer)"
                            let _31 := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mload(_1)
                            /// @src 32:5460:5529  "MerakiToken.safeTransferFrom(address(this), msg.sender, idToTransfer)"
                            mstore(_31, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ shl(225, 0x21421707))
                            mstore(/** @src 32:5460:5529  "MerakiToken.safeTransferFrom(address(this), msg.sender, idToTransfer)" */ add(_31, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _2), /** @src 32:5497:5501  "this" */ address())
                            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                            mstore(add(/** @src 32:5460:5529  "MerakiToken.safeTransferFrom(address(this), msg.sender, idToTransfer)" */ _31, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 36), /** @src 32:5144:5154  "msg.sender" */ caller())
                            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                            mstore(add(/** @src 32:5460:5529  "MerakiToken.safeTransferFrom(address(this), msg.sender, idToTransfer)" */ _31, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 68), _30)
                            /// @src 32:5460:5529  "MerakiToken.safeTransferFrom(address(this), msg.sender, idToTransfer)"
                            let _32 := call(gas(), _27, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _3, /** @src 32:5460:5529  "MerakiToken.safeTransferFrom(address(this), msg.sender, idToTransfer)" */ _31, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 100, /** @src 32:5460:5529  "MerakiToken.safeTransferFrom(address(this), msg.sender, idToTransfer)" */ _31, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _3)
                            /// @src 32:5460:5529  "MerakiToken.safeTransferFrom(address(this), msg.sender, idToTransfer)"
                            if iszero(_32)
                            {
                                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                                let pos_1 := mload(_1)
                                returndatacopy(pos_1, _3, returndatasize())
                                revert(pos_1, returndatasize())
                            }
                            /// @src 32:5460:5529  "MerakiToken.safeTransferFrom(address(this), msg.sender, idToTransfer)"
                            if _32
                            {
                                finalize_allocation_26446(_31)
                            }
                        }
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        sstore(/** @src 9:2790:2812  "_status = _NOT_ENTERED" */ 0x07, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 1)
                        return(mload(_1), _3)
                    }
                    case 0x313ce567 {
                        if callvalue() { revert(_3, _3) }
                        if slt(add(calldatasize(), not(3)), _3) { revert(_3, _3) }
                        let memPos_7 := mload(_1)
                        mstore(memPos_7, _3)
                        return(memPos_7, 32)
                    }
                    case 0x31d7a262 {
                        if callvalue() { revert(_3, _3) }
                        if slt(add(calldatasize(), not(3)), 32) { revert(_3, _3) }
                        let ret_2 := fun_pendingRewards(abi_decode_address_26444())
                        let memPos_8 := mload(_1)
                        mstore(memPos_8, ret_2)
                        return(memPos_8, 32)
                    }
                    case 0x38ad9c56 {
                        if callvalue() { revert(_3, _3) }
                        if slt(add(calldatasize(), not(3)), 32) { revert(_3, _3) }
                        mstore(_3, and(abi_decode_address_26444(), sub(shl(160, 1), 1)))
                        mstore(32, /** @src 10:3506:3515  "_balances" */ 0x01)
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        let _33 := sload(keccak256(_3, _1))
                        mstore(32, /** @src 32:5955:5969  "founderBalance" */ 0x0e)
                        /// @src 32:5928:5981  "return balanceOf(_user) + (founderBalance[_user] / 9)"
                        let var := /** @src 32:5935:5981  "balanceOf(_user) + (founderBalance[_user] / 9)" */ checked_add_uint256(_33, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ div(sload(keccak256(_3, _1)), /** @src 32:5979:5980  "9" */ 0x09))
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        let memPos_9 := mload(_1)
                        mstore(memPos_9, var)
                        return(memPos_9, 32)
                    }
                    case 0x39509351 {
                        if callvalue() { revert(_3, _3) }
                        if slt(add(calldatasize(), not(3)), _1) { revert(_3, _3) }
                        let value0_3 := abi_decode_address_26444()
                        mstore(_3, /** @src 21:719:729  "msg.sender" */ caller())
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        mstore(32, /** @src 10:4089:4100  "_allowances" */ 0x02)
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        let _34 := keccak256(_3, _1)
                        mstore(_3, and(value0_3, sub(shl(160, 1), 1)))
                        mstore(32, _34)
                        /// @src 10:6038:6076  "allowance(owner, spender) + addedValue"
                        fun_approve(/** @src 21:719:729  "msg.sender" */ caller(), /** @src 10:6038:6076  "allowance(owner, spender) + addedValue" */ value0_3, checked_add_uint256(/** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ sload(keccak256(_3, _1)), calldataload(36)))
                        let memPos_10 := mload(_1)
                        mstore(memPos_10, 1)
                        return(memPos_10, 32)
                    }
                    case 0x3f4ba83a {
                        if callvalue() { revert(_3, _3) }
                        if slt(add(calldatasize(), not(3)), _3) { revert(_3, _3) }
                        /// @src 7:1063:1125  "modifier onlyOwner() {..."
                        fun_checkOwner()
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        let _35 := sload(/** @src 8:1685:1692  "_paused" */ 0x06)
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        if iszero(and(_35, 0xff))
                        {
                            let memPtr_6 := mload(_1)
                            mstore(memPtr_6, shl(229, 4594637))
                            mstore(add(memPtr_6, _2), 32)
                            mstore(add(memPtr_6, 36), 20)
                            mstore(add(memPtr_6, 68), "Pausable: not paused")
                            revert(memPtr_6, 100)
                        }
                        sstore(/** @src 8:1685:1692  "_paused" */ 0x06, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ and(_35, not(255)))
                        /// @src 8:2521:2543  "Unpaused(_msgSender())"
                        let _36 := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mload(_1)
                        mstore(_36, /** @src 21:719:729  "msg.sender" */ caller())
                        /// @src 8:2521:2543  "Unpaused(_msgSender())"
                        log1(_36, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 32, /** @src 8:2521:2543  "Unpaused(_msgSender())" */ 0x5db9ee0a495bf2e6ff9c91a7834c1ba4fdd244a5e8aa4e537bd38aeae4b073aa)
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        return(mload(_1), _3)
                    }
                    case 0x5c975abb {
                        if callvalue() { revert(_3, _3) }
                        if slt(add(calldatasize(), not(3)), _3) { revert(_3, _3) }
                        let value_2 := and(sload(/** @src 8:1685:1692  "_paused" */ 0x06), /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0xff)
                        let memPos_11 := mload(_1)
                        mstore(memPos_11, iszero(iszero(value_2)))
                        return(memPos_11, 32)
                    }
                    case 0x70a08231 {
                        if callvalue() { revert(_3, _3) }
                        if slt(add(calldatasize(), not(3)), 32) { revert(_3, _3) }
                        mstore(_3, and(abi_decode_address_26444(), sub(shl(160, 1), 1)))
                        mstore(32, /** @src 10:3506:3515  "_balances" */ 0x01)
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        let _37 := sload(keccak256(_3, _1))
                        let memPos_12 := mload(_1)
                        mstore(memPos_12, _37)
                        return(memPos_12, 32)
                    }
                    case 0x715018a6 {
                        if callvalue() { revert(_3, _3) }
                        if slt(add(calldatasize(), not(3)), _3) { revert(_3, _3) }
                        /// @src 7:1063:1125  "modifier onlyOwner() {..."
                        fun_checkOwner()
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        let _38 := sload(_3)
                        sstore(_3, and(_38, shl(160, 0xffffffffffffffffffffffff)))
                        let _39 := mload(_1)
                        /// @src 7:2573:2613  "OwnershipTransferred(oldOwner, newOwner)"
                        log3(/** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _39, _3, /** @src 7:2573:2613  "OwnershipTransferred(oldOwner, newOwner)" */ 0x8be0079c531659141344cd1fd0a4f28419497f9722a3daafe3b4186f6b6457e0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ and(_38, sub(shl(160, 1), 1)), _3)
                        return(_39, _3)
                    }
                    case 0x7d882097 {
                        if callvalue() { revert(_3, _3) }
                        if slt(add(calldatasize(), not(3)), _3) { revert(_3, _3) }
                        let _40 := sload(/** @src 33:1561:1589  "uint256 public totalDeposits" */ 8)
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        let memPos_13 := mload(_1)
                        mstore(memPos_13, _40)
                        return(memPos_13, 32)
                    }
                    case 0x8456cb59 {
                        if callvalue() { revert(_3, _3) }
                        if slt(add(calldatasize(), not(3)), _3) { revert(_3, _3) }
                        /// @src 7:1063:1125  "modifier onlyOwner() {..."
                        fun_checkOwner()
                        /// @src 8:1204:1276  "modifier whenNotPaused() {..."
                        fun_requireNotPaused()
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        sstore(/** @src 8:2245:2259  "_paused = true" */ 0x06, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ or(and(sload(/** @src 8:2245:2259  "_paused = true" */ 0x06), /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ not(255)), /** @src 8:2255:2259  "true" */ 0x01))
                        /// @src 8:2274:2294  "Paused(_msgSender())"
                        let _41 := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mload(_1)
                        mstore(_41, /** @src 21:719:729  "msg.sender" */ caller())
                        /// @src 8:2274:2294  "Paused(_msgSender())"
                        log1(_41, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 32, /** @src 8:2274:2294  "Paused(_msgSender())" */ 0x62e78cea01bee320cd4e420270b5ea74000d11b0c9f74754ebdbfc544b05a258)
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        return(mload(_1), _3)
                    }
                    case 0x8da5cb5b {
                        if callvalue() { revert(_3, _3) }
                        if slt(add(calldatasize(), not(3)), _3) { revert(_3, _3) }
                        let cleaned := and(sload(_3), sub(shl(160, 1), 1))
                        let memPos_14 := mload(_1)
                        mstore(memPos_14, cleaned)
                        return(memPos_14, 32)
                    }
                    case 0x92d9f8a4 {
                        if callvalue() { revert(_3, _3) }
                        if slt(add(calldatasize(), not(3)), _3) { revert(_3, _3) }
                        let pos_2 := mload(_1)
                        let pos_3 := pos_2
                        let length_1 := sload(/** @src 32:6713:6724  "founderList" */ 0x0f)
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        mstore(pos_2, length_1)
                        let _42 := 0x20
                        pos_2 := add(pos_2, _42)
                        let pos_4 := pos_2
                        mstore(_3, /** @src 32:6713:6724  "founderList" */ 0x0f)
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        let srcPtr := 63806209331542711802848847270949280092855778197726125910674179583545433573378
                        let i_1 := _3
                        for { } lt(i_1, length_1) { i_1 := add(i_1, 1) }
                        {
                            mstore(pos_2, and(sload(srcPtr), sub(shl(160, 1), 1)))
                            pos_2 := add(pos_2, _42)
                            srcPtr := add(srcPtr, 1)
                        }
                        finalize_allocation(pos_3, sub(pos_2, pos_3))
                        let memPos_15 := mload(_1)
                        let tail := add(memPos_15, _42)
                        mstore(memPos_15, _42)
                        let pos_5 := tail
                        let length_2 := mload(pos_3)
                        mstore(tail, length_2)
                        pos_5 := add(memPos_15, _1)
                        let srcPtr_1 := pos_4
                        let i_2 := _3
                        for { } lt(i_2, length_2) { i_2 := add(i_2, 1) }
                        {
                            mstore(pos_5, and(mload(srcPtr_1), sub(shl(160, 1), 1)))
                            pos_5 := add(pos_5, _42)
                            srcPtr_1 := add(srcPtr_1, _42)
                        }
                        return(memPos_15, sub(pos_5, memPos_15))
                    }
                    case 0x952d131e {
                        if callvalue() { revert(_3, _3) }
                        if slt(add(calldatasize(), not(3)), _3) { revert(_3, _3) }
                        let _43 := sload(/** @src 32:822:854  "uint256 public founderDepositCap" */ 16)
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        let memPos_16 := mload(_1)
                        mstore(memPos_16, _43)
                        return(memPos_16, 32)
                    }
                    case 0x95d89b41 {
                        if callvalue() { revert(_3, _3) }
                        if slt(add(calldatasize(), not(3)), _3) { revert(_3, _3) }
                        let memPtr_7 := mload(_1)
                        let ret_3 := _3
                        let slotValue_1 := sload(/** @src 10:2453:2460  "_symbol" */ 0x05)
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        let length_3 := _3
                        let _44 := 1
                        length_3 := shr(_44, slotValue_1)
                        let outOfPlaceEncoding_1 := and(slotValue_1, _44)
                        if iszero(outOfPlaceEncoding_1)
                        {
                            length_3 := and(length_3, 0x7f)
                        }
                        let _45 := 32
                        if eq(outOfPlaceEncoding_1, lt(length_3, _45))
                        {
                            mstore(_3, shl(224, 0x4e487b71))
                            mstore(_2, 0x22)
                            revert(_3, 0x24)
                        }
                        mstore(memPtr_7, length_3)
                        switch outOfPlaceEncoding_1
                        case 0 {
                            mstore(add(memPtr_7, _45), and(slotValue_1, not(255)))
                            ret_3 := add(add(memPtr_7, shl(/** @src 10:2453:2460  "_symbol" */ 0x05, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ iszero(iszero(length_3)))), _45)
                        }
                        case 1 {
                            mstore(_3, /** @src 10:2453:2460  "_symbol" */ 0x05)
                            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                            let dataPos_1 := 1546678032441257452667456735582814959992782782816731922691272282333561699760
                            let i_3 := _3
                            for { } lt(i_3, length_3) { i_3 := add(i_3, _45) }
                            {
                                mstore(add(add(memPtr_7, i_3), _45), sload(dataPos_1))
                                dataPos_1 := add(dataPos_1, _44)
                            }
                            ret_3 := add(add(memPtr_7, i_3), _45)
                        }
                        finalize_allocation(memPtr_7, sub(ret_3, memPtr_7))
                        let memPos_17 := mload(_1)
                        return(memPos_17, sub(abi_encode_string(memPos_17, memPtr_7), memPos_17))
                    }
                    case 0x99eabeb9 {
                        if callvalue() { revert(_3, _3) }
                        if slt(add(calldatasize(), not(3)), 32) { revert(_3, _3) }
                        mstore(_3, and(abi_decode_address_26444(), sub(shl(160, 1), 1)))
                        mstore(32, /** @src 33:1923:1968  "mapping(address => uint256) public rewardOwed" */ 12)
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        let _46 := sload(keccak256(_3, _1))
                        let memPos_18 := mload(_1)
                        mstore(memPos_18, _46)
                        return(memPos_18, 32)
                    }
                    case 0xa457c2d7 {
                        if callvalue() { revert(_3, _3) }
                        if slt(add(calldatasize(), not(3)), _1) { revert(_3, _3) }
                        let value0_4 := abi_decode_address_26444()
                        let value_3 := calldataload(36)
                        mstore(_3, /** @src 21:719:729  "msg.sender" */ caller())
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        mstore(32, /** @src 10:4089:4100  "_allowances" */ 0x02)
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        let _47 := keccak256(_3, _1)
                        mstore(_3, and(value0_4, sub(shl(160, 1), 1)))
                        mstore(32, _47)
                        let _48 := sload(keccak256(_3, _1))
                        if /** @src 10:6809:6844  "currentAllowance >= subtractedValue" */ lt(_48, value_3)
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        {
                            let memPtr_8 := mload(_1)
                            mstore(memPtr_8, shl(229, 4594637))
                            mstore(add(memPtr_8, _2), 32)
                            mstore(add(memPtr_8, 36), 37)
                            mstore(add(memPtr_8, 68), "ERC20: decreased allowance below")
                            mstore(add(memPtr_8, 100), " zero")
                            revert(memPtr_8, 132)
                        }
                        /// @src 10:6945:6979  "currentAllowance - subtractedValue"
                        fun_approve(/** @src 21:719:729  "msg.sender" */ caller(), /** @src 10:6945:6979  "currentAllowance - subtractedValue" */ value0_4, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ sub(/** @src 10:6945:6979  "currentAllowance - subtractedValue" */ _48, value_3))
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        let memPos_19 := mload(_1)
                        mstore(memPos_19, 1)
                        return(memPos_19, 32)
                    }
                    case 0xa9059cbb {
                        if callvalue() { revert(_3, _3) }
                        if slt(add(calldatasize(), not(3)), _1) { revert(_3, _3) }
                        let value0_5 := abi_decode_address_26444()
                        /// @src 10:3881:3887  "amount"
                        fun_transfer(/** @src 21:719:729  "msg.sender" */ caller(), /** @src 10:3881:3887  "amount" */ value0_5, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ calldataload(36))
                        let memPos_20 := mload(_1)
                        mstore(memPos_20, 1)
                        return(memPos_20, 32)
                    }
                    case 0xb818cd62 {
                        if callvalue() { revert(_3, _3) }
                        if slt(add(calldatasize(), not(3)), _3) { revert(_3, _3) }
                        let _49 := sload(/** @src 33:1697:1733  "uint256 public cumulativeRewardShare" */ 10)
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        let memPos_21 := mload(_1)
                        mstore(memPos_21, _49)
                        return(memPos_21, 32)
                    }
                    case 0xc6cafc5e {
                        if callvalue() { revert(_3, _3) }
                        if slt(add(calldatasize(), not(3)), 32) { revert(_3, _3) }
                        mstore(_3, and(abi_decode_address_26444(), sub(shl(160, 1), 1)))
                        mstore(32, /** @src 33:1816:1876  "mapping(address => uint256) public lastCumulativeRewardShare" */ 11)
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        let _50 := sload(keccak256(_3, _1))
                        let memPos_22 := mload(_1)
                        mstore(memPos_22, _50)
                        return(memPos_22, 32)
                    }
                    case 0xc75a6224 {
                        if callvalue() { revert(_3, _3) }
                        if slt(add(calldatasize(), not(3)), 32) { revert(_3, _3) }
                        let value_4 := calldataload(_2)
                        /// @src 32:788:816  "address[] public founderList"
                        if iszero(lt(value_4, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ sload(/** @src 32:788:816  "address[] public founderList" */ 15)))
                        {
                            revert(/** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _3, _3)
                        }
                        mstore(_3, /** @src 32:788:816  "address[] public founderList" */ 15)
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        let value_5 := and(sload(add(63806209331542711802848847270949280092855778197726125910674179583545433573378, value_4)), sub(shl(160, 1), 1))
                        let memPos_23 := mload(_1)
                        mstore(memPos_23, value_5)
                        return(memPos_23, 32)
                    }
                    case 0xd6c54d3c {
                        if callvalue() { revert(_3, _3) }
                        let _51 := 32
                        if slt(add(calldatasize(), not(3)), _51) { revert(_3, _3) }
                        let _52 := and(abi_decode_address_26444(), sub(shl(160, 1), 1))
                        mstore(_3, _52)
                        /// @src 32:6226:6236  "userNFTIds"
                        let _53 := 0x0d
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        mstore(_51, /** @src 32:6226:6236  "userNFTIds" */ _53)
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        let length_4 := sload(keccak256(_3, _1))
                        let _54 := array_allocation_size_array_uint256_dyn(length_4)
                        let memPtr_9 := mload(_1)
                        finalize_allocation(memPtr_9, _54)
                        mstore(memPtr_9, length_4)
                        let dataSize := array_allocation_size_array_uint256_dyn(length_4)
                        let dataStart := add(memPtr_9, _51)
                        calldatacopy(dataStart, calldatasize(), add(dataSize, not(31)))
                        /// @src 32:6307:6316  "uint256 i"
                        let var_i_2 := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _3
                        /// @src 32:6302:6395  "for (uint256 i; i < numOfNFTs; i++) {..."
                        for { }
                        /** @src 32:6318:6331  "i < numOfNFTs" */ lt(var_i_2, length_4)
                        /// @src 32:6307:6316  "uint256 i"
                        {
                            /// @src 32:6333:6336  "i++"
                            var_i_2 := increment_uint256(var_i_2)
                        }
                        {
                            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                            mstore(_3, _52)
                            mstore(_51, /** @src 32:6226:6236  "userNFTIds" */ _53)
                            /// @src 26:4997:5015  "set._values[index]"
                            let _55, _56 := storage_array_index_access_address_dyn(/** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ keccak256(_3, _1), /** @src 26:4997:5015  "set._values[index]" */ var_i_2)
                            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                            mstore(/** @src 32:6352:6384  "ids[i] = userNFTIds[_user].at(i)" */ memory_array_index_access_address_dyn(memPtr_9, var_i_2), /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ shr(shl(3, _56), sload(/** @src 26:4997:5015  "set._values[index]" */ _55)))
                        }
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        let memPos_24 := mload(_1)
                        let tail_1 := add(memPos_24, _51)
                        mstore(memPos_24, _51)
                        let pos_6 := tail_1
                        let length_5 := mload(memPtr_9)
                        mstore(tail_1, length_5)
                        pos_6 := add(memPos_24, _1)
                        let srcPtr_2 := dataStart
                        let i_4 := _3
                        for { } lt(i_4, length_5) { i_4 := add(i_4, 1) }
                        {
                            mstore(pos_6, mload(srcPtr_2))
                            pos_6 := add(pos_6, _51)
                            srcPtr_2 := add(srcPtr_2, _51)
                        }
                        return(memPos_24, sub(pos_6, memPos_24))
                    }
                    case 0xdd62ed3e {
                        if callvalue() { revert(_3, _3) }
                        if slt(add(calldatasize(), not(3)), _1) { revert(_3, _3) }
                        let value0_6 := abi_decode_address_26444()
                        let value1_1 := abi_decode_address()
                        let _57 := sub(shl(160, 1), 1)
                        mstore(_3, and(value0_6, _57))
                        mstore(32, /** @src 10:4089:4100  "_allowances" */ 0x02)
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        let _58 := keccak256(_3, _1)
                        mstore(_3, and(value1_1, _57))
                        mstore(32, _58)
                        let _59 := sload(keccak256(_3, _1))
                        let memPos_25 := mload(_1)
                        mstore(memPos_25, _59)
                        return(memPos_25, 32)
                    }
                    case 0xe0c2742c {
                        if callvalue() { revert(_3, _3) }
                        if slt(add(calldatasize(), not(3)), 96) { revert(_3, _3) }
                        let offset_2 := calldataload(_2)
                        let _60 := 0xffffffffffffffff
                        if gt(offset_2, _60) { revert(_3, _3) }
                        if iszero(slt(add(offset_2, 35), calldatasize())) { revert(_3, _3) }
                        let _61 := calldataload(add(_2, offset_2))
                        let _62 := 36
                        let _63 := array_allocation_size_array_uint256_dyn(_61)
                        let memPtr_10 := mload(_1)
                        finalize_allocation(memPtr_10, _63)
                        let dst := memPtr_10
                        mstore(memPtr_10, _61)
                        let _64 := 0x20
                        dst := add(memPtr_10, _64)
                        let dst_1 := dst
                        let srcEnd := add(add(offset_2, shl(5, _61)), _62)
                        if gt(srcEnd, calldatasize()) { revert(_3, _3) }
                        let src := add(offset_2, _62)
                        for { } lt(src, srcEnd) { src := add(src, _64) }
                        {
                            let value_6 := calldataload(src)
                            if iszero(eq(value_6, and(value_6, sub(shl(160, 1), 1)))) { revert(_3, _3) }
                            mstore(dst, value_6)
                            dst := add(dst, _64)
                        }
                        let offset_3 := calldataload(_62)
                        if gt(offset_3, _60) { revert(_3, _3) }
                        let value1_2 := abi_decode_array_uint256_dyn(add(_2, offset_3), calldatasize())
                        let value_7 := calldataload(68)
                        let _65 := iszero(value_7)
                        if iszero(eq(value_7, iszero(_65))) { revert(_3, _3) }
                        /// @src 7:1063:1125  "modifier onlyOwner() {..."
                        fun_checkOwner()
                        /// @src 32:2811:2827  "_founders.length"
                        let expr_1 := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mload(/** @src 32:2811:2827  "_founders.length" */ memPtr_10)
                        /// @src 32:2807:2884  "if (_founders.length != _balances.length) revert Olympus__MisMatchedLengths()"
                        if /** @src 32:2811:2847  "_founders.length != _balances.length" */ iszero(eq(expr_1, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mload(/** @src 32:2831:2847  "_balances.length" */ value1_2)))
                        /// @src 32:2807:2884  "if (_founders.length != _balances.length) revert Olympus__MisMatchedLengths()"
                        {
                            /// @src 32:2856:2884  "Olympus__MisMatchedLengths()"
                            let _66 := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mload(_1)
                            /// @src 32:2856:2884  "Olympus__MisMatchedLengths()"
                            mstore(_66, shl(224, 0xe9b829e7))
                            revert(_66, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _2)
                        }
                        /// @src 32:2948:2957  "uint256 i"
                        let var_i_3 := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _3
                        /// @src 32:2943:3091  "for (uint256 i; i < founderList.length; i++) {..."
                        for { }
                        /** @src 32:2948:2957  "uint256 i" */ 1
                        {
                            /// @src 32:2983:2986  "i++"
                            var_i_3 := increment_uint256(var_i_3)
                        }
                        {
                            /// @src 32:2959:2981  "i < founderList.length"
                            if iszero(lt(var_i_3, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ sload(/** @src 32:2963:2974  "founderList" */ 0x0f)))
                            /// @src 32:2959:2981  "i < founderList.length"
                            { break }
                            /// @src 32:3017:3031  "founderList[i]"
                            let _67, _68 := storage_array_index_access_address_dyn_26466(var_i_3)
                            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                            let _69 := sub(shl(160, 1), 1)
                            let _70 := sload(/** @src 32:3017:3031  "founderList[i]" */ _67)
                            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                            let _71 := 3
                            /// @src 32:3017:3031  "founderList[i]"
                            fun_updateRewards(/** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ and(shr(shl(_71, _68), _70), _69))
                            /// @src 32:3061:3075  "founderList[i]"
                            let _72, _73 := storage_array_index_access_address_dyn_26466(var_i_3)
                            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                            mstore(_3, and(shr(shl(_71, _73), sload(/** @src 32:3061:3075  "founderList[i]" */ _72)), /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _69))
                            mstore(_64, /** @src 32:3046:3060  "founderBalance" */ 0x0e)
                            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                            sstore(keccak256(_3, _1), _3)
                        }
                        /// @src 32:3159:3172  "uint256 total"
                        let var_total := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _3
                        /// @src 32:3187:3196  "uint256 i"
                        let var_i_4 := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _3
                        /// @src 32:3182:3410  "for (uint256 i; i < _founders.length; i++) {..."
                        for { }
                        /** @src 32:3187:3196  "uint256 i" */ 1
                        {
                            /// @src 32:3220:3223  "i++"
                            var_i_4 := increment_uint256(var_i_4)
                        }
                        {
                            /// @src 32:3198:3218  "i < _founders.length"
                            if iszero(lt(var_i_4, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mload(/** @src 32:3202:3218  "_founders.length" */ memPtr_10)))
                            /// @src 32:3198:3218  "i < _founders.length"
                            { break }
                            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                            let _74 := sub(shl(160, 1), 1)
                            /// @src 32:3239:3307  "if (_founders[i] == address(0)) revert Olympus__ZeroAddressFounder()"
                            if /** @src 32:3243:3269  "_founders[i] == address(0)" */ iszero(/** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ and(mload(/** @src 32:3243:3255  "_founders[i]" */ memory_array_index_access_address_dyn(memPtr_10, var_i_4)), /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _74))
                            /// @src 32:3239:3307  "if (_founders[i] == address(0)) revert Olympus__ZeroAddressFounder()"
                            {
                                /// @src 32:3278:3307  "Olympus__ZeroAddressFounder()"
                                let _75 := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mload(_1)
                                /// @src 32:3278:3307  "Olympus__ZeroAddressFounder()"
                                mstore(_75, shl(225, 0x05419e09))
                                revert(_75, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _2)
                            }
                            let _76 := mload(/** @src 32:3352:3364  "_balances[i]" */ memory_array_index_access_address_dyn(value1_2, var_i_4))
                            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                            mstore(_3, and(mload(/** @src 32:3336:3348  "_founders[i]" */ memory_array_index_access_address_dyn(memPtr_10, var_i_4)), /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _74))
                            mstore(_64, /** @src 32:3046:3060  "founderBalance" */ 0x0e)
                            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                            sstore(keccak256(_3, _1), _76)
                            /// @src 32:3378:3399  "total += _balances[i]"
                            var_total := checked_add_uint256(var_total, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mload(/** @src 32:3387:3399  "_balances[i]" */ memory_array_index_access_address_dyn(value1_2, var_i_4)))
                        }
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        let _77 := sload(/** @src 32:3497:3514  "founderDepositCap" */ 0x10)
                        /// @src 32:3485:3582  "if (total > founderDepositCap) revert Olympus__WrongFounderBalanceTotal(total, founderDepositCap)"
                        if /** @src 32:3489:3514  "total > founderDepositCap" */ gt(var_total, _77)
                        /// @src 32:3485:3582  "if (total > founderDepositCap) revert Olympus__WrongFounderBalanceTotal(total, founderDepositCap)"
                        {
                            /// @src 32:3523:3582  "Olympus__WrongFounderBalanceTotal(total, founderDepositCap)"
                            let _78 := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mload(_1)
                            /// @src 32:3523:3582  "Olympus__WrongFounderBalanceTotal(total, founderDepositCap)"
                            mstore(_78, shl(224, 0x986c04c3))
                            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                            mstore(/** @src 32:3523:3582  "Olympus__WrongFounderBalanceTotal(total, founderDepositCap)" */ add(_78, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _2), var_total)
                            mstore(add(/** @src 32:3523:3582  "Olympus__WrongFounderBalanceTotal(total, founderDepositCap)" */ _78, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _62), _77)
                            /// @src 32:3523:3582  "Olympus__WrongFounderBalanceTotal(total, founderDepositCap)"
                            revert(_78, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 68)
                        }
                        /// @src 32:3681:3929  "if (total < founderDepositCap) {..."
                        if /** @src 32:3685:3710  "total < founderDepositCap" */ lt(var_total, _77)
                        /// @src 32:3681:3929  "if (total < founderDepositCap) {..."
                        {
                            /// @src 32:3726:3808  "if (!_lowerCap) revert Olympus__WrongFounderBalanceTotal(total, founderDepositCap)"
                            if /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _65
                            /// @src 32:3726:3808  "if (!_lowerCap) revert Olympus__WrongFounderBalanceTotal(total, founderDepositCap)"
                            {
                                /// @src 32:3749:3808  "Olympus__WrongFounderBalanceTotal(total, founderDepositCap)"
                                let _79 := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mload(_1)
                                /// @src 32:3749:3808  "Olympus__WrongFounderBalanceTotal(total, founderDepositCap)"
                                mstore(_79, /** @src 32:3523:3582  "Olympus__WrongFounderBalanceTotal(total, founderDepositCap)" */ shl(224, 0x986c04c3))
                                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                                mstore(/** @src 32:3749:3808  "Olympus__WrongFounderBalanceTotal(total, founderDepositCap)" */ add(_79, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _2), var_total)
                                mstore(add(/** @src 32:3749:3808  "Olympus__WrongFounderBalanceTotal(total, founderDepositCap)" */ _79, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _62), _77)
                                /// @src 32:3749:3808  "Olympus__WrongFounderBalanceTotal(total, founderDepositCap)"
                                revert(_79, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 68)
                            }
                            sstore(/** @src 32:3838:3851  "totalDeposits" */ 0x08, /** @src 32:3838:3879  "totalDeposits - founderDepositCap + total" */ checked_add_uint256(/** @src 32:3838:3871  "totalDeposits - founderDepositCap" */ checked_sub_uint256(/** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ sload(/** @src 32:3838:3851  "totalDeposits" */ 0x08), /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _77), /** @src 32:3838:3879  "totalDeposits - founderDepositCap + total" */ var_total))
                            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                            sstore(/** @src 32:3497:3514  "founderDepositCap" */ 0x10, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ var_total)
                        }
                        let length_6 := mload(memPtr_10)
                        if gt(length_6, _60)
                        {
                            mstore(_3, shl(224, 0x4e487b71))
                            mstore(_2, 0x41)
                            revert(_3, _62)
                        }
                        if gt(length_6, 18446744073709551616)
                        {
                            mstore(_3, shl(224, 0x4e487b71))
                            mstore(_2, 0x41)
                            revert(_3, _62)
                        }
                        let oldLen := sload(/** @src 32:2963:2974  "founderList" */ 0x0f)
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        sstore(/** @src 32:2963:2974  "founderList" */ 0x0f, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ length_6)
                        if lt(length_6, oldLen)
                        {
                            let _80 := 63806209331542711802848847270949280092855778197726125910674179583545433573378
                            let _81 := add(_80, oldLen)
                            let start := add(_80, length_6)
                            for { } lt(start, _81) { start := add(start, 1) }
                            { sstore(start, _3) }
                        }
                        let srcPtr_3 := dst_1
                        mstore(_3, /** @src 32:2963:2974  "founderList" */ 0x0f)
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        let i_5 := _3
                        for { } lt(i_5, length_6) { i_5 := add(i_5, 1) }
                        {
                            let itemValue := and(mload(srcPtr_3), sub(shl(160, 1), 1))
                            srcPtr_3 := add(srcPtr_3, _64)
                            sstore(add(63806209331542711802848847270949280092855778197726125910674179583545433573378, i_5), itemValue)
                        }
                        return(mload(_1), _3)
                    }
                    case 0xe3e331f2 {
                        if callvalue() { revert(_3, _3) }
                        if slt(add(calldatasize(), not(3)), 32) { revert(_3, _3) }
                        mstore(_3, and(abi_decode_address_26444(), sub(shl(160, 1), 1)))
                        mstore(32, /** @src 32:733:782  "mapping(address => uint256) public founderBalance" */ 14)
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        let _82 := sload(keccak256(_3, _1))
                        let memPos_26 := mload(_1)
                        mstore(memPos_26, _82)
                        return(memPos_26, 32)
                    }
                    case 0xef5cfb8c {
                        if callvalue() { revert(_3, _3) }
                        let _83 := 32
                        if slt(add(calldatasize(), not(3)), _83) { revert(_3, _3) }
                        let value0_7 := abi_decode_address_26444()
                        /// @src 8:1204:1276  "modifier whenNotPaused() {..."
                        fun_requireNotPaused()
                        /// @src 9:2212:2315  "modifier nonReentrant() {..."
                        fun_nonReentrantBefore()
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        let _84 := sub(shl(160, 1), 1)
                        let _85 := and(/** @src 33:5431:5450  "_user == address(0)" */ value0_7, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _84)
                        /// @src 33:5427:5491  "if (_user == address(0)) revert RewardDistributor__ZeroAddress()"
                        if /** @src 33:5431:5450  "_user == address(0)" */ iszero(/** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _85)
                        /// @src 33:5427:5491  "if (_user == address(0)) revert RewardDistributor__ZeroAddress()"
                        {
                            /// @src 33:5459:5491  "RewardDistributor__ZeroAddress()"
                            let _86 := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mload(_1)
                            /// @src 33:5459:5491  "RewardDistributor__ZeroAddress()"
                            mstore(_86, shl(225, 0x0b94203f))
                            revert(_86, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _2)
                        }
                        /// @src 33:5516:5521  "_user"
                        fun_updateRewards(value0_7)
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        mstore(_3, _85)
                        mstore(_83, /** @src 33:5540:5550  "rewardOwed" */ 0x0c)
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        let _87 := sload(keccak256(_3, _1))
                        /// @src 33:5567:5621  "if (owed == 0) revert RewardDistributor__NothingOwed()"
                        if /** @src 33:5571:5580  "owed == 0" */ iszero(_87)
                        /// @src 33:5567:5621  "if (owed == 0) revert RewardDistributor__NothingOwed()"
                        {
                            /// @src 33:5589:5621  "RewardDistributor__NothingOwed()"
                            let _88 := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mload(_1)
                            /// @src 33:5589:5621  "RewardDistributor__NothingOwed()"
                            mstore(_88, shl(224, 0xdc5f40f3))
                            revert(_88, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _2)
                        }
                        sstore(/** @src 33:5631:5651  "totalRewards -= owed" */ 0x09, checked_sub_uint256(/** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ sload(/** @src 33:5631:5651  "totalRewards -= owed" */ 0x09), _87))
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        mstore(_3, _85)
                        mstore(_83, /** @src 33:5540:5550  "rewardOwed" */ 0x0c)
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        sstore(keccak256(_3, _1), _3)
                        let _89 := and(/** @src 33:5692:5703  "rewardToken" */ loadimmutable("28438"), /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _84)
                        /// @src 14:902:960  "abi.encodeWithSelector(token.transfer.selector, to, value)"
                        let expr_mpos := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mload(_1)
                        /// @src 14:902:960  "abi.encodeWithSelector(token.transfer.selector, to, value)"
                        let _90 := add(expr_mpos, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _83)
                        /// @src 14:902:960  "abi.encodeWithSelector(token.transfer.selector, to, value)"
                        mstore(_90, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ shl(224, 0xa9059cbb))
                        mstore(/** @src 14:902:960  "abi.encodeWithSelector(token.transfer.selector, to, value)" */ add(expr_mpos, 36), /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _85)
                        mstore(add(/** @src 14:902:960  "abi.encodeWithSelector(token.transfer.selector, to, value)" */ expr_mpos, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 68), _87)
                        /// @src 14:902:960  "abi.encodeWithSelector(token.transfer.selector, to, value)"
                        mstore(expr_mpos, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 68)
                        let newFreePtr := add(expr_mpos, 128)
                        let _91 := 0xffffffffffffffff
                        if or(gt(newFreePtr, _91), lt(newFreePtr, expr_mpos))
                        {
                            mstore(_3, shl(224, 0x4e487b71))
                            mstore(_2, 0x41)
                            revert(_3, /** @src 14:902:960  "abi.encodeWithSelector(token.transfer.selector, to, value)" */ 36)
                        }
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        let newFreePtr_1 := add(expr_mpos, 192)
                        if or(gt(newFreePtr_1, _91), lt(newFreePtr_1, newFreePtr))
                        {
                            mstore(_3, shl(224, 0x4e487b71))
                            mstore(_2, 0x41)
                            revert(_3, /** @src 14:902:960  "abi.encodeWithSelector(token.transfer.selector, to, value)" */ 36)
                        }
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        mstore(_1, newFreePtr_1)
                        mstore(newFreePtr, _83)
                        mstore(add(expr_mpos, 160), "SafeERC20: low-level call failed")
                        /// @src 20:5282:5313  "target.call{value: value}(data)"
                        let expr_component := call(gas(), _89, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _3, /** @src 20:5282:5313  "target.call{value: value}(data)" */ _90, mload(expr_mpos), /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _3, _3)
                        /// @src 20:5282:5313  "target.call{value: value}(data)"
                        let data := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _3
                        switch returndatasize()
                        case 0 { data := 96 }
                        default {
                            let _92 := returndatasize()
                            let _93 := array_allocation_size_bytes(_92)
                            let memPtr_11 := mload(_1)
                            finalize_allocation(memPtr_11, _93)
                            mstore(memPtr_11, _92)
                            data := memPtr_11
                            returndatacopy(add(memPtr_11, _83), _3, returndatasize())
                        }
                        /// @src 20:5323:5399  "return verifyCallResultFromTarget(target, success, returndata, errorMessage)"
                        let var_mpos := /** @src 20:5330:5399  "verifyCallResultFromTarget(target, success, returndata, errorMessage)" */ fun_verifyCallResultFromTarget(_89, expr_component, /** @src 20:5282:5313  "target.call{value: value}(data)" */ data, /** @src 20:5330:5399  "verifyCallResultFromTarget(target, success, returndata, errorMessage)" */ newFreePtr)
                        /// @src 14:4275:4292  "returndata.length"
                        let expr_2 := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mload(/** @src 14:4275:4292  "returndata.length" */ var_mpos)
                        /// @src 14:4271:4447  "if (returndata.length > 0) {..."
                        if /** @src 14:4275:4296  "returndata.length > 0" */ iszero(iszero(expr_2))
                        /// @src 14:4271:4447  "if (returndata.length > 0) {..."
                        {
                            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                            if slt(sub(/** @src 14:4359:4389  "abi.decode(returndata, (bool))" */ add(var_mpos, expr_2), var_mpos), /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _83) { revert(_3, _3) }
                            let value_8 := mload(/** @src 14:4359:4389  "abi.decode(returndata, (bool))" */ add(var_mpos, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _83))
                            let _94 := iszero(value_8)
                            if iszero(eq(value_8, iszero(_94))) { revert(_3, _3) }
                            if _94
                            {
                                let memPtr_12 := mload(_1)
                                mstore(memPtr_12, shl(229, 4594637))
                                mstore(add(memPtr_12, _2), _83)
                                mstore(add(memPtr_12, /** @src 14:902:960  "abi.encodeWithSelector(token.transfer.selector, to, value)" */ 36), /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 42)
                                mstore(add(memPtr_12, 68), "SafeERC20: ERC20 operation did n")
                                mstore(add(memPtr_12, 100), "ot succeed")
                                revert(memPtr_12, 132)
                            }
                        }
                        sstore(/** @src 9:2790:2812  "_status = _NOT_ENTERED" */ 0x07, /** @src 20:5157:5187  "address(this).balance >= value" */ 1)
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        let memPos_27 := mload(_1)
                        mstore(memPos_27, _87)
                        return(memPos_27, _83)
                    }
                    case 0xf2fde38b {
                        if callvalue() { revert(_3, _3) }
                        if slt(add(calldatasize(), not(3)), 32) { revert(_3, _3) }
                        let value0_8 := abi_decode_address_26444()
                        /// @src 7:1063:1125  "modifier onlyOwner() {..."
                        fun_checkOwner()
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        let _95 := sub(shl(160, 1), 1)
                        let _96 := and(/** @src 7:2169:2191  "newOwner != address(0)" */ value0_8, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _95)
                        if /** @src 7:2169:2191  "newOwner != address(0)" */ iszero(/** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _96)
                        {
                            let memPtr_13 := mload(_1)
                            mstore(memPtr_13, shl(229, 4594637))
                            mstore(add(memPtr_13, _2), 32)
                            mstore(add(memPtr_13, 36), 38)
                            mstore(add(memPtr_13, 68), "Ownable: new owner is the zero a")
                            mstore(add(memPtr_13, 100), "ddress")
                            revert(memPtr_13, 132)
                        }
                        let _97 := sload(_3)
                        sstore(_3, or(and(_97, shl(160, 0xffffffffffffffffffffffff)), _96))
                        let _98 := mload(_1)
                        /// @src 7:2573:2613  "OwnershipTransferred(oldOwner, newOwner)"
                        log3(/** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _98, _3, /** @src 7:2573:2613  "OwnershipTransferred(oldOwner, newOwner)" */ 0x8be0079c531659141344cd1fd0a4f28419497f9722a3daafe3b4186f6b6457e0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ and(_97, _95), /** @src 7:2573:2613  "OwnershipTransferred(oldOwner, newOwner)" */ _96)
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        return(_98, _3)
                    }
                    case 0xf7c618c1 {
                        if callvalue() { revert(_3, _3) }
                        if slt(add(calldatasize(), not(3)), _3) { revert(_3, _3) }
                        let memPos_28 := mload(_1)
                        mstore(memPos_28, and(/** @src 33:2003:2037  "ERC20 public immutable rewardToken" */ loadimmutable("28438"), /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ sub(shl(160, 1), 1)))
                        return(memPos_28, 32)
                    }
                }
                revert(0, 0)
            }
            function abi_decode_address_26444() -> value
            {
                value := calldataload(4)
                if iszero(eq(value, and(value, sub(shl(160, 1), 1)))) { revert(0, 0) }
            }
            function abi_decode_address() -> value
            {
                value := calldataload(36)
                if iszero(eq(value, and(value, sub(shl(160, 1), 1)))) { revert(0, 0) }
            }
            function abi_encode_string(headStart, value0) -> tail
            {
                let _1 := 32
                mstore(headStart, _1)
                let length := mload(value0)
                mstore(add(headStart, _1), length)
                let i := 0
                for { } lt(i, length) { i := add(i, _1) }
                {
                    mstore(add(add(headStart, i), 64), mload(add(add(value0, i), _1)))
                }
                mstore(add(add(headStart, length), 64), 0)
                tail := add(add(headStart, and(add(length, 31), not(31))), 64)
            }
            function finalize_allocation_26446(memPtr)
            {
                if gt(memPtr, 0xffffffffffffffff)
                {
                    mstore(0, shl(224, 0x4e487b71))
                    mstore(4, 0x41)
                    revert(0, 0x24)
                }
                mstore(64, memPtr)
            }
            function finalize_allocation(memPtr, size)
            {
                let newFreePtr := add(memPtr, and(add(size, 31), not(31)))
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr))
                {
                    mstore(0, shl(224, 0x4e487b71))
                    mstore(4, 0x41)
                    revert(0, 0x24)
                }
                mstore(64, newFreePtr)
            }
            function array_allocation_size_array_uint256_dyn(length) -> size
            {
                if gt(length, 0xffffffffffffffff)
                {
                    mstore(0, shl(224, 0x4e487b71))
                    mstore(4, 0x41)
                    revert(0, 0x24)
                }
                size := add(shl(5, length), 0x20)
            }
            function abi_decode_array_uint256_dyn(offset, end) -> array
            {
                if iszero(slt(add(offset, 0x1f), end)) { revert(0, 0) }
                let _1 := calldataload(offset)
                let _2 := 0x20
                let _3 := array_allocation_size_array_uint256_dyn(_1)
                let memPtr := mload(64)
                finalize_allocation(memPtr, _3)
                let dst := memPtr
                mstore(memPtr, _1)
                dst := add(memPtr, _2)
                let srcEnd := add(add(offset, shl(5, _1)), _2)
                if gt(srcEnd, end)
                {
                    revert(/** @src -1:-1:-1 */ 0, 0)
                }
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                let src := add(offset, _2)
                for { } lt(src, srcEnd) { src := add(src, _2) }
                {
                    mstore(dst, calldataload(src))
                    dst := add(dst, _2)
                }
                array := memPtr
            }
            function array_allocation_size_bytes(length) -> size
            {
                if gt(length, 0xffffffffffffffff)
                {
                    mstore(0, shl(224, 0x4e487b71))
                    mstore(4, 0x41)
                    revert(0, 0x24)
                }
                size := add(and(add(length, 31), not(31)), 0x20)
            }
            function storage_array_index_access_address_dyn_26466(index) -> slot, offset
            {
                if iszero(lt(index, sload(/** @src 32:2963:2974  "founderList" */ 0x0f)))
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                {
                    mstore(0, shl(224, 0x4e487b71))
                    mstore(4, 0x32)
                    revert(0, 0x24)
                }
                mstore(/** @src -1:-1:-1 */ 0, /** @src 32:2963:2974  "founderList" */ 0x0f)
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                slot := add(63806209331542711802848847270949280092855778197726125910674179583545433573378, index)
                offset := /** @src -1:-1:-1 */ 0
            }
            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
            function storage_array_index_access_address_dyn(array, index) -> slot, offset
            {
                if iszero(lt(index, sload(array)))
                {
                    mstore(0, shl(224, 0x4e487b71))
                    mstore(4, 0x32)
                    revert(0, 0x24)
                }
                mstore(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ array)
                slot := add(keccak256(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0x20), index)
                offset := /** @src -1:-1:-1 */ 0
            }
            /// @ast-id 23203 @src 7:1359:1489  "function _checkOwner() internal view virtual {..."
            function fun_checkOwner()
            {
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                let cleaned := and(sload(/** @src 7:1273:1279  "_owner" */ 0x00), /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ sub(shl(160, 1), 1))
                if iszero(/** @src 7:1422:1445  "owner() == _msgSender()" */ eq(/** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ cleaned, /** @src 21:719:729  "msg.sender" */ caller()))
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                {
                    let memPtr := mload(64)
                    mstore(memPtr, shl(229, 4594637))
                    mstore(add(memPtr, 4), 32)
                    mstore(add(memPtr, 36), 32)
                    mstore(add(memPtr, 68), "Ownable: caller is not the owner")
                    revert(memPtr, 100)
                }
            }
            function checked_add_uint256(x, y) -> sum
            {
                sum := add(x, y)
                if gt(x, sum)
                {
                    mstore(0, shl(224, 0x4e487b71))
                    mstore(4, 0x11)
                    revert(0, 0x24)
                }
            }
            /// @ast-id 23770 @src 10:7473:8291  "function _transfer(..."
            function fun_transfer(var_from, var_to, var_amount)
            {
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                let _1 := sub(shl(160, 1), 1)
                let _2 := and(/** @src 10:7599:7617  "from != address(0)" */ var_from, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _1)
                /// @src 10:7599:7617  "from != address(0)"
                let _3 := iszero(/** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _2)
                /// @src 10:7599:7617  "from != address(0)"
                let _4 := iszero(_3)
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                if _3
                {
                    let memPtr := mload(64)
                    mstore(memPtr, shl(229, 4594637))
                    mstore(add(memPtr, 4), 32)
                    mstore(add(memPtr, 36), 37)
                    mstore(add(memPtr, 68), "ERC20: transfer from the zero ad")
                    mstore(add(memPtr, 100), "dress")
                    revert(memPtr, 132)
                }
                let _5 := and(/** @src 10:7677:7693  "to != address(0)" */ var_to, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _1)
                /// @src 10:7677:7693  "to != address(0)"
                let _6 := iszero(/** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _5)
                if _6
                {
                    let memPtr_1 := mload(64)
                    mstore(memPtr_1, shl(229, 4594637))
                    mstore(add(memPtr_1, 4), 32)
                    mstore(add(memPtr_1, 36), 35)
                    mstore(add(memPtr_1, 68), "ERC20: transfer to the zero addr")
                    mstore(add(memPtr_1, 100), "ess")
                    revert(memPtr_1, 132)
                }
                /// @src 33:6117:6155  "from != address(0) && to != address(0)"
                let expr := _4
                if _4
                {
                    expr := /** @src 10:7677:7693  "to != address(0)" */ iszero(_6)
                }
                /// @src 33:6113:6204  "if (from != address(0) && to != address(0)) revert RewardDistributor__TransfersNotAllowed()"
                if expr
                {
                    /// @src 33:6164:6204  "RewardDistributor__TransfersNotAllowed()"
                    let _7 := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mload(64)
                    /// @src 33:6164:6204  "RewardDistributor__TransfersNotAllowed()"
                    mstore(_7, shl(226, 0x08e4188f))
                    revert(_7, 4)
                }
                /// @src 10:7615:7616  "0"
                let _8 := 0x00
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                mstore(/** @src 10:7615:7616  "0" */ _8, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _2)
                mstore(0x20, /** @src 10:7815:7824  "_balances" */ 0x01)
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                let _9 := sload(keccak256(/** @src 10:7615:7616  "0" */ _8, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0x40))
                if /** @src 10:7848:7869  "fromBalance >= amount" */ lt(_9, var_amount)
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                {
                    let memPtr_2 := mload(0x40)
                    mstore(memPtr_2, shl(229, 4594637))
                    mstore(add(memPtr_2, 4), 0x20)
                    mstore(add(memPtr_2, 36), 38)
                    mstore(add(memPtr_2, 68), "ERC20: transfer amount exceeds b")
                    mstore(add(memPtr_2, 100), "alance")
                    revert(memPtr_2, 132)
                }
                mstore(/** @src 10:7615:7616  "0" */ _8, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _2)
                mstore(0x20, /** @src 10:7815:7824  "_balances" */ 0x01)
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                sstore(keccak256(/** @src 10:7615:7616  "0" */ _8, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0x40), sub(/** @src 10:7964:7984  "fromBalance - amount" */ _9, var_amount))
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                mstore(/** @src 10:7615:7616  "0" */ _8, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _5)
                let dataSlot := keccak256(/** @src 10:7615:7616  "0" */ _8, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0x40)
                sstore(dataSlot, add(sload(/** @src 10:8161:8184  "_balances[to] += amount" */ dataSlot), /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ var_amount))
                /// @src 10:8210:8236  "Transfer(from, to, amount)"
                let _10 := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mload(0x40)
                mstore(_10, var_amount)
                /// @src 10:8210:8236  "Transfer(from, to, amount)"
                log3(_10, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0x20, /** @src 10:8210:8236  "Transfer(from, to, amount)" */ 0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef, _2, _5)
            }
            /// @ast-id 23944 @src 10:10504:10874  "function _approve(..."
            function fun_approve(var_owner, var_spender, var_amount)
            {
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                let _1 := sub(shl(160, 1), 1)
                let _2 := and(/** @src 10:10635:10654  "owner != address(0)" */ var_owner, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _1)
                if /** @src 10:10635:10654  "owner != address(0)" */ iszero(/** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _2)
                {
                    let memPtr := mload(64)
                    mstore(memPtr, shl(229, 4594637))
                    mstore(add(memPtr, 4), 32)
                    mstore(add(memPtr, 36), 36)
                    mstore(add(memPtr, 68), "ERC20: approve from the zero add")
                    mstore(add(memPtr, 100), "ress")
                    revert(memPtr, 132)
                }
                let _3 := and(/** @src 10:10713:10734  "spender != address(0)" */ var_spender, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _1)
                if /** @src 10:10713:10734  "spender != address(0)" */ iszero(/** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _3)
                {
                    let memPtr_1 := mload(64)
                    mstore(memPtr_1, shl(229, 4594637))
                    mstore(add(memPtr_1, 4), 32)
                    mstore(add(memPtr_1, 36), 34)
                    mstore(add(memPtr_1, 68), "ERC20: approve to the zero addre")
                    mstore(add(memPtr_1, 100), "ss")
                    revert(memPtr_1, 132)
                }
                mstore(/** @src 10:10652:10653  "0" */ 0x00, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _2)
                mstore(0x20, /** @src 10:10784:10795  "_allowances" */ 0x02)
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                let _4 := keccak256(/** @src 10:10652:10653  "0" */ 0x00, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0x40)
                mstore(/** @src 10:10652:10653  "0" */ 0x00, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _3)
                mstore(0x20, _4)
                sstore(keccak256(/** @src 10:10652:10653  "0" */ 0x00, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0x40), var_amount)
                /// @src 10:10835:10867  "Approval(owner, spender, amount)"
                let _5 := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mload(0x40)
                mstore(_5, var_amount)
                /// @src 10:10835:10867  "Approval(owner, spender, amount)"
                log3(_5, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0x20, /** @src 10:10835:10867  "Approval(owner, spender, amount)" */ 0x8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925, _2, _3)
            }
            /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
            function increment_uint256(value) -> ret
            {
                if eq(value, /** @src 10:11371:11388  "type(uint256).max" */ not(0))
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                {
                    mstore(0, shl(224, 0x4e487b71))
                    mstore(4, 0x11)
                    revert(0, 0x24)
                }
                ret := add(value, 1)
            }
            function memory_array_index_access_address_dyn(baseRef, index) -> addr
            {
                if iszero(lt(index, mload(baseRef)))
                {
                    mstore(0, shl(224, 0x4e487b71))
                    mstore(4, 0x32)
                    revert(0, 0x24)
                }
                addr := add(add(baseRef, shl(5, index)), 32)
            }
            function checked_sub_uint256(x, y) -> diff
            {
                diff := sub(x, y)
                if gt(diff, x)
                {
                    mstore(0, shl(224, 0x4e487b71))
                    mstore(4, 0x11)
                    revert(0, 0x24)
                }
            }
            function update_byte_slice_dynamic32(value, shiftBytes, toInsert) -> result
            {
                let shiftBits := shl(3, shiftBytes)
                let mask := shl(shiftBits, /** @src 10:11371:11388  "type(uint256).max" */ not(0))
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                result := or(and(value, not(mask)), and(shl(shiftBits, toInsert), mask))
            }
            /// @ast-id 23325 @src 8:1767:1873  "function _requireNotPaused() internal view virtual {..."
            function fun_requireNotPaused()
            {
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                if iszero(/** @src 8:1836:1845  "!paused()" */ iszero(/** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ and(sload(/** @src 8:1685:1692  "_paused" */ 0x06), /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0xff)))
                {
                    let memPtr := mload(64)
                    mstore(memPtr, shl(229, 4594637))
                    mstore(add(memPtr, 4), 32)
                    mstore(add(memPtr, 36), 16)
                    mstore(add(memPtr, 68), "Pausable: paused")
                    revert(memPtr, 100)
                }
            }
            /// @ast-id 23414 @src 9:2321:2604  "function _nonReentrantBefore() private {..."
            function fun_nonReentrantBefore()
            {
                /// @src 9:1744:1745  "2"
                if /** @src 9:2449:2468  "_status != _ENTERED" */ eq(/** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ sload(/** @src 9:2449:2456  "_status" */ 0x07), /** @src 9:1744:1745  "2" */ 0x02)
                {
                    let memPtr := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mload(64)
                    /// @src 9:1744:1745  "2"
                    mstore(memPtr, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ shl(229, 4594637))
                    /// @src 9:1744:1745  "2"
                    mstore(add(memPtr, 4), 32)
                    /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                    mstore(/** @src 9:1744:1745  "2" */ add(memPtr, 36), 31)
                    mstore(/** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ add(/** @src 9:1744:1745  "2" */ memPtr, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 68), /** @src 9:1744:1745  "2" */ "ReentrancyGuard: reentrant call")
                    revert(memPtr, 100)
                }
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                sstore(/** @src 9:2449:2456  "_status" */ 0x07, /** @src 9:1744:1745  "2" */ 0x02)
            }
            /// @ast-id 26883 @src 26:2206:2610  "function _add(Set storage set, bytes32 value) private returns (bool) {..."
            function fun_add(var_set_slot, var_value) -> var
            {
                /// @src 26:4343:4355  "set._indexes"
                let _1 := add(var_set_slot, 1)
                /// @src -1:-1:-1
                let _2 := 0
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                mstore(/** @src -1:-1:-1 */ _2, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ var_value)
                mstore(0x20, _1)
                /// @src 26:2285:2604  "if (!_contains(set, value)) {..."
                switch /** @src 26:4343:4367  "set._indexes[value] != 0" */ iszero(/** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ sload(keccak256(/** @src -1:-1:-1 */ _2, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0x40)))
                case /** @src 26:2285:2604  "if (!_contains(set, value)) {..." */ 0 {
                    /// @src 26:2581:2593  "return false"
                    var := /** @src -1:-1:-1 */ _2
                    /// @src 26:2581:2593  "return false"
                    leave
                }
                default /// @src 26:2285:2604  "if (!_contains(set, value)) {..."
                {
                    /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                    let oldLen := sload(var_set_slot)
                    if iszero(lt(oldLen, 18446744073709551616))
                    {
                        mstore(/** @src -1:-1:-1 */ _2, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ shl(224, 0x4e487b71))
                        mstore(4, 0x41)
                        revert(/** @src -1:-1:-1 */ _2, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0x24)
                    }
                    sstore(var_set_slot, add(oldLen, /** @src 26:4343:4355  "set._indexes" */ 1))
                    /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                    let slot, offset := storage_array_index_access_address_dyn(var_set_slot, oldLen)
                    sstore(slot, update_byte_slice_dynamic32(sload(slot), offset, var_value))
                    let _3 := sload(/** @src 26:2507:2525  "set._values.length" */ var_set_slot)
                    /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                    mstore(/** @src -1:-1:-1 */ _2, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ var_value)
                    mstore(0x20, _1)
                    sstore(keccak256(/** @src -1:-1:-1 */ _2, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0x40), _3)
                    /// @src 26:2539:2550  "return true"
                    var := /** @src 26:4343:4355  "set._indexes" */ 1
                    /// @src 26:2539:2550  "return true"
                    leave
                }
            }
            /// @ast-id 26967 @src 26:2778:4166  "function _remove(Set storage set, bytes32 value) private returns (bool) {..."
            function fun_remove(var_set_26887_slot, var_value) -> var
            {
                /// @src 26:2981:2993  "set._indexes"
                let _1 := add(var_set_26887_slot, 1)
                /// @src -1:-1:-1
                let _2 := 0
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                mstore(/** @src -1:-1:-1 */ _2, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ var_value)
                mstore(0x20, _1)
                let _3 := sload(keccak256(/** @src -1:-1:-1 */ _2, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0x40))
                /// @src 26:3011:4160  "if (valueIndex != 0) {..."
                switch /** @src 26:3015:3030  "valueIndex != 0" */ iszero(iszero(_3))
                case /** @src 26:3011:4160  "if (valueIndex != 0) {..." */ 0 {
                    /// @src 26:4137:4149  "return false"
                    var := /** @src -1:-1:-1 */ _2
                    /// @src 26:4137:4149  "return false"
                    leave
                }
                default /// @src 26:3011:4160  "if (valueIndex != 0) {..."
                {
                    /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                    let _4 := /** @src 10:11371:11388  "type(uint256).max" */ not(0)
                    /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                    let diff := add(_3, _4)
                    if gt(diff, _3)
                    {
                        mstore(/** @src -1:-1:-1 */ _2, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ shl(224, 0x4e487b71))
                        mstore(4, 0x11)
                        revert(/** @src -1:-1:-1 */ _2, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0x24)
                    }
                    let _5 := sload(/** @src 26:3456:3474  "set._values.length" */ var_set_26887_slot)
                    /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                    let diff_1 := add(_5, _4)
                    if gt(diff_1, _5)
                    {
                        mstore(/** @src -1:-1:-1 */ _2, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ shl(224, 0x4e487b71))
                        mstore(4, 0x11)
                        revert(/** @src -1:-1:-1 */ _2, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0x24)
                    }
                    /// @src 26:3493:3891  "if (lastIndex != toDeleteIndex) {..."
                    if /** @src 26:3497:3523  "lastIndex != toDeleteIndex" */ iszero(eq(diff_1, diff))
                    /// @src 26:3493:3891  "if (lastIndex != toDeleteIndex) {..."
                    {
                        /// @src 26:3563:3585  "set._values[lastIndex]"
                        let _6, _7 := storage_array_index_access_address_dyn(var_set_26887_slot, diff_1)
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        let value := shr(shl(3, _7), sload(/** @src 26:3563:3585  "set._values[lastIndex]" */ _6))
                        /// @src 26:3685:3711  "set._values[toDeleteIndex]"
                        let _8, _9 := storage_array_index_access_address_dyn(var_set_26887_slot, diff)
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        sstore(_8, update_byte_slice_dynamic32(sload(_8), _9, value))
                        mstore(/** @src -1:-1:-1 */ _2, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ value)
                        mstore(0x20, _1)
                        sstore(keccak256(/** @src -1:-1:-1 */ _2, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0x40), _3)
                    }
                    let oldLen := sload(var_set_26887_slot)
                    if iszero(oldLen)
                    {
                        mstore(/** @src -1:-1:-1 */ _2, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ shl(224, 0x4e487b71))
                        mstore(4, 0x31)
                        revert(/** @src -1:-1:-1 */ _2, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0x24)
                    }
                    let newLen := add(oldLen, _4)
                    let slot, offset := storage_array_index_access_address_dyn(var_set_26887_slot, newLen)
                    let _10 := sload(slot)
                    sstore(slot, and(_10, not(shl(shl(3, offset), _4))))
                    sstore(var_set_26887_slot, newLen)
                    mstore(/** @src -1:-1:-1 */ _2, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ var_value)
                    mstore(0x20, _1)
                    sstore(keccak256(/** @src -1:-1:-1 */ _2, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0x40), /** @src -1:-1:-1 */ _2)
                    /// @src 26:4095:4106  "return true"
                    var := /** @src 26:2981:2993  "set._indexes" */ 1
                    /// @src 26:4095:4106  "return true"
                    leave
                }
            }
            /// @ast-id 28371 @src 32:6486:6625  "function userBalance(address _user) public view override returns (uint256) {..."
            function fun_userBalance(var_user) -> var
            {
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                mstore(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ and(var_user, sub(shl(160, 1), 1)))
                mstore(0x20, /** @src 10:3506:3515  "_balances" */ 0x01)
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                let _1 := sload(keccak256(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0x40))
                mstore(0x20, /** @src 32:6597:6611  "founderBalance" */ 0x0e)
                /// @src 32:6571:6618  "return balanceOf(_user) + founderBalance[_user]"
                var := /** @src 32:6578:6618  "balanceOf(_user) + founderBalance[_user]" */ checked_add_uint256(_1, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ sload(keccak256(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0x40)))
            }
            /// @ast-id 28533 @src 33:3418:3736  "function pendingRewards(address _user) public view returns (uint256 reward) {..."
            function fun_pendingRewards(var_user) -> var_reward
            {
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                let _1 := and(var_user, sub(shl(160, 1), 1))
                mstore(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _1)
                mstore(0x20, /** @src 33:3561:3571  "rewardOwed" */ 0x0c)
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                let _2 := sload(keccak256(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0x40))
                /// @src 33:3638:3656  "userBalance(_user)"
                let expr := fun_userBalance(var_user)
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                let _3 := sload(/** @src 33:3665:3686  "cumulativeRewardShare" */ 0x0a)
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                mstore(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _1)
                mstore(0x20, /** @src 33:3689:3714  "lastCumulativeRewardShare" */ 0x0b)
                /// @src 33:3628:3729  "reward += userBalance(_user).mulDiv((cumulativeRewardShare - lastCumulativeRewardShare[_user]), 1e18)"
                var_reward := checked_add_uint256(_2, /** @src 33:3638:3729  "userBalance(_user).mulDiv((cumulativeRewardShare - lastCumulativeRewardShare[_user]), 1e18)" */ fun_mulDiv_26538(expr, /** @src 33:3665:3721  "cumulativeRewardShare - lastCumulativeRewardShare[_user]" */ checked_sub_uint256(_3, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ sload(keccak256(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0x40)))))
            }
            /// @ast-id 26539 @src 25:1667:5592  "function mulDiv(..."
            function fun_mulDiv_26538(var_x, var_y) -> var_result
            {
                /// @src 25:2269:2435  "assembly {..."
                let usr$mm := mulmod(var_x, var_y, /** @src 10:11371:11388  "type(uint256).max" */ not(0))
                /// @src 25:2269:2435  "assembly {..."
                let var_prod0 := mul(var_x, var_y)
                let _1 := lt(usr$mm, var_prod0)
                let _2 := sub(usr$mm, var_prod0)
                let var_prod1 := sub(_2, _1)
                /// @src 25:2512:2587  "if (prod1 == 0) {..."
                if /** @src 25:2516:2526  "prod1 == 0" */ eq(/** @src 25:2269:2435  "assembly {..." */ _2, _1)
                /// @src 25:2512:2587  "if (prod1 == 0) {..."
                {
                    /// @src 25:2546:2572  "return prod0 / denominator"
                    var_result := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ div(var_prod0, /** @src 33:3724:3728  "1e18" */ 0x0de0b6b3a7640000)
                    /// @src 25:2546:2572  "return prod0 / denominator"
                    leave
                }
                /// @src 33:3724:3728  "1e18"
                let _3 := 0x0de0b6b3a7640000
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                if iszero(/** @src 25:2697:2716  "denominator > prod1" */ gt(/** @src 33:3724:3728  "1e18" */ _3, /** @src 25:2697:2716  "denominator > prod1" */ var_prod1))
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                {
                    revert(/** @src -1:-1:-1 */ 0, 0)
                }
                /// @src 25:3004:3304  "assembly {..."
                let var_remainder := mulmod(var_x, var_y, /** @src 33:3724:3728  "1e18" */ _3)
                /// @src 25:5562:5575  "return result"
                var_result := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mul(/** @src 25:4109:4130  "prod0 |= prod1 * twos" */ or(/** @src 25:3672:4043  "assembly {..." */ shr(18, /** @src 25:3004:3304  "assembly {..." */ sub(var_prod0, var_remainder)), /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ shl(238, /** @src 25:3004:3304  "assembly {..." */ sub(var_prod1, gt(var_remainder, var_prod0)))), /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0xaccb18165bd6fe31ae1cf318dc5b51eee0e1ba569b88cd74c1773b91fac10669)
            }
            /// @ast-id 26539 @src 25:1667:5592  "function mulDiv(..."
            function fun_mulDiv(var_x, var_denominator) -> var_result
            {
                /// @src 33:5175:5179  "1e18"
                let _1 := 0x0de0b6b3a7640000
                /// @src 25:2269:2435  "assembly {..."
                let usr$mm := mulmod(var_x, /** @src 33:5175:5179  "1e18" */ _1, /** @src 10:11371:11388  "type(uint256).max" */ not(0))
                /// @src 25:2269:2435  "assembly {..."
                let var_prod0 := mul(var_x, /** @src 33:5175:5179  "1e18" */ _1)
                /// @src 25:2269:2435  "assembly {..."
                let _2 := lt(usr$mm, var_prod0)
                let _3 := sub(usr$mm, var_prod0)
                let var_prod1 := sub(_3, _2)
                /// @src 25:2512:2587  "if (prod1 == 0) {..."
                if /** @src 25:2516:2526  "prod1 == 0" */ eq(/** @src 25:2269:2435  "assembly {..." */ _3, _2)
                /// @src 25:2512:2587  "if (prod1 == 0) {..."
                {
                    /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                    if iszero(var_denominator)
                    {
                        mstore(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ shl(224, 0x4e487b71))
                        mstore(4, 0x12)
                        revert(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 0x24)
                    }
                    /// @src 25:2546:2572  "return prod0 / denominator"
                    var_result := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ div(var_prod0, var_denominator)
                    /// @src 25:2546:2572  "return prod0 / denominator"
                    leave
                }
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                if iszero(/** @src 25:2697:2716  "denominator > prod1" */ gt(var_denominator, var_prod1))
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                {
                    revert(/** @src -1:-1:-1 */ 0, 0)
                }
                /// @src 25:3004:3304  "assembly {..."
                let var_remainder := mulmod(var_x, /** @src 33:5175:5179  "1e18" */ _1, /** @src 25:3004:3304  "assembly {..." */ var_denominator)
                /// @src 25:3626:3658  "denominator & (~denominator + 1)"
                let expr := and(var_denominator, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ add(/** @src 25:3641:3653  "~denominator" */ not(var_denominator), /** @src 25:3656:3657  "1" */ 0x01))
                /// @src 25:3672:4043  "assembly {..."
                let var_denominator_1 := div(var_denominator, expr)
                /// @src 25:4486:4487  "2"
                let _4 := 0x02
                /// @src 25:4466:4487  "(3 * denominator) ^ 2"
                let expr_1 := xor(/** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mul(/** @src 25:4467:4468  "3" */ 0x03, /** @src 25:4467:4482  "3 * denominator" */ var_denominator_1), /** @src 25:4486:4487  "2" */ _4)
                /// @src 25:4704:4740  "inverse *= 2 - denominator * inverse"
                let expr_2 := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mul(/** @src 25:4704:4740  "inverse *= 2 - denominator * inverse" */ expr_1, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ sub(/** @src 25:4486:4487  "2" */ _4, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mul(/** @src 25:4719:4740  "denominator * inverse" */ var_denominator_1, expr_1)))
                /// @src 25:4773:4809  "inverse *= 2 - denominator * inverse"
                let expr_3 := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mul(/** @src 25:4773:4809  "inverse *= 2 - denominator * inverse" */ expr_2, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ sub(/** @src 25:4486:4487  "2" */ _4, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mul(/** @src 25:4788:4809  "denominator * inverse" */ var_denominator_1, expr_2)))
                /// @src 25:4843:4879  "inverse *= 2 - denominator * inverse"
                let expr_4 := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mul(/** @src 25:4843:4879  "inverse *= 2 - denominator * inverse" */ expr_3, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ sub(/** @src 25:4486:4487  "2" */ _4, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mul(/** @src 25:4858:4879  "denominator * inverse" */ var_denominator_1, expr_3)))
                /// @src 25:4913:4949  "inverse *= 2 - denominator * inverse"
                let expr_5 := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mul(/** @src 25:4913:4949  "inverse *= 2 - denominator * inverse" */ expr_4, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ sub(/** @src 25:4486:4487  "2" */ _4, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mul(/** @src 25:4928:4949  "denominator * inverse" */ var_denominator_1, expr_4)))
                /// @src 25:4983:5019  "inverse *= 2 - denominator * inverse"
                let expr_6 := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mul(/** @src 25:4983:5019  "inverse *= 2 - denominator * inverse" */ expr_5, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ sub(/** @src 25:4486:4487  "2" */ _4, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mul(/** @src 25:4998:5019  "denominator * inverse" */ var_denominator_1, expr_5)))
                /// @src 25:5562:5575  "return result"
                var_result := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mul(/** @src 25:4109:4130  "prod0 |= prod1 * twos" */ or(/** @src 25:3672:4043  "assembly {..." */ div(/** @src 25:3004:3304  "assembly {..." */ sub(var_prod0, var_remainder), /** @src 25:3672:4043  "assembly {..." */ expr), /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mul(/** @src 25:3004:3304  "assembly {..." */ sub(var_prod1, gt(var_remainder, var_prod0)), /** @src 25:3672:4043  "assembly {..." */ add(div(sub(/** @src -1:-1:-1 */ 0, /** @src 25:3672:4043  "assembly {..." */ expr), expr), /** @src 25:3656:3657  "1" */ 0x01))), /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mul(/** @src 25:5054:5090  "inverse *= 2 - denominator * inverse" */ expr_6, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ sub(/** @src 25:4486:4487  "2" */ _4, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mul(/** @src 25:5069:5090  "denominator * inverse" */ var_denominator_1, expr_6))))
            }
            /// @ast-id 28574 @src 33:3940:4432  "function _updateRewards(address _user) internal {..."
            function fun_updateRewards(var__user)
            {
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                let _1 := sub(shl(160, 1), 1)
                let _2 := 64
                /// @src 33:4184:4220  "rewardToken.balanceOf(address(this))"
                let _3 := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mload(_2)
                /// @src 33:4184:4220  "rewardToken.balanceOf(address(this))"
                mstore(_3, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ shl(224, 0x70a08231))
                mstore(/** @src 33:4184:4220  "rewardToken.balanceOf(address(this))" */ add(_3, 4), /** @src 33:4214:4218  "this" */ address())
                /// @src 33:4184:4220  "rewardToken.balanceOf(address(this))"
                let _4 := 32
                let _5 := staticcall(gas(), /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ and(/** @src 33:4184:4195  "rewardToken" */ loadimmutable("28438"), /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _1), /** @src 33:4184:4220  "rewardToken.balanceOf(address(this))" */ _3, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 36, /** @src 33:4184:4220  "rewardToken.balanceOf(address(this))" */ _3, _4)
                if iszero(_5)
                {
                    /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                    let pos := mload(_2)
                    returndatacopy(pos, /** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ returndatasize())
                    revert(pos, returndatasize())
                }
                /// @src 33:4184:4220  "rewardToken.balanceOf(address(this))"
                let expr := /** @src -1:-1:-1 */ 0
                /// @src 33:4184:4220  "rewardToken.balanceOf(address(this))"
                if _5
                {
                    let _6 := _4
                    if gt(_4, returndatasize()) { _6 := returndatasize() }
                    finalize_allocation(_3, _6)
                    /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                    if slt(sub(/** @src 33:4184:4220  "rewardToken.balanceOf(address(this))" */ add(_3, _6), /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _3), /** @src 33:4184:4220  "rewardToken.balanceOf(address(this))" */ _4)
                    /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                    {
                        revert(/** @src -1:-1:-1 */ expr, expr)
                    }
                    /// @src 33:4184:4220  "rewardToken.balanceOf(address(this))"
                    expr := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mload(_3)
                }
                let _7 := sload(/** @src 33:4223:4235  "totalRewards" */ 0x09)
                /// @src 33:4184:4235  "rewardToken.balanceOf(address(this)) - totalRewards"
                let expr_1 := checked_sub_uint256(expr, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _7)
                /// @src 33:4245:4307  "if (undepositedRewards > 0) _depositReward(undepositedRewards)"
                if /** @src 33:4249:4271  "undepositedRewards > 0" */ iszero(iszero(expr_1))
                /// @src 33:4245:4307  "if (undepositedRewards > 0) _depositReward(undepositedRewards)"
                {
                    /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                    sstore(/** @src 33:4223:4235  "totalRewards" */ 0x09, /** @src 33:5102:5125  "totalRewards += _amount" */ checked_add_uint256(/** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _7, /** @src 33:5102:5125  "totalRewards += _amount" */ expr_1))
                    /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                    sstore(/** @src 33:5135:5195  "cumulativeRewardShare += _amount.mulDiv(1e18, totalDeposits)" */ 0x0a, checked_add_uint256(/** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ sload(/** @src 33:5135:5195  "cumulativeRewardShare += _amount.mulDiv(1e18, totalDeposits)" */ 0x0a), /** @src 33:5160:5195  "_amount.mulDiv(1e18, totalDeposits)" */ fun_mulDiv(expr_1, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ sload(/** @src 33:5181:5194  "totalDeposits" */ 0x08))))
                    /// @src 33:5211:5249  "RewardsAdded(_amount, block.timestamp)"
                    let _8 := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mload(_2)
                    mstore(_8, expr_1)
                    mstore(add(_8, /** @src 33:4184:4220  "rewardToken.balanceOf(address(this))" */ _4), /** @src 33:5233:5248  "block.timestamp" */ timestamp())
                    /// @src 33:5211:5249  "RewardsAdded(_amount, block.timestamp)"
                    log1(_8, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _2, /** @src 33:5211:5249  "RewardsAdded(_amount, block.timestamp)" */ 0x40df43107e8b4d467127964bd3c966687c0a6a39aaede970755397fd09535e98)
                }
                /// @src 33:4338:4359  "pendingRewards(_user)"
                let _9 := fun_pendingRewards(var__user)
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                mstore(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ and(var__user, _1))
                mstore(/** @src 33:4184:4220  "rewardToken.balanceOf(address(this))" */ _4, /** @src 33:4318:4328  "rewardOwed" */ 0x0c)
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                sstore(keccak256(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _2), _9)
                let _10 := sload(/** @src 33:4404:4425  "cumulativeRewardShare" */ 0x0a)
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                mstore(/** @src 33:4184:4220  "rewardToken.balanceOf(address(this))" */ _4, /** @src 33:4369:4394  "lastCumulativeRewardShare" */ 0x0b)
                /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                sstore(keccak256(/** @src -1:-1:-1 */ 0, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ _2), _10)
            }
            /// @ast-id 25859 @src 20:7466:8094  "function verifyCallResultFromTarget(..."
            function fun_verifyCallResultFromTarget(var_target, var_success, var_returndata_mpos, var_errorMessage_mpos) -> var_mpos
            {
                /// @src 20:7646:7658  "bytes memory"
                var_mpos := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ 96
                /// @src 20:7670:8088  "if (success) {..."
                switch var_success
                case 0 {
                    /// @src 20:8771:9150  "if (returndata.length > 0) {..."
                    switch /** @src 20:8775:8796  "returndata.length > 0" */ iszero(iszero(/** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mload(/** @src 20:8775:8792  "returndata.length" */ var_returndata_mpos)))
                    case /** @src 20:8771:9150  "if (returndata.length > 0) {..." */ 0 {
                        /// @src 20:9119:9139  "revert(errorMessage)"
                        let _1 := /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mload(64)
                        /// @src 20:9119:9139  "revert(errorMessage)"
                        mstore(_1, /** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ shl(229, 4594637))
                        /// @src 20:9119:9139  "revert(errorMessage)"
                        revert(_1, sub(abi_encode_string(add(_1, 4), var_errorMessage_mpos), _1))
                    }
                    default /// @src 20:8771:9150  "if (returndata.length > 0) {..."
                    {
                        /// @src 20:8947:9089  "assembly {..."
                        revert(add(32, var_returndata_mpos), mload(var_returndata_mpos))
                    }
                }
                default /// @src 20:7670:8088  "if (success) {..."
                {
                    /// @src 20:7697:7983  "if (returndata.length == 0) {..."
                    if /** @src 20:7701:7723  "returndata.length == 0" */ iszero(/** @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..." */ mload(/** @src 20:7701:7718  "returndata.length" */ var_returndata_mpos))
                    /// @src 20:7697:7983  "if (returndata.length == 0) {..."
                    {
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        if /** @src 20:1465:1488  "account.code.length > 0" */ iszero(/** @src 20:1465:1484  "account.code.length" */ extcodesize(var_target))
                        /// @src 32:475:6930  "contract Olympus is RewardDistributor, ERC721Holder {..."
                        {
                            let memPtr := mload(64)
                            mstore(memPtr, shl(229, 4594637))
                            mstore(add(memPtr, 4), 32)
                            mstore(add(memPtr, 36), 29)
                            mstore(add(memPtr, 68), "Address: call to non-contract")
                            revert(memPtr, 100)
                        }
                    }
                    /// @src 20:7996:8013  "return returndata"
                    var_mpos := var_returndata_mpos
                    leave
                }
            }
        }
        data ".metadata" hex"a264697066735822122019bf06808147fcdbfb583605c12bfd833bc419ad1734bfab43e20486e4ac296e64736f6c63430008100033"
    }
}

