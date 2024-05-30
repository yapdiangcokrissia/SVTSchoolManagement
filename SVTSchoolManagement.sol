// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SVTSchoolManagement {
    address public owner;
    string public schoolName = "SVT";
    mapping(address => mapping(uint256 => uint256)) public studentScores; // Mapping from student address to quiz number to score

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    function addStudentScore(address _student, uint256 _quizNumber, uint256 _score) public onlyOwner {
        // Ensure the student address is not zero
        require(_student != address(0), "Invalid student address");

        // Ensure the quiz number is valid (1 to 5)
        require(_quizNumber >= 1 && _quizNumber <= 5, "Invalid quiz number");

        // Ensure the score is between 0 and 100
        require(_score >= 0 && _score <= 100, "Invalid score");

        // Ensure the student has not been graded already for the quiz
        assert(studentScores[_student][_quizNumber] == 0);

        // Store the student's score for the quiz
        studentScores[_student][_quizNumber] = _score;
    }

    function getStudentScore(address _student, uint256 _quizNumber) public view returns (uint256) {
        // Revert if the student's score for the quiz is not available
        require(studentScores[_student][_quizNumber] != 0, "Student score not available");
        return studentScores[_student][_quizNumber];
    }
}
