// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract AkashToken is ERC20, Ownable(msg.sender) {
    constructor() ERC20("Degen", "DGN") {}

    function mintToken(address mintADD, uint amount) public onlyOwner {
        _mint(mintADD, amount);
    }

    function decimals()  override  public pure returns (uint8) {
        return 0;
    }

    function getBalance() external view returns (uint) {
        return this .balanceOf(msg.sender);
    }

    function transferToken(address receiver, uint256 amount) external {
        require(balanceOf(msg.sender) >= amount, "Not enough tokens");
        _transfer(msg.sender, receiver, amount);
    }

    function redeemToken(uint amount) external {
        require(balanceOf(msg.sender) >= amount, "Not enough tokens to redeem");
        _burn(msg.sender, amount); 
    }

    function burnToken(uint amount) external {
        require(balanceOf(msg.sender) >= amount, "Don't have enough tokens");
        _burn(msg.sender, amount);
    }
}
