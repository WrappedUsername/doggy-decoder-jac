// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";

contract DoggyDecoderPayments is Ownable {
    // State variable price .0025
    uint256 public price = 0.0025 ether;

    event PaymentReceived(address indexed payer, uint256 amount);
    event Withdrawal(uint amount, uint when);

    constructor() {}

    // Payment function for DIAT Subscription
    function paySubscription() public payable {
        require(msg.value == price, "Incorrect payment amount");
        emit PaymentReceived(msg.sender, msg.value);
    }

    function updateSubscriptionPrice(uint256 newSubscriptionPrice) public onlyOwner {
        price = newSubscriptionPrice;
    }

    // Only owner withdraw function
    function withdraw() public onlyOwner {
        emit Withdrawal(address(this).balance, block.timestamp);
        payable(owner()).transfer(address(this).balance);
    }
}