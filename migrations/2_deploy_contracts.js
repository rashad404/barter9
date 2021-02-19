const Barter9Token = artifacts.require('../contracts/Barter9Token.sol');

module.exports = function (deployer) {
  deployer.deploy(Barter9Token);
};
