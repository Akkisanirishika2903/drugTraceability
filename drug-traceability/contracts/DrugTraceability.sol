// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DrugTraceability {
    struct Drug {
        uint id;
        string name;
        string manufacturer;
        string batchNo;
        string expiryDate;
    }

    mapping(uint => Drug) public drugs;
    uint public drugCount = 0;

    function addDrug(string memory _name, string memory _manufacturer, string memory _batchNo, string memory _expiryDate) public {
        drugCount++;
        drugs[drugCount] = Drug(drugCount, _name, _manufacturer, _batchNo, _expiryDate);
    }

    function getDrug(uint _id) public view returns (Drug memory) {
        require(_id > 0 && _id <= drugCount, "Drug not found");
        return drugs[_id];
    }
}
