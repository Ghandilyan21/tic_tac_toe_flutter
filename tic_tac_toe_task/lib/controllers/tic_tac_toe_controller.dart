import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TicTacToeController extends GetxController {
  RxString currentElement = 'x'.obs;
  RxInt firstGameCount = 0.obs;
  RxInt secondGameCount = 0.obs;
  RxInt firstWinCount = 0.obs;
  RxInt secondWinCount = 0.obs;
  RxBool gameFinished = false.obs;
  RxString winLinePosition = ''.obs;

  late RxList<List<String>> board;

  void initBoard() {
    currentElement = 'x'.obs;
    gameFinished = false.obs;
    winLinePosition = ''.obs;
    board = [
      ['', '', ''],
      ['', '', ''],
      ['', '', '']
    ].obs;
  }

  void updateBoard() {
    board.value = [
      ['', '', ''],
      ['', '', ''],
      ['', '', '']
    ];
  }

  void playerTap(int index) {
    if (board[index ~/ 3][index % 3] != '') {
      return;
    }
    board[index ~/ 3][index % 3] = currentElement.value;
    board.refresh();
    if (currentElement.value == 'x') {
      currentElement.value = 'y';
    } else {
      currentElement.value = 'x';
    }
    Map<String, String> winner = checkWinner();
    if (winner['val'] == 'x') { // lose screen
      // navigate to winner screen
      gameFinished.value = true;
      winLinePosition = winner['pos']!.obs;
      firstGameCount++;
      secondGameCount++;
      firstWinCount++;
    } else if (winner['val'] == 'y') { // win screen
      winLinePosition.value = winner['pos']!;
      firstGameCount++;
      secondGameCount++;
      secondWinCount++;
      gameFinished.value = true;
    } else if (winner['val'] == 'noWinner') {  // draw screen
      gameFinished.value = true;
      firstGameCount++;
      secondGameCount++;
      currentElement.value = winner['pos']!;
      winLinePosition.value = winner['pos']!;
    }
  }

  Map<String, String> checkWinner() {
    // noone win (draw)
    bool noWinner = true;
    for (var i = 0; i < 3; i++) {
      for (var j = 0; j < 3; j++) {
        if (board[i][j] == '') {
          noWinner = false;
        }
      }
    }
    // Horizontal matches
    for (var i = 0; i < 3; ++i) {
      if (board[i][0] == board[i][1] &&
          board[i][1] == board[i][2] &&
          board[i][0] != '') {
        return {'pos': 'h$i', 'val': board[i][0]};
      }
    }
    // Vertical matches
    for (var i = 0; i < 3; ++i) {
      if (board[0][i] == board[1][i] &&
          board[1][i] == board[2][i] &&
          board[0][i] != '') {
        return {'pos': 'v$i', 'val': board[0][i]};
      }
    }
    // Diagonal matches
    if (board[0][0] == board[1][1] &&
        board[1][1] == board[2][2] &&
        board[0][0] != '') {
      return {'pos': 'primaryD', 'val': board[0][0]};
    }
    if (board[0][2] == board[1][1] &&
        board[1][1] == board[2][0] &&
        board[0][2] != '') {
      return {'pos': 'secondaryD', 'val': board[0][2]};
    }
    if (noWinner) {
      return {'pos': '', 'val': 'noWinner'};
    }
    return {'pos': '', 'val': ''};
  }
}
