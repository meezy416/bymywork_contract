async function main() {
  const BuyMarijuana = await hre.ethers.getContractFactory("BuyMarijuana");
  const buymarijuana = await BuyMarijuana.deploy();
  await buymarijuana.deployed();

  console.log("BuyMarijuana's contract address: ", buymarijuana.address);
}

main().catch((error) => {
  console.log(error);
  process.exitCode = 1;
});
