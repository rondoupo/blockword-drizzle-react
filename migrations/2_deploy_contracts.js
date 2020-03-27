const MyStringStore = artifacts.require("MyStringStore");
const BlockWord = artifacts.require("BlockWord");

module.exports = function(deployer) {
  deployer.deploy(MyStringStore);
  deployer.deploy(BlockWord);
};


