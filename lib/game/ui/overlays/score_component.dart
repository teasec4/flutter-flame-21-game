import 'package:flame/components.dart';
import 'package:gambling_game/game/logic/player.dart';

class ScoreComponent extends TextComponent{
  Player player;
  bool isBot;
  ScoreComponent({required this.player, this.isBot = false})
    :super(
    text: "${player.totalScore}",
    anchor: Anchor.topCenter,
  );

  @override
  void update(double dt){
    text = "${player.totalScore}";
  }

}