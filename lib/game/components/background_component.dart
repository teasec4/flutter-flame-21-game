
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

class BackgroundComponent extends PositionComponent{

  @override
  Future<void> onLoad() async{
    final image = await Flame.images.load("Card_Back-88x124.png");
    final sprite = Sprite(image);
    add(
      SpriteComponent(
        sprite: sprite,
        position: Vector2(size.x/2, size.y/2),
        anchor: Anchor.center,
      )
    );
  }

  @override
  void render(Canvas canvas){
    final rect = Rect.fromLTWH(0, 0, size.x, size.y);

    // green table
    final paint = Paint()
    ..shader = const RadialGradient(
      colors: [
        Color(0xFF0A5C2F),
        Color(0xFF03381C),
      ],
    ).createShader(rect);

    canvas.drawRect(rect, paint);

  }
}