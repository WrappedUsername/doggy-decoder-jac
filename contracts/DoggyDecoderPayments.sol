// SPDX-License-Identifier: MIT
/**
      :::::::::   ::::::::   ::::::::   ::::::::  :::   ::: 
     :+:    :+: :+:    :+: :+:    :+: :+:    :+: :+:   :+:  
    +:+    +:+ +:+    +:+ +:+        +:+         +:+ +:+    
   +#+    +:+ +#+    +:+ :#:        :#:          +#++:      
  +#+    +#+ +#+    +#+ +#+   +#+# +#+   +#+#    +#+        
 #+#    #+# #+#    #+# #+#    #+# #+#    #+#    #+#         
#########   ########   ########   ########     ###          

      :::::::::  :::::::::: ::::::::   ::::::::  :::::::::  :::::::::: ::::::::: 
     :+:    :+: :+:       :+:    :+: :+:    :+: :+:    :+: :+:        :+:    :+: 
    +:+    +:+ +:+       +:+        +:+    +:+ +:+    +:+ +:+        +:+    +:+  
   +#+    +:+ +#++:++#  +#+        +#+    +:+ +#+    +:+ +#++:++#   +#++:++#:    
  +#+    +#+ +#+       +#+        +#+    +#+ +#+    +#+ +#+        +#+    +#+    
 #+#    #+# #+#       #+#    #+# #+#    #+# #+#    #+# #+#        #+#    #+#     
#########  ########## ########   ########  #########  ########## ###    ###      

      :::::::::     :::   :::   :::  :::   :::   :::::::::: ::::    ::: ::::::::::: :::::::: 
     :+:    :+:  :+: :+: :+:   :+: :+:+: :+:+:  :+:        :+:+:   :+:     :+:    :+:    :+: 
    +:+    +:+ +:+   +:+ +:+ +:+ +:+ +:+:+ +:+ +:+        :+:+:+  +:+     +:+    +:+         
   +#++:++#+ +#++:++#++: +#++:  +#+  +:+  +#+ +#++:++#   +#+ +:+ +#+     +#+    +#++:++#++   
  +#+       +#+     +#+  +#+   +#+       +#+ +#+        +#+  +#+#+#     +#+           +#+    
 #+#       #+#     #+#  #+#   #+#       #+# #+#        #+#   #+#+#     #+#    #+#    #+#     
###       ###     ###  ###   ###       ### ########## ###    ####     ###     ########       
 */
pragma solidity 0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";

/// @author WrappedUsername
contract DoggyDecoderPayments is Ownable {
    /// @notice Price will be in MATIC
    uint256 public price = 8 ether;

    event PaymentReceived(address indexed payer, uint256 amount);
    event UpdatePrice(uint256 amount, uint256 when);
    event Withdrawal(uint256 amount, uint256 when);

    constructor() {}

    // Payment function for DIAT Subscription
    function paySubscription() public payable {
        require(msg.value == price, "Incorrect payment amount");
        emit PaymentReceived(msg.sender, msg.value);
    }

    function updateSubscriptionPrice(uint256 newSubscriptionPrice) public payable onlyOwner {
        price = newSubscriptionPrice;
        emit UpdatePrice(newSubscriptionPrice, block.timestamp);
    }

    function getThisBalance() public view onlyOwner returns(uint256) {
        return address(this).balance;
    }

    function withdraw() public onlyOwner {
        payable(owner()).transfer(address(this).balance);
        emit Withdrawal(address(this).balance, block.timestamp);
    }
}