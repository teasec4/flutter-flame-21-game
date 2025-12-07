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

}