# MyToken ERC20 Project

 **Live Demo:** [https://erc-20-token-system.vercel.app/](https://erc-20-token-system.vercel.app/)
A robust ERC20 token project built with Hardhat v2.22.0.

## Project Structure

- `contracts/`: Smart contract source code (Solidity).
- `scripts/`: Deployment scripts (CommonJS).
- `frontend/`: Modern vanilla HTML/CSS dashboard for token management.
- `screenshots/`: Project submission proofs.
- `hardhat.config.js`: Hardhat configuration.

## Setup

1. Install dependencies:
   ```bash
   npm install
   ```

2. Configure environment variables in `.env`:
   - `PRIVATE_KEY`: Your wallet's private key.
   - `ALCHEMY_URL`: Your Alchemy/Infura provider URL.
   - `ETHERSCAN_API_KEY`: For contract verification.

3. Compile contracts:
   ```bash
   npx hardhat compile
   ```

4. Deploy:
   ```bash
   npx hardhat run scripts/deploy.js --network <network>
   ```

## Design Aesthetics

The frontend is designed with a premium, glassmorphic aesthetic, utilizing modern typography and smooth gradients to ensure a high-end user experience.
