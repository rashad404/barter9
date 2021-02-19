const _deploy_contracts = require("../migrations/2_deploy_contracts");

var Barter9Token = artifacts.require('../contracts/Barter9Token.sol');

contract('Barter9Token', function(accounts) {
    it ('setes the total supply upon deployment', function () {
       return Barter9Token.deployed().then(function(instance) {
           tokenInstance = instance;
           return tokenInstance.totalSupply();
       }).then(function(totalSupply) {
           assert.equal(totalSupply.toNumber(), 1000000, 'sets the total supply to 1,000,000')
       })
    })
})