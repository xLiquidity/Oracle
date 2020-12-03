pragma solidity ^0.5.0;


contract BtcPrice1HourAgoContract is UsingTellor {

  uint256 btcPrice;
  uint256 btcRequetId = 2;

  constructor(address payable _tellorAddress) UsingTellor(_tellorAddress) public {}

  function getBtcPriceBefore1HourAgo() public view returns (uint256) {
    bool _didGet;
    uint _timestamp;
    uint _value;

    // Get the price that is older than an hour (looking back at most 60 values)
    (_didGet, _value, _timestamp) = getDataBefore(btcRequetId, now - 1 hours, 60, 0);

    if(_didGet){
      btcPrice = _value;
    }


  }
}

contract EthPrice1HourAgoContract is UsingTellor {

  uint256 EthPrice;
  uint256 ethRequetId = 1;

  constructor(address payable _tellorAddress) UsingTellor(_tellorAddress) public {}

  function getEthPriceBefore1HourAgo() public view returns (uint256) {
    bool _didGet;
    uint _timestamp;
    uint _value;

    // Get the price that is older than an hour (looking back at most 60 values)
    (_didGet, _value, _timestamp) = getDataBefore(ethRequetId, now - 1 hours, 60, 0);

    if(_didGet){
      ethPrice = _value;
    }
}
}

contract daiPrice1HourAgoContract is UsingTellor {

  uint256 daiPrice;
  uint256 daiRequetId = 39;

  constructor(address payable _tellorAddress) UsingTellor(_tellorAddress) public {}

  function getDaiPriceBefore1HourAgo() public view returns (uint256) {
    bool _didGet;
    uint _timestamp;
    uint _value;

    // Get the price that is older than an hour (looking back at most 60 values)
    (_didGet, _value, _timestamp) = getDataBefore(daiRequetId, now - 1 hours, 60, 0);

    if(_didGet){
      daiPrice = _value;
    }
  }
}

contract usdcPriceContract is UsingTellor {

  uint256 usdcPrice;
  uint256 usdcRequetId = 25;

  constructor(address payable _tellorAddress) UsingTellor(_tellorAddress) public {}

  function setUsdcPrice() public {
    bool _didGet;
    uint _timestamp;
    uint _value;

    (_didGet, usdcPrice, _timestamp) = getCurrentValue(usdcRequetId);
  }



    event NewDescriptorSet(address _descriptorSet);

    
    constructor(address payable _storage) public {
        tellorStorageAddress = _storage;
        _tellorm = TellorMaster(tellorStorageAddress);
    }

    function setOracleIDDescriptors(address _oracleDescriptors) external {
        require(oracleIDDescriptionsAddress == address(0), "Already Set");
        oracleIDDescriptionsAddress = _oracleDescriptors;
        descriptions = OracleIDDescriptions(_oracleDescriptors);
        emit NewDescriptorSet(_oracleDescriptors);
    }

    
    function getCurrentValue(uint256 _requestId) public view returns (bool ifRetrieve, uint256 value, uint256 _timestampRetrieved) {
        return getDataBefore(_requestId,now,1,0);
    }

    
    function valueFor(bytes32 _bytesId) external view returns (int value, uint256 timestamp, uint status) {
        uint _id = descriptions.getTellorIdFromBytes(_bytesId);
        int n = descriptions.getGranularityAdjFactor(_bytesId);
        if (_id > 0){
            bool _didGet;
            uint256 _returnedValue;
            uint256 _timestampRetrieved;
            (_didGet,_returnedValue,_timestampRetrieved) = getDataBefore(_id,now,1,0);
            if(_didGet){
                return (int(_returnedValue)*n,_timestampRetrieved, descriptions.getStatusFromTellorStatus(1));
            }
            else{
                return (0,0,descriptions.getStatusFromTellorStatus(2));
            }
        }
        return (0, 0, descriptions.getStatusFromTellorStatus(0));
    }

    function getDataBefore(uint256 _requestId, uint256 _timestamp)
        public
        returns (bool _ifRetrieve, uint256 _value, uint256 _timestampRetrieved)
    {
        
        (bool _found, uint _index) = getIndexForDataBefore(_requestId,_timestamp);
        if(!_found) return (false, 0, 0);
        uint256 _time = tellor.getTimestampbyRequestIDandIndex(_requestId, _index);
        _value = tellor.retrieveData(_requestId, _time);
        //If value is diputed it'll return zero
        if (_value > 0) return (true, _value, _time);
        return (false, 0, 0);
    }
}
    }
}
}
}
}
