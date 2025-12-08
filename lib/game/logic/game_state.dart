class GameState {
  int money = 100;
  int betAmount = 10;

  bool canBet() => money >= betAmount;

  void playerWins() {
    money += betAmount;
  }

  void playerLoses() {
    money -= betAmount;
  }

  void reset() {

  }

}