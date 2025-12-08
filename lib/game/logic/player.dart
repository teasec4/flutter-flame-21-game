import 'package:flame/components.dart';
import 'package:gambling_game/game/components/hand_container.dart';
import 'package:gambling_game/game/gambling_game.dart';
import 'package:gambling_game/game/logic/blackjack_rules.dart';
import 'package:gambling_game/game/logic/cards.dart';
import 'package:gambling_game/game/logic/models/card.dart';

class Player{
  Cards cards;
  HandContainer handContainer;
  final bool isBot;
  List<int> indexScore = [];
  int totalScore = 0;

  Player({required this.cards, required this.handContainer, this.isBot = false});

  void takeCard2(){
    final (row, col, index) = Cards.getRandomRowCol();
    final card = cards.getRandomSuit().getCard(row, col);
    handContainer.addCard(card);
    addIndexScore(index);
    totalScore = BlackjackRules.calculateHandValue(indexScore);
  }


  void addIndexScore(int score){
    indexScore.add(score);
  }

  void restart(){
    indexScore.clear();
    totalScore = 0;
    handContainer.cardsSprites.clear();
    handContainer.layout();
  }

}