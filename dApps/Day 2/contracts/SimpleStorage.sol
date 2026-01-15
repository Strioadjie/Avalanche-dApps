// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleStorage {
    // State variable: Disimpan permanen di blockchain
    uint256 private storedValue;
    address public owner; // Task 1: Menyimpan siapa pemilik contract
    string public message; // Task 4 (Optional): State tambahan

    // Event: Log yang bisa dibaca frontend nanti
    event ValueUpdated(uint256 newValue); 
    event OwnerSet(address indexed oldOwner, address indexed newOwner); // Task 2: Event validation
    event MessageUpdated(string newMessage);

    // Modifier: Hanya owner yang boleh akses
    modifier onlyOwner() {
        require(msg.sender == owner, "Hanya owner yang boleh akses!");
        _;
    }

    // Constructor: Dijalankan sekali saat deploy
    constructor() {
        owner = msg.sender; // Set pengirim contract sebagai owner
        emit OwnerSet(address(0), msg.sender);
    }

    // Fungsi Write: Mengubah data (Perlu Gas)
    function setValue(uint256 _value) public {
        storedValue = _value;
        emit ValueUpdated(_value); // Trigger event
    }

    // Fungsi Read: Cuma baca (Gratis)
    function getValue() public view returns (uint256) {
        return storedValue;
    }

    // Task 4: Fungsi dengan proteksi onlyOwner
    function setMessage(string memory _message) public onlyOwner {
        message = _message;
        emit MessageUpdated(_message);
    }
}