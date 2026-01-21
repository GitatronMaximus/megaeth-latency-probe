# DEPLOYMENT GUIDE

This guide walks through deploying the EverBlock Latency Probe contract from a clean machine to MegaETH Testnet v2 using Foundry.

No prior MegaETH experience is assumed.

***

### Prerequisites

You will need:

• A Unix based environment (Linux, macOS, or WSL)\
• Git\
• Curl\
• A MetaMask wallet\
• Testnet ETH on MegaETH Testnet v2

***

### System Setup

#### Install system dependencies

```bash
sudo apt update
sudo apt install -y curl git build-essential pkg-config libssl-dev jq
```

Mac users should install Xcode Command Line Tools:

```bash
xcode-select --install
```

***

### Install Foundry

Foundry is the toolchain used to compile and deploy the contract.

```bash
curl -L https://foundry.paradigm.xyz | bash
```

Restart your terminal, then run:

```bash
foundryup
```

Verify installation:

```bash
forge --version
cast --version
```

***

### Create the Project

```bash
mkdir megaeth-latency-probe
cd megaeth-latency-probe
forge init --commit
```

This creates the project structure and installs `forge-std`.

***

### Create the Contract

Create the contract file:

```bash
nano src/LatencyProbe.sol
```

Paste the following:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract EverBlockLatencyProbe {
    event Ping(address indexed sender, uint256 timestamp, uint256 blockNumber);

    function ping() external {
        emit Ping(msg.sender, block.timestamp, block.number);
    }
}
```

Save and exit nano:\
• Ctrl + O\
• Enter\
• Ctrl + X

Compile the contract:

```bash
forge build
```

***

### Environment Configuration

Create a `.env` file in the project root:

```bash
nano .env
```

Add the following values:

```bash
MEGAETH_RPC=https://carrot.megaeth.com/rpc
MEGAETH_CHAIN_ID=6343
PRIVATE_KEY=your_private_key_here
```

Important notes:\
• The private key comes from MetaMask\
• Do not include quotes\
• Do not include spaces\
• Do not commit this file

Ensure `.env` is ignored:

```bash
echo ".env" >> .gitignore
```

Load environment variables:

```bash
set -a
source .env
set +a
```

***

### Verify Wallet Balance

Confirm your deployer address:

```bash
cast wallet address --private-key "$PRIVATE_KEY"
```

Check testnet balance:

```bash
cast balance "$(cast wallet address --private-key "$PRIVATE_KEY")" --rpc-url "$MEGAETH_RPC"
```

You should see a positive balance.

***

### Deploy the Contract

Deploy to MegaETH Testnet v2:

```bash
forge create src/LatencyProbe.sol:EverBlockLatencyProbe \
  --rpc-url "$MEGAETH_RPC" \
  --chain-id "$MEGAETH_CHAIN_ID" \
  --private-key "$PRIVATE_KEY" \
  --broadcast
```

On success, Foundry will output:\
• Contract address\
• Transaction hash

Save the contract address for later use.

***

### Verify Deployment

Confirm the contract exists onchain:

```bash
cast code <CONTRACT_ADDRESS> --rpc-url "$MEGAETH_RPC"
```

If bytecode is returned, deployment was successful.

***

### Test the Probe

Send a ping:

```bash
cast send <CONTRACT_ADDRESS> "ping()" \
  --rpc-url "$MEGAETH_RPC" \
  --private-key "$PRIVATE_KEY"
```

You should receive a transaction hash and success status.

***

### Common Issues

**Dry run warning**\
Add `--broadcast` to deploy.

**Transaction not visible immediately**\
Explorer indexing may lag slightly on testnet.

**Permission denied or missing jq**\
Install jq using your system package manager.

***

### Deployment Complete

The EverBlock Latency Probe is now live and ready for benchmarking.
