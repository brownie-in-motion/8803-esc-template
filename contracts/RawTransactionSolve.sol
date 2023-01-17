// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

import "./RawTransaction.sol";

contract RawTransactionSolve {
    function run(address _target) payable external {
        RawTransaction target = RawTransaction(_target);

        // do stuff against target here
        // i.e. `target.guessBlocknumber(arg)`
    }
}
