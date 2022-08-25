pragma solidity ^0.4.21;

contract ImageStore {
    
    struct Image {
        address owner;
        uint256 dateAdded;
        bytes32 hash;
        string sourceURL;
    }

    mapping(bytes32 => Image) public images;

    function storeImage(bytes32 _hash, string _sourceURL) public {
        address from = msg.sender;
        images[_hash] = Image(from, now, _hash, _sourceURL);
    }

    function getImage(bytes32 _hash) public view returns (address, uint256, bytes32, string) {
        Image storage image = images[_hash];
        return (image.owner, image.dateAdded, image.hash, image.sourceURL);
    }
}