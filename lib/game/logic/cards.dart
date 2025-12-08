import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';

class CardModel {
  Sprite sprite;
  int index;
  CardModel({required this.sprite, required this.index});
}


class Cards {
  late final SpriteSheet clubsSheet;
  late final SpriteSheet heartsSheet;
  late final SpriteSheet spadesSheet;
  late final SpriteSheet diamondsSheet;

  static const Map<String, String> mapOfCards = {
    "clubs" : "Clubs-88x124.png",
    "hearts" : "Hearts-88x124.png",
    "spades" : "Spades-88x124.png",
    "diamonds" : "Diamonds-88x124.png"
  };

  Cards._();

  static Future<Cards> init() async{
    final cards = Cards._();
    for (var entry in mapOfCards.entries) {
      final image = await Flame.images.load(entry.value);
      final sheet = SpriteSheet(
        image: image,
        srcSize: Vector2(88, 124),
      );

      switch (entry.key) {
        case 'clubs':
          cards.clubsSheet = sheet;
        case 'hearts':
          cards.heartsSheet = sheet;
        case 'spades':
          cards.spadesSheet = sheet;
        case 'diamonds':
          cards.diamondsSheet = sheet;
      }
    }
    return cards;

  }

  CardModel getRandomCard() {
    final (row, col, index) = getRandomRowCol();
    final suit = getRandomSuit();
    final sprite = suit.getSprite(row, col);
    return CardModel(sprite: sprite, index: index);
  }

  // random pick a Suit of card (SpriteSheet)
   SpriteSheet getRandomSuit(){
    final random = Random();
    final suits = [clubsSheet, heartsSheet, spadesSheet, diamondsSheet];
    return suits[random.nextInt(4)];

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