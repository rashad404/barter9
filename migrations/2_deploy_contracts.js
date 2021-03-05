const Barter9Token = artifacts.require('../contracts/Barter9Token.sol');
const Barter9TokenSale = artifacts.require('../contracts/Barter9TokenSale.sol');

module.exports = function (deployer) {
  deployer.deploy(Barter9Token, 1000000).then(function () {
    var tokenPrice = 1000000000000000; //in wei, 0.001 eth

    return deployer.deploy(Barter9TokenSale, Barter9Token.address, tokenPrice);
  })

};
