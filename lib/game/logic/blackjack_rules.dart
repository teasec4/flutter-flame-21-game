enum GameResult{playerWins, botWins, draw}

class BlackjackRules {

  static int calculateHandValue(List<int> cardIndices) {
    int sum = 0;
    int aces = 0;

    for (int index in cardIndices) {
      if (index == 0) {
        aces++;
        sum += 11;
      } else if (index >= 9) {
        sum += 10;
      } else {
        sum += index + 1;
      }
    }


    while (sum > 21 && aces > 0) {
      sum -= 10;
      aces--;
    }

    return sum;
  }

  static bool isBust(List<int> cardIndices) {
    return calculateHandValue(cardIndices) > 21;
  }

  static GameResult determineWinner(int playerScore, int botScore) {
    final playerBust = playerScore > 21;
    final botBust = botScore > 21;

    if (playerBust && botBust) return GameResult.draw;
    if (playerBust) return GameResult.botWins;
    if (botBust) return GameResult.playerWins;

    if (playerScore > botScore) return GameResult.playerWins;
    if (botScore > playerScore) return GameResult.botWins;
    return GameResult.draw;
  }


}