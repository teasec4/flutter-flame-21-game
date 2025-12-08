import 'package:gambling_game/game/components/hand_container.dart';
import 'package:gambling_game/game/logic/cards.dart';
import 'package:gambling_game/game/logic/player.dart';

class Bot extends Player {
  Bot({required Cards cards, required HandContainer handContainer})
      : super(cards: cards, handContainer: handContainer, isBot: true);
}