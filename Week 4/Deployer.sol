// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

error NotDeployer();


contract Deployer {
    address deployer;

    constructor() payable {  
        deployer = msg.sender;

        if(!(msg.value >= 1e18)) {
            revert("Not enough");
        }
    //     require(msg.value >= 1 ether, "Not enough Ether!");       
    }

    function withdraw() public {
        if(deployer != msg.sender) {
            revert NotDeployer();
        } else {
            payable(msg.sender).transfer(address(this).balance);
        }
    }
    
}