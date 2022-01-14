const main = async () => {
    const nftContractFactory = await hre.ethers.getContractFactory('CryptoMemes');
    const nftContract = await nftContractFactory.deploy();
    await nftContract.deployed();
    console.log("Contract deployed to:", nftContract.address);
  
    // Call the function.
    let txn = await nftContract.mint("https://ipfs.io/ipfs/QmSDQfdRwY2YiY8opL1PCYHbtC7WKzmH7K795dea6iAgrs")
    // // Wait for it to be mined.
    await txn.wait()
    console.log("Minted NFT #1")
  };
  
  const runMain = async () => {
    try {
      await main();
      process.exit(0);
    } catch (error) {
      console.log(error);
      process.exit(1);
    }
  };
  
  runMain();