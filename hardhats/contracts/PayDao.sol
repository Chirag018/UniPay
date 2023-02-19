//SPDX-License-Identifier: MIT

pragma solidity ^0.8;

contract PayDao {
    struct Payer {
        string name;
        string message;
        uint256 timestamp;
        address payerAddress;
    }

    Payer[] payer;
    address payable owner;

    constructor() {
        owner = payable(msg.sender);
    }

    // pay
    function pay(string memory name, string memory message) public payable {
        require(msg.value > 0, "Amount is 0");
        owner.transfer(msg.value);
        payer.push(Payer(name, message, block.timestamp, msg.sender));
    }

    // get payer info
    function payerInfo() public view returns (Payer[] memory) {
        return payer;
    }

    // callback to receive funds

    receive() external payable {}

    fallback() external payable {}
}


//Contract Address:  0x485e548C4701bC23faddB029781B84c71B61E018