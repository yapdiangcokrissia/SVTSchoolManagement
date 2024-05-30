# SVT School Management Smart Contract

This smart contract, written in Solidity, is designed to manage student scores for quizzes in the SVT School.

## Overview

The SVT School Management smart contract allows the owner to add and retrieve quiz scores for students. Each student's score for a particular quiz is stored securely on the Ethereum blockchain.

## Features

- **Add Student Score**: The owner can add a student's score for a specific quiz.
- **Get Student Score**: Anyone can retrieve a student's score for a particular quiz.

## Usage

### Prerequisites

- Ethereum wallet (e.g., MetaMask)
- Solidity development environment (e.g., Remix IDE)

### Deployment

1. Compile the smart contract using a Solidity compiler.
2. Deploy the compiled contract to an Ethereum network of your choice (e.g., Ropsten, Rinkeby, or Mainnet).
3. Interact with the deployed contract using a Web3 provider (e.g., MetaMask).

### Functions

#### `addStudentScore(address _student, uint256 _quizNumber, uint256 _score)`

Adds a student's score for a specific quiz.

- `_student`: Ethereum address of the student.
- `_quizNumber`: Number of the quiz (1 to 5).
- `_score`: Score obtained by the student (between 0 and 100).

   ##### Requirements:
   - The caller must be the owner of the contract.
   - The student's address must not be zero.
   - The quiz number must be between 1 and 5 (inclusive).
   - The score must be between 0 and 100 (inclusive).
   - The student must not have been graded already for the quiz.

   ```solidity
   require(msg.sender == owner, "Only owner can call this function");
   require(_student != address(0), "Invalid student address");
   require(_quizNumber >= 1 && _quizNumber <= 5, "Invalid quiz number");
   require(_score >= 0 && _score <= 100, "Invalid score");
   assert(studentScores[_student][_quizNumber] == 0);
   ```

#### `getStudentScore(address _student, uint256 _quizNumber)`

Retrieves a student's score for a particular quiz.

- `_student`: Ethereum address of the student.
- `_quizNumber`: Number of the quiz (1 to 5).

   ##### Requirements:
   - The student's score for the specified quiz must be available.

   ```solidity
   require(studentScores[_student][_quizNumber] != 0, "Student score not available");
   ```

## License

This smart contract is licensed under the MIT License.

```
