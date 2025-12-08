
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
import 'package:gambling_game/game/logic/bot.dart';
import 'package:gambling_game/game/ui/overlays/btn_get_card.dart';
import 'package:gambling_game/game/components/card_component.dart';
import 'package:gambling_game/game/components/card_sheet.dart';
import 'package:gambling_game/game/components/hand_container.dart';
import 'package:gambling_game/game/logic/blackjack_rules.dart';
import 'package:gambling_game/game/logic/cards.dart';
import 'package:gambling_game/game/ui/overlays/imdone_button.dart';
import 'package:gambling_game/game/ui/overlays/restart_button.dart';

class GamblingGame extends FlameGame {


  @override
  Future<void> onLoad() async{
    final cards = await Cards.init();

    // creating background
    add(BackgroundComponent()
      ..size = size
    );

    // create a Balance on top left corner
    add(BalanceComponent());

    // create a HandContainer on bottom center for PLAYER
    final hand = HandContainer()
    ..size = Vector2(size.x, 150)
    ..position = Vector2(size.x / 2, size.y * 0.8);
    add(hand);

    // create a HandContainer no top center for BOT
    final handBot = HandContainer(isBot: true)
      ..size = Vector2(size.x, 150)
      ..position = Vector2(size.x/2, size.y * 0.2);
    add(handBot);

    // sum of card index
    List<int> cardIndices = [];
    List<int> botScore = [];
    var sum = 0;
    var sumBot = 0;

    // PLAYER SCORE
    final sumText = TextComponent(
      text: "$sum",
      anchor: Anchor.topCenter,
      position: Vector2(size.x/2, 600),
    );
    add(sumText);

    // BOT SCORE
    final sumTextBot = TextComponent(
      text: "$sumBot",
      anchor: Anchor.topCenter,
      position: Vector2(size.x/2, 300),
    );
    add(sumTextBot);


    // GET CARD
    add(BtnGetCard(onPressed: (){
      final (row , col, index) = Cards.getRandomRowCol();
      final randomCard = cards.getRandomSuit().getCard(row, col);

      hand.addCard(randomCard);
      cardIndices.add(index);

      sum = BlackjackRules.calculateHandValue(cardIndices);
      sumText.text = "$sum";
    }));

    // RESTART
    add(RestartButton(onPressed: (){
      cardIndices.clear();
      sum = 0;
      sumText.text = "0";
      hand.cardsSprites.clear();
      hand.layout();

      sumBot = 0;
      sumTextBot.text = "0";
      handBot.cardsSprites.clear();
      handBot.layout();
    }));

    final bot = Bot(cards: cards);
    Future<void> botPlayingGameLogic() async{
      // take a first card
      final firstTake = bot.takeCard();
      handBot.addCard(firstTake.card);
      botScore.add(firstTake.index);
      sumBot = BlackjackRules.calculateHandValue(botScore);
      sumTextBot.text = "$sumBot";

      await Future.delayed(Duration(milliseconds: 500));


      // take a second card
      final secondTake = bot.takeCard();
      handBot.addCard(secondTake.card);
      botScore.add(secondTake.index);
      sumBot = BlackjackRules.calculateHandValue(botScore);
      sumTextBot.text = "$sumBot";
    }


    // Bot Tern Btn
    add(ImdoneButton(onPressed: ()async{
       await botPlayingGameLogic();
    }));



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
