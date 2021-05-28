// SPDX-License-Identifier: MIT

pragma solidity 0.6.12;

import "@openzeppelin/contracts/access/Ownable.sol";
import "openzeppelin-contracts-3.4/proxy/Clones.sol";
import "./interfaces/IECDSANodeManagement.sol";

contract ECDSAFactory is Ownable {
    event ECDSANodeGroupCreated(
        address indexed keepAddress,
        address[] members,
        address indexed owner, 
        uint256 honestThreshold
    );

    constructor() public Ownable() {}

    function deploy(
        address nodeMgmtAddress,
        address owner,
        address[] memory members,
        uint256 honestThreshold
    ) external returns (address) {
        address nodeClone = Clones.clone(nodeMgmtAddress);
        IECDSANodeManagement(nodeClone).initialize(
            owner,
            members,
            honestThreshold
        );
        emit ECDSANodeGroupCreated(nodeClone, members, owner, honestThreshold);
        return nodeClone;
    }
}
