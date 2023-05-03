import {HardhatUserConfig} from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

const config: HardhatUserConfig = {
  solidity: {
    compilers: [
      {
        version: "0.8.7",
        settings: {
          optimizer: {
            enabled: true,
            runs: 1000,
          },
        },
      },
    ],
  },
  defaultNetwork: "hardhat",
  networks: {
    hardhat: {},
    ethereum: {
      url: "https://mainnet.infura.io/v3/${INFURA_API_KEY}",
    },
  },

  etherscan: {
    apiKey: {
      ethereum: "${ETHERSCAN_API_KEY}",
    },
  },
};

export default config;
