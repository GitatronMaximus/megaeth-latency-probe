# EverBlock Latency Probe

Minimal onchain latency probe deployed on MegaETH testnet v2 to measure end to end transaction confirmation time.

## Deployment
Network: MegaETH Testnet v2  
Chain ID: 6343  
Contract: 0x33b4a0965fe6006a585B28EbE28Fa1ef287e0540  

## Usage
Call `ping()` to emit a `Ping(sender, timestamp, blockNumber)` event.

## Benchmark (Jan 2026)
10 sequential ping transactions via public RPC.

p50: ~1.9s  
p95: ~3.4s  
max: 3.7s  

## Purpose
Built by EverBlockTech to benchmark execution and RPC performance during MegaETH testnet.

## License
MIT
