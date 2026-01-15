import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import * as dotenv from "dotenv";

dotenv.config();

const config: HardhatUserConfig = {
  solidity: "0.8.20", // Sesuaikan dengan versi solidity
  networks: {
    avalancheFuji: {
      url: "https://api.avax-test.network/ext/bc/C/rpc", // URL RPC Avalanche
      chainId: 43113,
      accounts: process.env.PRIVATE_KEY ? [process.env.PRIVATE_KEY] : [],
    },
  },
};

export default config;