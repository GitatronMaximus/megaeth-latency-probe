// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract EverBlockLatencyProbe {
    event Ping(address indexed sender, uint256 timestamp, uint256 blockNumber);

    function ping() external {
        emit Ping(msg.sender, block.timestamp, block.number);
    }
}
