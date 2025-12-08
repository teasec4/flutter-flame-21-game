
import 'package:gambling_game/game/components/hand_container.dart';

import 'package:gambling_game/game/logic/blackjack_rules.dart';
import 'package:gambling_game/game/logic/cards.dart';


class Player{
  Cards cards;
  HandContainer handContainer;
  final bool isBot;
  List<int> indexScore = [];
  int totalScore = 0;
  int money = 100;

  Player({required this.cards, required this.handContainer, this.isBot = false});

  void takeCard2(){
    final card = cards.getRandomCard();
    handContainer.addCard(card.sprite);
    addIndexScore(card.index);
    totalScore = BlackjackRules.calculateHandValue(indexScore);
    print('indexScore list: $indexScore');
    print('Calculated total: $totalScore');

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