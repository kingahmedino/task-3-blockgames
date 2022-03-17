// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract BlockToken is ERC20 {

    uint256 private constant oneBTK = 0.001 ether;

    event BoughtToken(address indexed reciever, uint256 value);

    constructor() ERC20("BlockToken", "BTK") {
        _mint(msg.sender, 1000000 * 10 ** 18);
    }

    function buyToken(address reciever) public payable returns (bool) {
        require(msg.value > 0, "You cannot mint BTK with zero ETH");
        uint numTokens = msg.value / oneBTK;
        
        _mint(reciever, numTokens * 10 ** 18);

        emit BoughtToken(reciever, msg.value);
        return true;
    }
}