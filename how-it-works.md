# HOW IT WORKS

## How It Works

EverBlock Latency Probe measures transaction confirmation latency using a minimal onchain signal that is easy to observe, reproduce, and verify.

The design avoids unnecessary logic so that measured latency reflects the behavior of the MegaETH network and its infrastructure rather than application complexity.

***

### Core Mechanism

The probe consists of a single Solidity contract with one externally callable function.

```solidity
function ping() external
```

When called, this function emits a `Ping` event containing:\
• the sender address\
• the current block timestamp\
• the current block number

No state is modified. No storage is written. The transaction cost and execution path remain minimal and predictable.

***

### Event Emission

Each successful call emits the following event:

```solidity
event Ping(address indexed sender, uint256 timestamp, uint256 blockNumber);
```

This event serves as the onchain signal used for measurement. Because it is indexed and lightweight, it becomes observable quickly through RPC providers and explorers once the transaction is confirmed.

***

### Latency Measurement Model

Latency is measured as the elapsed time between two points:

1 Transaction submission\
2 Receipt confirmation and event observability

In practice, this includes:\
• RPC request propagation\
• Transaction inclusion\
• Block production\
• Receipt availability\
• Event indexing

This reflects the real experience developers encounter when interacting with the network.

***

### Why Events Instead of Return Values

Events are used instead of return values for three reasons:

• Events persist in the chain log\
• They are easily indexed by explorers\
• They can be observed asynchronously

This allows latency to be measured without requiring synchronous contract calls or offchain state.

***

### Measurement Approach

A typical measurement loop follows this pattern:

```bash
cast send <CONTRACT> "ping()"
```

The client records the timestamp before submission and again once the receipt is confirmed. The difference between these timestamps represents end to end confirmation latency.

Multiple sequential calls are used to capture variance and distribution rather than a single data point.

***

### What Influences the Results

Observed latency may vary due to:\
• Network load\
• RPC routing and provider performance\
• Explorer indexing delays\
• Gas price dynamics\
• Client environment

The probe intentionally does not normalize or abstract these factors. The goal is to measure reality, not ideal conditions.

***

### Deterministic Design

The contract has:\
• No external calls\
• No branching logic\
• No storage writes\
• No access control

This ensures that:\
• Gas usage is stable\
• Execution time is predictable\
• Results are comparable across runs

***

### Why This Matters

Latency is one of the first things developers notice when evaluating a new chain. Even small differences in confirmation time can affect developer experience, user perception, and application design.

This probe provides a simple and transparent way to quantify that experience using onchain data.
