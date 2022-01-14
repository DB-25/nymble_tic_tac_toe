class Player {
  static const x = 3;
  static const o = 5;
  static const empty = 2;
}

class Game {
  static const boardLength = 9;
  static const blocSize = 100.0;

  List<int>? board;

  static List<int>? initGameBoard() =>
      List.generate(boardLength, (index) => Player.empty);

  int winnerCheck(int player, int index, int turn, List<int> board) {
    //return 555 for game over, and index to block a win or bot to win itself, and 999 if no one can win

    // if (turn == 1 || turn == 2 || turn == 3) {
    //   return 999;
    // } else
    if (turn < 10) {
      //we will check if anyone won and game is over we return 555
      if (board[0] * board[1] * board[2] == 27 ||
          board[0] * board[1] * board[2] == 125 ||
          board[3] * board[4] * board[5] == 27 ||
          board[3] * board[4] * board[5] == 125 ||
          board[6] * board[7] * board[8] == 27 ||
          board[6] * board[7] * board[8] == 125 ||
          board[0] * board[3] * board[6] == 27 ||
          board[0] * board[3] * board[6] == 125 ||
          board[1] * board[4] * board[7] == 27 ||
          board[1] * board[4] * board[7] == 125 ||
          board[2] * board[5] * board[8] == 27 ||
          board[2] * board[5] * board[8] == 125 ||
          board[0] * board[4] * board[8] == 27 ||
          board[0] * board[4] * board[8] == 125 ||
          board[2] * board[4] * board[6] == 27 ||
          board[2] * board[4] * board[6] == 125) {
        return 555;
      }
      //if no one has won we will try to find a spot where we can add to block a win or win ourself
//first we check if we can win
      else {
        int posWin = findIndexForWinOrBlock(board, 0, 1, 2, turn.isOdd ? 5 : 3);
        if (posWin != 0) {
          return posWin;
        }

        posWin = findIndexForWinOrBlock(board, 3, 4, 5, turn.isOdd ? 5 : 3);
        if (posWin != 0) {
          return posWin;
        }

        posWin = findIndexForWinOrBlock(board, 6, 7, 8, turn.isOdd ? 5 : 3);
        if (posWin != 0) {
          return posWin;
        }

        posWin = findIndexForWinOrBlock(board, 0, 3, 6, turn.isOdd ? 5 : 3);
        if (posWin != 0) {
          return posWin;
        }

        posWin = findIndexForWinOrBlock(board, 1, 4, 7, turn.isOdd ? 5 : 3);
        if (posWin != 0) {
          return posWin;
        }

        posWin = findIndexForWinOrBlock(board, 2, 5, 8, turn.isOdd ? 5 : 3);
        if (posWin != 0) {
          return posWin;
        }

        posWin = findIndexForWinOrBlock(board, 0, 4, 8, turn.isOdd ? 5 : 3);
        if (posWin != 0) {
          return posWin;
        }

        posWin = findIndexForWinOrBlock(board, 2, 4, 6, turn.isOdd ? 5 : 3);
        if (posWin != 0) {
          return posWin;
        }
        //now check if opp can win
        posWin = findIndexForWinOrBlock(board, 0, 1, 2, turn.isEven ? 5 : 3);
        if (posWin != 0) {
          return posWin;
        }
        posWin = findIndexForWinOrBlock(board, 3, 4, 5, turn.isEven ? 5 : 3);
        if (posWin != 0) {
          return posWin;
        }
        posWin = findIndexForWinOrBlock(board, 6, 7, 8, turn.isEven ? 5 : 3);
        if (posWin != 0) {
          return posWin;
        }
        posWin = findIndexForWinOrBlock(board, 0, 3, 6, turn.isEven ? 5 : 3);
        if (posWin != 0) {
          return posWin;
        }
        posWin = findIndexForWinOrBlock(board, 1, 4, 7, turn.isEven ? 5 : 3);
        if (posWin != 0) {
          return posWin;
        }
        posWin = findIndexForWinOrBlock(board, 2, 5, 8, turn.isEven ? 5 : 3);
        if (posWin != 0) {
          return posWin;
        }
        posWin = findIndexForWinOrBlock(board, 0, 4, 8, turn.isEven ? 5 : 3);
        if (posWin != 0) {
          return posWin;
        }
        posWin = findIndexForWinOrBlock(board, 2, 4, 6, turn.isEven ? 5 : 3);
        if (posWin != 0) {
          return posWin;
        }

        return 999;
      }
    }

    //by default it will return 999
    return 999;
  }

  //here a,b,c are indexes for where we check, and 0 indicates player cant win
  int findIndexForWinOrBlock(List<int> board, int a, int b, int c, int player) {
    if (board[a] * board[b] * board[c] == player * player * 2) {
      if (board[a] == 2) return a;
      if (board[b] == 2) return b;
      if (board[c] == 2) return c;
    }
    return 0;
  }

  int computerPlay(List<int> board) {
    return 5;
  }
}
