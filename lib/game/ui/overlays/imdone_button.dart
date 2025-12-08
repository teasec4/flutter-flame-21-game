import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:gambling_game/game/gambling_game.dart';

class ImdoneButton extends PositionComponent with HasGameReference<GamblingGame>{
  final Function() onPressed;
  ImdoneButton({required this.onPressed});

  @override
  Future<void> onLoad() async {
    size = Vector2(150, 50);
    position = Vector2(game.size.x - 20, game.size.y / 2);  // справа и по центру вертикально
    anchor = Anchor.centerRight;


    final btn = ButtonComponent(
      button: RectangleComponent(
        size: size,
        paint: Paint()..color = const Color(0xFF333333),
        anchor: Anchor.topLeft,
      ),
      buttonDown: RectangleComponent(
        size: size,
        paint: Paint()..color = const Color(0xFF555555),
        anchor: Anchor.topLeft,
      ),
      position: Vector2.zero(),
      onPressed: onPressed,
    );

    // текст нужно добавлять КАК ОТДЕЛЬНЫЙ КОМПОНЕНТ
    final text = TextComponent(
      text: "Stand",
      anchor: Anchor.center,
      position: size / 2,       // ← центр кнопки
      priority: 1,              // ← чтобы был выше прямоугольника
      textRenderer: TextPaint(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );

    add(btn);
    add(text);

  }
}