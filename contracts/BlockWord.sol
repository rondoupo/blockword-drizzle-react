// Blockword Contract
pragma solidity >=0.5.0 <0.7.0;

// Variables - gamestate, and timers
contract BlockWord {
    uint8 public gameState;
    uint16 public roundTimerSecs;
    uint16 public wordSelectTimerSecs;
    uint16 public guessTimerSecs;
    uint8 public wordSelectRetryCounter;
    uint8 private wordSelectRetryMax;
    uint8 public minWordLetters;
    uint8 public maxWordLetters;
    string[] public wordsUsed;
    string public wordSelected;
// declaring a new type called gameStateList
    enum gameStateList {gameWaitState, wordSelectState, wordGuessStartState, wordGuessContinueState}
    gameStateList public gameCurrentState;
    address[] public players;
    uint8 public minPlayers;
    uint8 public maxPlayers;

// Constructor is initializer, it is only rutn once.
    constructor() public {
        roundTimerSecs = 300; //round is 5 minutes
        wordSelectTimerSecs = 10;
        guessTimerSecs = 10;
        wordSelectRetryCounter = 0;
        wordSelectRetryMax = 3;
        minWordLetters = 4;
        maxWordLetters = 12;
        wordSelected = "";
        minPlayers = 4;
        maxPlayers = 5;
    }
    function joinGame (uint gameId) public returns (int) {
        uint playerId;
        if (players.length < maxPlayers) {
            // push creates an entry in the array called players
            playerId = players.push(msg.sender)-1;
            // get players value and then subtract 1. first player will be 0. second player will be 1.
            if (players.length == maxPlayers) {
                gameCurrentState = gameStateList.wordSelectState;
            }
            return int (playerId);
        }
        return -1;
    }
}