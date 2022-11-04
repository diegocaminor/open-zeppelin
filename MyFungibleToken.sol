// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MiTokenFungible is ERC20("Mi Token Fungible", "MTF") {

    constructor() {
        // Emitimos los primeros 1000 tokens a la cuenta que desplegó el contrato
        _mint(msg.sender, 1000);
    }
}