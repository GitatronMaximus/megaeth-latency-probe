# USAGE & BENCHMARKS



## Usage and Benchmarks

This page covers how to interact with the EverBlock Latency Probe and how to collect and report latency measurements in a reproducible way.

The probe is used by sending onchain `ping()` transactions and measuring confirmation time.

***

### Required Environment Variables

Ensure your environment is loaded and includes:

• `MEGAETH_RPC`\
• `MEGAETH_CHAIN_ID`\
• `PRIVATE_KEY`\
• `PROBE_ADDR`

If needed, reload:

```bash
set -a
source .env
set +a
```

Confirm the probe address is set:

```bash
echo "$PROBE_ADDR"
```

***

### Send a Single Ping

Use this to verify the contract is responsive.

```bash
cast send "$PROBE_ADDR" "ping()" \
  --rpc-url "$MEGAETH_RPC" \
  --private-key "$PRIVATE_KEY"
```

Success usually returns:\
• status 1\
• a transaction hash\
• emitted logs in the receipt

***

### Confirm Chain and Contract

Confirm you are on MegaETH Testnet v2:

```bash
cast chain-id --rpc-url "$MEGAETH_RPC"
```

Expected output:

```bash
6343
```

Confirm the contract bytecode exists:

```bash
cast code "$PROBE_ADDR" --rpc-url "$MEGAETH_RPC"
```

If it prints bytecode, the contract is deployed and reachable.

***

### Benchmark Loop

This loop sends sequential pings, waits for confirmation, and prints end to end time in milliseconds.

Requires `jq`.

```bash
for i in $(seq 1 10); do
  echo "Ping $i"
  start=$(date +%s%3N)
  tx=$(cast send "$PROBE_ADDR" "ping()" --rpc-url "$MEGAETH_RPC" --private-key "$PRIVATE_KEY" --json | jq -r .transactionHash)
  cast receipt "$tx" --rpc-url "$MEGAETH_RPC" >/dev/null
  end=$(date +%s%3N)
  echo "tx=$tx ms=$((end-start))"
done
```

What this measures:\
• submit time to receipt confirmation\
• includes RPC latency, inclusion latency, and receipt availability

***

### Interpreting Results

The raw output is a list of per transaction confirmation times.

A typical professional summary includes:\
• median (p50)\
• tail (p95)\
• maximum\
• sample size\
• date and environment

Example format:

• sample size: 10 sequential transactions\
• p50: 1900 ms\
• p95: 3400 ms\
• max: 3700 ms\
• RPC: public endpoint\
• date: January 2026

***

### Practical Notes

Latency will vary based on:\
• network activity\
• RPC provider load\
• routing and geographic distance\
• explorer indexing speed

For consistency:\
• run benchmarks at least 2 times\
• report sample size and date\
• do not mix results from different RPC endpoints without labeling them

***

### Optional Improvement

If you want deeper data, increase sample size:

```bash
for i in $(seq 1 50); do
  start=$(date +%s%3N)
  tx=$(cast send "$PROBE_ADDR" "ping()" --rpc-url "$MEGAETH_RPC" --private-key "$PRIVATE_KEY" --json | jq -r .transactionHash)
  cast receipt "$tx" --rpc-url "$MEGAETH_RPC" >/dev/null
  end=$(date +%s%3N)
  echo "$((end-start))"
done
```

This prints only millisecond values, which makes it easier to paste into spreadsheets for percentiles.

***

### Explorer Verification

To validate emitted events, open the contract address in the MegaETH Blockscout explorer and view logs.

Explorer indexing may lag during high activity.
