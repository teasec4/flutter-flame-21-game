
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:gambling_game/game/components/background_component.dart';
import 'package:gambling_game/game/components/balance_component.dart';
import 'package:gambling_game/game/components/btn_get_card.dart';
import 'package:gambling_game/game/components/card_component.dart';
import 'package:gambling_game/game/components/card_sheet.dart';
import 'package:gambling_game/game/components/hand_container.dart';
import 'package:gambling_game/game/logic/blackjack_rules.dart';

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

    // sum of card index
    List<int> cardIndices = [];
    var sum = 0;

    final sumText = TextComponent(
      text: "$sum",
      anchor: Anchor.topCenter,
      position: Vector2(size.x/2, 100),
    );
    add(sumText);

    final btn = BtnGetCard(
        onPressed: () {
          final random = Random();
          final suits = [clubs, hearts, spades, diamonds];
          final randomSuit = suits[random.nextInt(4)];

          final randomRow = random.nextInt(3);
          var randomCol = 0;
          if (randomRow == 2){
             randomCol = random.nextInt(3);
          } else {
            randomCol = random.nextInt(5);
          }

          final randomCard = randomSuit.getCard(randomRow, randomCol);
          hand.addCard(randomCard);

          final int index = randomRow * 5 + randomCol;
          cardIndices.add(index);
          sum = BlackjackRules.calculateHandValue(cardIndices);
          sumText.text = "$sum";
        }
    );
    // create a btn test
    add(btn);

    // Рядом с BtnGetCard
    final btnRestart = HudMarginComponent(
      margin: const EdgeInsets.only(right: 20, top: 50),
      anchor: Anchor.topRight,
      size: Vector2(150,50),
    );
    btnRestart.add(
      ButtonComponent(
        button: RectangleComponent(
          size: Vector2(150,50),
          paint: Paint()..color = const Color(0xFF333333),
          anchor: Anchor.topLeft,
        ),
        buttonDown: RectangleComponent(
          size: Vector2(150,50),
          paint: Paint()..color = const Color(0xFF555555),
          anchor: Anchor.topLeft,
        ),
        position: Vector2.zero(),
        onPressed: () {
          // Рестарт игры
          cardIndices.clear();
          sum = 0;
          sumText.text = "0";
          hand.cardsSprites.clear();
          hand.layout();
        },
      ),
    );
    btnRestart.add(
      TextComponent(
        text: "Restart",
        anchor: Anchor.center,
        position: Vector2(75, 25),
        textRenderer: TextPaint(
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
    add(btnRestart);




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
