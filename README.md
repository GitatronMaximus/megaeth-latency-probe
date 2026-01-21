# OVERVIEW

## EverBlock Latency Probe

EverBlock Latency Probe is a minimal onchain benchmarking contract deployed on **MegaETH Testnet v2** to measure real end to end transaction confirmation latency.

The probe emits lightweight events on demand, allowing developers, infrastructure operators, and researchers to measure how long it takes for a transaction to be submitted, executed, indexed, and observable through public RPC and explorer infrastructure.

This project is intentionally simple by design. It focuses on measuring network and execution performance without introducing application level complexity that could skew results.

***

### What This Is

This repository contains:\
• A minimal Solidity smart contract\
• A deployment workflow using Foundry\
• A repeatable method to measure confirmation latency\
• Public benchmark results collected on MegaETH Testnet v2

The contract exposes a single function, `ping()`, which emits a timestamped event when executed. By measuring the time between submission and receipt confirmation, users can benchmark real world transaction latency.

***

### What This Is Not

This is **not**:\
• A production application\
• A performance claim or guarantee\
• A stress test or load generator\
• A replacement for full monitoring tooling

The probe is intentionally lightweight so that results reflect the underlying chain and RPC performance rather than application logic.

***

### Why This Exists

Early stage networks often publish theoretical performance metrics. This probe measures what developers actually experience in practice.

Use cases include:\
• Comparing public RPC responsiveness\
• Tracking performance changes over time\
• Validating explorer indexing speed\
• Providing transparent benchmarks during testnet phases

The goal is to provide clear, reproducible, and verifiable measurements using onchain signals.

***

### Deployment Details

**Network**\
MegaETH Testnet v2

**Chain ID**\
6343

**Contract Address**

```
0x33b4a0965fe6006a585B28EbE28Fa1ef287e0540
```

**Explorer**\
MegaETH Testnet v2 Blockscout

***

### High Level Flow

1 A user submits a `ping()` transaction\
2 The contract emits a `Ping` event containing sender, timestamp, and block number\
3 The transaction is confirmed onchain\
4 The receipt and event become observable through RPC and the explorer\
5 Latency is measured from submission to confirmation

***

### Benchmark Snapshot

Collected via sequential `ping()` calls using a public RPC endpoint.

**January 2026**\
• Median confirmation time approximately 1.9 seconds\
• 95th percentile approximately 3.4 seconds\
• Maximum observed approximately 3.7 seconds

Actual results may vary based on network conditions, RPC routing, and indexing status.

***

### Intended Audience

This project is useful for:\
• Blockchain developers evaluating MegaETH\
• Infrastructure providers benchmarking RPC performance\
• Researchers studying execution latency\
• Ecosystem contributors during testnet phases

***

### Repository

Source code and deployment artifacts are available on GitHub.

This documentation accompanies the public repository and contract deployment to ensure full transparency and reproducibility.

***

### License

MIT License\
Free to use, modify, and redistribute.
