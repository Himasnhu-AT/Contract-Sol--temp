// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract DecentralizedVotingSystem {
    address public owner;
    mapping(address => bool) public voters;
    string[] public candidateList;
    mapping(string => uint) public votesReceived;

    event Voted(address indexed voter, string candidate);
    event CandidateAdded(string candidate);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    constructor(string[] memory _candidates) {
        owner = msg.sender;
        candidateList = _candidates;
    }

    function addCandidate(string memory name) public onlyOwner {
        candidateList.push(name);
        emit CandidateAdded(name);
    }

    function vote(string memory candidate) public {
        require(!voters[msg.sender], "You have already voted");
        require(validCandidate(candidate), "Invalid candidate");

        voters[msg.sender] = true;
        votesReceived[candidate] += 1;

        emit Voted(msg.sender, candidate);
    }

    function getVoteCount(string memory candidate) public view returns (uint) {
        require(validCandidate(candidate), "Invalid candidate");
        return votesReceived[candidate];
    }

    function getCandidateList() public view returns (string[] memory) {
        return candidateList;
    }

    function hasVoted(address voter) public view returns (bool) {
        return voters[voter];
    }

    function validCandidate(
        string memory candidate
    ) internal view returns (bool) {
        for (uint i = 0; i < candidateList.length; i++) {
            if (
                keccak256(abi.encodePacked(candidate)) ==
                keccak256(abi.encodePacked(candidateList[i]))
            ) {
                return true;
            }
        }
        return false;
    }
}
