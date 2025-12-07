import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:gambling_game/game/gambling_game.dart';
import 'package:flutter/material.dart';

class BalanceComponent extends HudMarginComponent with HasGameReference<GamblingGame>{
  BalanceComponent()
  : super(
    margin: const EdgeInsets.only(left: 20, bottom: 20),
  );

  @override
  Future<void> onLoad() async{
    anchor = Anchor.bottomLeft;
    add(
      TextComponent(
        text: "Balance : 200",
        anchor: Anchor.bottomLeft
      )
    );
  }

}