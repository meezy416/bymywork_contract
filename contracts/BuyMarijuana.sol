// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "hardhat/console.sol";

contract BuyMarijuana {

    struct Marijuana {
        address supporter;
        string message;
        string name;
        uint256 amount;
        uint256 timestamp;

    }

    Marijuana[] marijuana;

    address payable public owner;

    constructor() payable {
        console.log("Initialize Smart Contract");
        owner = payable(msg.sender);
    }

    function buymarijuana(string memory _message, string memory _name) public payable {
        require(msg.sender.balance >= msg.value, "You don't have enough ETH");

        marijuana.push(Marijuana(msg.sender, _message, _name, msg.value, block.timestamp));
    }

    function getAllMarijuana() public view returns (Marijuana[] memory) {
        return marijuana;

    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function withdraw() public {
        require(owner == msg.sender, "Caller is not the owner");

        uint256 amount = address(this).balance;
        require(amount > 0, "You have no ethers to withdraw");

        (bool success, ) = owner.call{value: amount}("");
        require(success, "Withdraw failed");
    }
}