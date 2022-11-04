// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "@openzeppelin/contracts/access/AccessControl.sol";

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract Storage  is AccessControl {

    bytes32 public constant ROL_ADMIN = keccak256("ROL_ADMIN");
    bytes32 public constant ROL_WRITER = keccak256("ROL_WRITER");

    uint256 number;

    constructor() {
        _grantRole(ROL_ADMIN, msg.sender);
    }

    /**
     * @dev Store value in variable
     * @param num value to store
     */
    function store(uint256 num) public onlyWriter {
        number = num;
    }

    /**
     * @dev Return value 
     * @return value of 'number'
     */
    function retrieve() public view returns (uint256) {
        return number;
    }

    modifier onlyWriter() {
        require(hasRole(ROL_WRITER, msg.sender), "Solo pueden ejecutar la funcion los roles WRITER");
        _;
    }

    modifier onlyAdmin() {
        require(hasRole(ROL_ADMIN, msg.sender), "Solo pueden ejecutar la funcion los roles ADMIN");
        _;
    }


    function addWriter(address account) public onlyAdmin {
        _grantRole(ROL_WRITER, account);
    }


    function removeWriter(address account) public onlyAdmin {
        _revokeRole(ROL_WRITER, account);
    }
}