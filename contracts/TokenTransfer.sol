// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract TokenTransfer {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    // Transfer ERC20 tokens from the contract to a recipient
    function transferTokens(address tokenAddress, address recipient, uint256 amount) external onlyOwner {
        IERC20 token = IERC20(tokenAddress);
        require(token.balanceOf(address(this)) >= amount, "Insufficient balance in contract");
        require(token.transfer(recipient, amount), "Token transfer failed");
    }

    // Fallback function to allow contract to receive ETH
    receive() external payable {}

    // Function to withdraw ETH from the contract
    function withdrawEther(uint256 amount) external onlyOwner {
        payable(owner).transfer(amount);
    }

    // Function to check token balance in the contract
    function checkTokenBalance(address tokenAddress) external view returns (uint256) {
        IERC20 token = IERC20(tokenAddress);
        return token.balanceOf(address(this));
    }
}
