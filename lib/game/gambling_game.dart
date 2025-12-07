
import 'dart:math';
import 'dart:ui';

import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:gambling_game/game/components/background_component.dart';
import 'package:gambling_game/game/components/balance_component.dart';
import 'package:gambling_game/game/components/btn_get_card.dart';
import 'package:gambling_game/game/components/card_component.dart';
import 'package:gambling_game/game/components/card_sheet.dart';
import 'package:gambling_game/game/components/hand_container.dart';

class GamblingGame extends FlameGame {


  @override
  Future<void> onLoad() async{
    final clubs = await CardSheet().load("Clubs-88x124.png");
    final hearts = await CardSheet().load("Hearts-88x124.png");
    final spades = await CardSheet().load("Spades-88x124.png");
    final diamonds = await CardSheet().load("Diamonds-88x124.png");

    // take a card fo test
    final sprite = clubs.getCard(0,0);
    final sprite2 = clubs.getCard(2,2);


    // creating background
    add(BackgroundComponent()
      ..size = size
    );

    // create a Balance on top left corner
    add(BalanceComponent());

    // create a HandContainer on bottom center
    final hand = HandContainer()
    ..size = Vector2(size.x, 150)
    ..position = Vector2(size.x / 2, size.y * 0.8);
    add(hand);

    final btn = BtnGetCard(
        onPressed: () {
          final random = Random();
          final suits = [clubs, hearts, spades, diamonds];
          final randomSuit = suits[random.nextInt(4)];

          final randomRow = random.nextInt(2);  // только ряды 0-1
          final randomCol = random.nextInt(5);

          final randomCard = randomSuit.getCard(randomRow, randomCol);
          hand.addCard(randomCard);

        }
    );
    // create a btn test
    add(btn);

    // test red rect
    // add(
    //   RectangleComponent(
    //     position: Vector2(size.x/2 , size.y/2),
    //     size: Vector2(100, 150),
    //     paint: Paint()..color = const Color(0xFFFF0000),
    //     anchor: Anchor.center,
    //   )
    // );

  }
}
