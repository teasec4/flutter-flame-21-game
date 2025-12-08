
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
import 'package:gambling_game/game/logic/player.dart';
import 'package:gambling_game/game/ui/overlays/btn_get_card.dart';
import 'package:gambling_game/game/components/card_component.dart';
import 'package:gambling_game/game/components/card_sheet.dart';
import 'package:gambling_game/game/components/hand_container.dart';
import 'package:gambling_game/game/logic/blackjack_rules.dart';
import 'package:gambling_game/game/logic/cards.dart';
import 'package:gambling_game/game/ui/overlays/imdone_button.dart';
import 'package:gambling_game/game/ui/overlays/restart_button.dart';

class GamblingGame extends FlameGame {
  late Player player;
  late Bot bot;
  late TextComponent sumText;
  late TextComponent sumTextBot;
  int lastPlayerScore = 0;
  int lastBotScore = 0;

  @override
  Future<void> onLoad() async{
    final cards = await Cards.init();

    // create a HandContainer on bottom center for PLAYER
    final handPlayer = HandContainer()
      ..size = Vector2(size.x, 150)
      ..position = Vector2(size.x / 2, size.y * 0.8);
    add(handPlayer);


    // create a HandContainer no top center for BOT
    final handBot = HandContainer(isBot: true)
      ..size = Vector2(size.x, 150)
      ..position = Vector2(size.x/2, size.y * 0.2);
    add(handBot);



     player = Player(cards: cards, handContainer: handPlayer);

     bot = Bot(cards: cards, handContainer: handBot);

    // creating background
    add(BackgroundComponent()
      ..size = size
      ..priority = -1
    );

    // PLAYER SCORE
     sumText = TextComponent(
      text: "${player.totalScore}",
      anchor: Anchor.topCenter,
      position: Vector2(size.x/2, 600),
    );
    add(sumText);

    // BOT SCORE
     sumTextBot = TextComponent(
      text: "${bot.totalScore}",
      anchor: Anchor.topCenter,
      position: Vector2(size.x/2, 300),
    );
    add(sumTextBot);


    // GET CARD
    add(BtnGetCard(onPressed: (){
      player.takeCard2();
    }));

    // RESTART
    add(RestartButton(onPressed: (){
      player.restart();
      bot.restart();
    }));


    Future<void> botPlayingGameLogic() async{
      // take a first card
      bot.takeCard2();
      await Future.delayed(Duration(milliseconds: 500));
      // take a second card
      bot.takeCard2();
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

  @override
  void update(double dt){
    super.update(dt);

    if (player.totalScore != lastPlayerScore) {
      sumText.text = "${player.totalScore}";
      lastPlayerScore = player.totalScore;
    }

    if (bot.totalScore != lastBotScore) {
      sumTextBot.text = "${bot.totalScore}";
      lastBotScore = bot.totalScore;
    }

  }
}
