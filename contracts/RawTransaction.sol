// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

contract RawTransaction {
    address public player;
    mapping(string => bool) public status;

    constructor(address _player) payable {
        player = _player;
    }

    function guessLastBlockhash(bytes32 _hash) external {
        require(blockhash(block.number - 1) == _hash);
        status["blockhash"] = true;
    }

    function setGasPriceAndGas() external {
        require(tx.gasprice == 0xfc0effee);
        require(gasleft() == 0xbeef);
        status["gas"] = true;
    }

    function guessBlocknumber(uint _blocknumber) external {
        require(block.number == _blocknumber);
        status["blocknumber"] = true;
    }

    function guessBalances(uint _myBalance, uint _yourBalance) external {
        require(address(this).balance == _myBalance);
        require(address(msg.sender).balance == _yourBalance);
        status["balance"] = true;
    }

    function guessWhat(address origin, address sender, uint balance) payable external {
        require(msg.value > 0);
        require(origin == tx.origin);
        require(sender == msg.sender);
        require(address(this).balance == balance);
        status["what"] = true;
    }

    // i edited this to be `view` in order to avoid solc warnings :p
    // it doesn't really matter
    function solved() external view returns (bool) {
        return status["blockhash"]
            && status["gas"]
            && status["blocknumber"]
            && status["balance"]
            && status["what"];
    }
}
