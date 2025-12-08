import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:gambling_game/game/gambling_game.dart';
import 'package:flutter/material.dart';
import 'package:gambling_game/game/logic/game_state.dart';

class BalanceComponent extends HudMarginComponent with HasGameReference<GamblingGame>{
  GameState gameState;
  BalanceComponent({required this.gameState})
  : super(
    margin: const EdgeInsets.only(left: 20, bottom: 30),
  );

  final text = TextComponent(
      text: "Balance : 0",
      anchor: Anchor.bottomLeft
  );

  @override
  Future<void> onLoad() async{
    anchor = Anchor.bottomLeft;
    add(text);
  }

  @override
  void update(double dt) {
    super.update(dt);
    text.text = "\$${gameState.money}";
  }


}