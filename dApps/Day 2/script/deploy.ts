import { ethers } from "hardhat";

async function main() {
  // Ambil blueprint contract kita
  const SimpleStorage = await ethers.getContractFactory("SimpleStorage");

  console.log("Sedang men-deploy contract...");

  // Proses deploy
  const simpleStorage = await SimpleStorage.deploy();
  
  // Tunggu sampai selesai
  await simpleStorage.waitForDeployment();

  const address = await simpleStorage.getAddress();

  console.log("✅ Contract berhasil dideploy ke:", address);
  console.log("👉 Simpan address ini untuk tugas Day 3!");
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});