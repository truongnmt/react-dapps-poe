var HelloWorld = artifacts.require("./HelloWorld.sol")

module.exports = function (deployer) {
  /* Deploy your contract here with the following command */
  deployer.deploy(HelloWorld);
};
