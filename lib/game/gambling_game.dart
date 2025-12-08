import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:gambling_game/game/components/background_component.dart';
import 'package:gambling_game/game/logic/blackjack_rules.dart';
import 'package:gambling_game/game/logic/bot.dart';
import 'package:gambling_game/game/logic/game_state.dart';
import 'package:gambling_game/game/logic/player.dart';
import 'package:gambling_game/game/ui/overlays/balance_component.dart';
import 'package:gambling_game/game/ui/overlays/btn_get_card.dart';
import 'package:gambling_game/game/components/hand_container.dart';
import 'package:gambling_game/game/logic/cards.dart';
import 'package:gambling_game/game/ui/overlays/imdone_button.dart';
import 'package:gambling_game/game/ui/overlays/restart_button.dart';
import 'package:gambling_game/game/ui/overlays/score_component.dart';

class GamblingGame extends FlameGame {
  late Player player;
  late Bot bot;
  late GameState gameState;

  @override
  Future<void> onLoad() async{
    final cards = await Cards.init();
    gameState = GameState();

    // create a HandContainer on bottom center for PLAYER
    final handPlayer = HandContainer()
      ..size = Vector2(size.x, 150)
      ..position = Vector2(size.x / 2, size.y * 0.8);
    add(handPlayer);

    // create a HandContainer no top center for BOT
    final handBot = HandContainer(isBot: true)
      ..size = Vector2(size.x, 150)
      ..position = Vector2(size.x/2, size.y * 0.2);
    add(handBot);

     player = Player(cards: cards, handContainer: handPlayer);
     bot = Bot(cards: cards, handContainer: handBot);

    // creating background
    add(BackgroundComponent()
      ..size = size
      ..priority = -1
    );

    // PLAYER SCORE
    add(ScoreComponent(player: player)
      ..position = Vector2(size.x/2, 600),
    );

    // BOT SCORE
    add(ScoreComponent(player: bot)
      ..position = Vector2(size.x/2, 300),
    );

    // GET CARD
    add(BtnGetCard(onPressed: (){
      player.takeCard2();
    }));

    void restartRound(){
      player.restart();
      bot.restart();
    }

    // RESTART
    add(RestartButton(onPressed: (){
      restartRound();
    }));



    Future<void> botPlayingGameLogic() async{
      // take a first card
      bot.takeCard2();
      await Future.delayed(Duration(milliseconds: 500));
      // take a second card
      bot.takeCard2();
      while (bot.totalScore < 17) {
        await Future.delayed(Duration(milliseconds: 500));
        bot.takeCard2();
      }


      // check who won?
      final result = BlackjackRules.determineWinner(
        player.totalScore,
        bot.totalScore,
      );

      await Future.delayed(Duration(seconds: 3));

      switch (result) {
        case GameResult.playerWins:
          gameState.playerWins();
          print('Player wins!');
        case GameResult.botWins:
          gameState.playerLoses();
          print('Bot wins!');
        case GameResult.draw:
          print('Draw!');
      }

      restartRound();

    }

    // Bot Tern Btn
    add(ImdoneButton(onPressed: ()async{
       await botPlayingGameLogic();
    }));

    // balance component
    add(BalanceComponent(gameState: gameState));

  }

}
