const { ethers } = require("hardhat");

async function main() {
  const initialSupply = 1000000;
  const MyToken = await ethers.getContractFactory("MyToken");
  const token = await MyToken.deploy(initialSupply);

  await token.waitForDeployment();

  console.log("Deployed at:", await token.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exit(1);
});
