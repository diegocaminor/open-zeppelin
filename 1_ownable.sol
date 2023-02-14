// Propiedad de un contrato
// Por lo general, la dirección que despliega el contrato se convierte en el owner del mismo. Puedes obtener 
// la dirección de quién realice el despliegue con msg.sender, asignárselo a una variable y, con la misma, 
// hacer la validación del dueño del contrato.
// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract MiContrato {

    address private owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Debes ser el owner del contrato para continuar");
        _;
    }

    function functionParaElOwner() public onlyOwner {}
}


// using openzeppeling
// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract MiContrato is Ownable {

    function functionAccesibleToAll() public {}

    function functionParaElOwner() public onlyOwner {}
}