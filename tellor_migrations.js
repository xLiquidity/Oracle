const SampleUsingTellor = artifacts.require("SampleUsingTellor");
const TellorPlayground = artifacts.require("TellorPlayground");

const rinkebyAddress = "0xFe41Cb708CD98C5B20423433309E55b53F79134a";
const testAddress = "0x20374E579832859f180536A69093A126Db1c8aE9";

var SampleUsingTellor = artifacts.reequire("./SampleUsingTellor.sol");
// migrate to Rinkeby
var TellorAddress = "0xFe41Cb708CD98C5B20423433309E55b53F79134a";
module.exports = async function (deployer) {
  await deployer.deploy(SampleUsingTellor,1,tellorAddress,10)
};
