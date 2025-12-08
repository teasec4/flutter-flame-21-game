import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';

class RestartButton extends HudMarginComponent{
  final Function() onPressed;

  RestartButton({required this.onPressed})
    :super(
    margin: const EdgeInsets.only(right: 20, top: 50),
    anchor: Anchor.topRight,
    size: Vector2(150,50),
  );

  @override
  Future<void> onLoad() async{
      add(
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
          onPressed: onPressed,
        ),
      );
      add(
        TextComponent(
          text: "Restart",
          anchor: Anchor.center,
          position: Vector2(75, 25),
          textRenderer: TextPaint(
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),

      );
  }
}