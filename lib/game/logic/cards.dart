import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:gambling_game/game/components/card_sheet.dart';


class Cards {
   late final CardSheet clubs;
   late final CardSheet hearts;
   late final CardSheet spades;
   late final CardSheet diamonds;

  static const Map<String, String> mapOfCards = {
    "clubs" : "Clubs-88x124.png",
    "hearts" : "Hearts-88x124.png",
    "spades" : "Spades-88x124.png",
    "diamonds" : "Diamonds-88x124.png"
  };

  Cards._();

  static Future<Cards> init() async{
    final cards = Cards._();
    cards.clubs = await CardSheet().load(mapOfCards['clubs']!);
    cards.hearts = await CardSheet().load(mapOfCards['hearts']!);
    cards.spades = await CardSheet().load(mapOfCards['spades']!);
    cards.diamonds = await CardSheet().load(mapOfCards['diamonds']!);
    return cards;
  }

  // random pick a Suit of card (SpriteSheet)
   CardSheet getRandomSuit(){
    final random = Random();
    final suits = [clubs, hearts, spades, diamonds];
    final randomSuit = suits[random.nextInt(4)];
    return randomSuit;
  }

  // for take it up from sprite sheet
   static (int, int, int) getRandomRowCol(){
     final random = Random();
     final row = random.nextInt(3);
     final col = row == 2 ? random.nextInt(3) : random.nextInt(5);
     final index = row * 5 + col;
     return (row, col, index);
  }


}