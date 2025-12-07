import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';

class CardSheet {
  late SpriteSheet sheet;
  late double cardWidth;
  late double cardHeight;

  final int columns = 5;
  final int rows = 3;

  Future<CardSheet> load(String fileName) async{
    final image = await Flame.images.load(fileName);

    cardWidth = image.width / columns;
    cardHeight = image.height / rows;

    sheet = SpriteSheet(
        image: image,
        srcSize: Vector2(cardWidth, cardHeight)
    );

    return this;
  }

  Sprite getCard(int row, int col){
    return sheet.getSprite(row, col);
  }
}