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


// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract MiContrato is Ownable {

    function functionParaElOwner() public onlyOwner {}
}