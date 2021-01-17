pragma solidity ^0.5.0;

import ‘./UsingTellor.sol’;

// integration code
contract YourContract is UsingTellor{
    constructor(address _userContract) UsingTellor(_userContract) public{
    }

    function getLastValue(uint256 _requestId) public view returns (bool ifRetrieve,
    uint256 value, uint256 _timestampRetrieved) {
        return getDataBefore(_requestId);
}
    //enter trading strategy into this function
    function tradeStrategy() {
        return _value;
    }
}

// contract imports '.UsingTellor.sol'
// intergrates TellorOracle into any trading strategy for test
// truffle migrate - rinkby testnet

