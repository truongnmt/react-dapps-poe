# React Dapps - Proof of Existence

## Prerequisite
- [react-dapp-boilerplate](https://github.com/hackingbeauty/react-dapp-boilerplate)
- [Truffle](https://truffleframework.com/truffle)
- [Ganache](https://truffleframework.com/ganache)
- [ganache-cli](https://github.com/trufflesuite/ganache-cli)
- [Metamask](https://metamask.io/)

## Contracts
Place your Smart Contract into the `/contracts` directory, then modify `migrations/2_deploy_contracts.js`:

```js
var HelloWorld = artifacts.require("./HelloWorld.sol")
var HelloWorld2 = artifacts.require("./HelloWorld2.sol")
// HelloWorld3 ...

module.exports = function (deployer) {
  /* Deploy your contract here with the following command */
  deployer.deploy(HelloWorld);
  deployer.deploy(HelloWorld2);
  // deployer.deploy(HelloWorld3);// ... 
};
```

Then compile and migrate it.

```
truffle compile
truffle migrate
```

If no new migrations exists, `truffle migrate` won't perform any action at all. You can use the `--reset` option to run all your migrations from the beginning.

```
truffle migrate --reset
```

To interact with the deployed contract from terminal, we can use `truffle console`:

```bash
$ truffle console
truffle(development)> HelloWorld.deployed().then(function(instance){return instance.sayHello()})
'Bob'
truffle(development)> HelloWorld.deployed().then(function(instance){return instance.setName("Mary")})
{ tx:
   '0x22a8adb6ff997f2d9da12fc723e6860b8285f00276b4db3505cb01fd898d7f0a',
  receipt:
   { transactionHash:
      '0x22a8adb6ff997f2d9da12fc723e6860b8285f00276b4db3505cb01fd898d7f0a',
     transactionIndex: 0,
     blockHash:
      '0x2eb3608f97fcecd6cd24a8773fbf414aac2dbf9479319b6cea128da9c18bcefb',
     blockNumber: 5,
     from: '0x41992fa4eb9bbb6f537da3e70f89f713767a61c8',
     to: '0x6a2f802755a96480afe1cf517442960ef5536abc',
     gasUsed: 33128,
     cumulativeGasUsed: 33128,
     contractAddress: null,
     logs: [],
     status: true,
     logsBloom:
      '0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',
     v: '0x1b',
     r:
      '0x984bf9ea4cda4fe0bfd804786dacb6a99c010d98e2eb9625edc0ac9875fe2eba',
     s:
      '0x02c26b202ea52458e345861200578daabc1b0afb46022a680ed9d71105ac127d',
     rawLogs: [] },
  logs: [] }
truffle(development)> HelloWorld.deployed().then(function(instance){return instance.sayHello()})
'Mary'
```

