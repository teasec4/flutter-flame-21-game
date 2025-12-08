import 'package:flutter/material.dart';
import 'package:gambling_game/game/logic/cards.dart';
import 'package:gambling_game/game/logic/models/card.dart';

class Bot {
  Cards cards;
  Bot({required this.cards});

  CardM takeCard(){
    final (row, col, index) = Cards.getRandomRowCol();
    final randomCard = cards.getRandomSuit().getCard(row, col);

    return CardM(card: randomCard, index: index);
  }

}