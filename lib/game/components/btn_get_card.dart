import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';

class BtnGetCard extends HudMarginComponent {
  final Function() onPressed;
  BtnGetCard({required this.onPressed}) : super(
    margin: const EdgeInsets.only(right: 20, bottom: 20),
  );

  @override
  Future<void> onLoad() async {
    size = Vector2(150, 50);
    anchor = Anchor.bottomRight;

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
      text: "Get Card",
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