# EXPLORER & LINKS



## Explorer and Links

This page contains the official onchain references, social channels, and community links related to the EverBlock Latency Probe and the MegaETH network.

All benchmarks and claims in this documentation can be independently verified using the links below.

***

### Contract on Explorer

**Network**\
MegaETH Testnet v2

**Chain ID**\
6343

**Contract Address**

```
0x33b4a0965fe6006a585B28EbE28Fa1ef287e0540
```

**Block Explorer**\
[https://megaeth-testnet-v2.blockscout.com](https://megaeth-testnet-v2.blockscout.com/)

To verify activity:\
1 Open the explorer\
2 Paste the contract address\
3 Navigate to the **Logs** tab\
4 View emitted `Ping` events

Explorer indexing may lag slightly during periods of high network activity.

***

### Transaction Verification

Each `ping()` call emits a `Ping` event containing:\
• sender address\
• block timestamp\
• block number

These values are visible in the transaction receipt and can be used to confirm benchmark data independently.

***

### Official MegaETH Links

**MegaETH Website**\
[https://megaeth.com](https://megaeth.com/)

**MegaETH X (Twitter)**\
[https://x.com/megaeth\_labs](https://x.com/megaeth_labs)

**MegaETH Community Chat (Discord)**\
[https://discord.gg/megaeth](https://discord.gg/megaeth)

These are the primary channels for:\
• testnet announcements\
• infrastructure updates\
• developer support\
• milestone and roadmap discussions

***

### Repository

**GitHub Repository**\
[https://github.com/GitatronMaximus/megaeth-latency-probe](https://github.com/GitatronMaximus/megaeth-latency-probe)

The repository includes:\
• full source code\
• deployment configuration\
• benchmark scripts\
• documentation source

Issues and pull requests are welcome.

***

### EverBlockTech

This project is built and maintained by **EverBlockTech** as part of ongoing infrastructure research and ecosystem participation.

The latency probe is intended to be:\
• transparent\
• reproducible\
• easy to extend

Future iterations may include:\
• multi RPC comparisons\
• automated reporting\
• historical tracking\
• dashboard integrations

***

### Final Notes

All measurements in this documentation represent real world observations at the time of testing. Results may change as the MegaETH network evolves.

Users are encouraged to rerun benchmarks and publish independent results.
