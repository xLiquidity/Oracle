pragma solidity ^0.5.0;

import ‘UsingTellor/contracts/Usingtellor.sol’;

// integration code
contract testStrategy is UsingTellor{
    uint public tellorID;
    uint public qualifiedValue;
    uint public dataBefore;
    uint granularity;

    constructor(address _testStrategy) UsingTellor(_testStrategy) public{
        tellorID = _tellorID;
        granularity = _granularity;
    }

    function updateValue(uint256 _limit, uint _effect) external {
        bool _didGet:
        uint _timestamp
        uint _value;

        (_didGet, _value, _timestamp) = getDataBefore(tellorID, now - 1, _limit, _offset);
        if(_didGet){
            qualifiedValue = _value/granularity;
        }

        (_didGet, dataBefore, _timestamp) = getDataBefore(tellorID);
        dataBefore = dataBefore / granularity;
    }

    function checkValues() external returns(bool) {
        updateValue(100,90);
        if (currentValue = 100){
            return true;
        }
        else{
            return false;
        }
    }

// contract imports '.UsingTellor.sol'
// intergrates TellorOracle into any trading strategy for test
// truffle migrate - rinkby testnet

