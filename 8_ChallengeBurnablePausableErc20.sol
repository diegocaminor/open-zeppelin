// El reto para ti consiste en crear un Token ERC20 que permita quemar los mismos para controlar su emisión y pausar 
// el contrato en el caso de descubrir una vulnerabilidad de seguridad.
// La quema de tokens puedes realizarla con la extensión ERC20Burnable, mientras que para la pausa en el funcionamiento
// del contrato puedes utilizar la extensión ERC20Pausable.
// Además, poner en pausa un contrato inteligente debería ser tarea del administrador del mismo. No estaría mal que tu contrato 
// implemente Ownable o AccessControl.

// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BurnablePausable is ERC20Burnable, Pausable, Ownable{
    constructor() ERC20Burnable() ERC20("Challenge extension", "CE") {
        _mint(msg.sender, 1000);
    }

    function Pause() public onlyOwner {
        _pause();
    }

    function Unpause() public onlyOwner {
        _unpause();
        
    }

    function Burn(uint amount) public whenNotPaused {
        burn(amount);
    }

}