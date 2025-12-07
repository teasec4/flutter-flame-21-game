import 'package:flame/components.dart';

class CardComponent extends SpriteComponent {
  CardComponent(Sprite sprite)
      : super(
          sprite: sprite,
          size: Vector2(88, 124),
          anchor: Anchor.center,
        );
}