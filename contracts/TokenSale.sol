// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.9;

import "./IBEP20.sol";

contract TokenSale{
    address owner;
    IBEP20 ibep20;

    uint256 constant firstPhaseFee = 0.005 ether; 
    uint256 constant secPhaseFee = 0.01 ether;
    uint256 constant thirdPhaseFee = 0.1 ether;
    // First phase 1 month start time
    // Second phase after one month till another
    // Third Phase after 2 month till end of TokenSale
 
    uint256 startTime;

    constructor(address _token){
        owner =msg.sender;
        startTime = block.timestamp;
        ibep20 = IBEP20(_token);
    }
    modifier onlyOwner{ // Modifier only Owner
        require(msg.sender == owner,"NOT_OWNER");
        _;
    }

    function buyToken()payable public { 
       // startTime 
       if(block.timestamp <= startTime + 30 days){ // Fall in phase 1
       require(msg.value >= firstPhaseFee,"Minimum 1 Token"); // 1/0.1 = 10/
       uint256 calculteToken = msg.value/ firstPhaseFee;
       ibep20.mintTo(msg.sender,calculteToken);  // (address _to,uint256 _amount

       }else if(block.timestamp <= startTime + 60 days){ // second phase
       require(msg.value >= secPhaseFee,"Minimum 1 Token");
         uint256 calculteToken = msg.value/ secPhaseFee;
       ibep20.mintTo(msg.sender,calculteToken);

       }else{ // Third phase
       require(msg.value >= thirdPhaseFee,"Minimum 1 Token");
         uint256 calculteToken = msg.value/ thirdPhaseFee;
       ibep20.mintTo(msg.sender,calculteToken);

       }
      
    }


}