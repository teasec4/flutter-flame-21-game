import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/sprite.dart';
import 'package:gambling_game/game/components/card_component.dart';

class HandContainer extends PositionComponent {
  final List<Sprite> cardsSprites = [];
  final double gap;

  HandContainer({this.gap = 20.0,});

  @override
  Future<void> onLoad() async {
    _layout();
  }

  void _layout() {
    removeAll(children);

    double x = 0;

    for (int i = 0; i < cardsSprites.length; i++) {
      final sprite = cardsSprites[i];
      final card = CardComponent(sprite)
        ..anchor = Anchor.topLeft;


      if (i == cardsSprites.length - 1) {
        card.position = Vector2(x, -150);
        card.add(
          MoveToEffect(
            Vector2(x, 0),
            EffectController(duration: 0.5),
          ),
        );
      } else {
        card.position = Vector2(x, 0);
      }


      add(card);

      x += 88 + gap; // card width + gap
    }

    size = Vector2(x - gap, 124);
    anchor = Anchor.center;
  }

  void addCard(Sprite sprite) {
    cardsSprites.add(sprite);
    _layout();
  }
}