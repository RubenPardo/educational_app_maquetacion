import 'package:educational_app_maquetacion/data/model/game.dart';
import 'package:educational_app_maquetacion/presentation/widgets/game_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GameGridViewWidget extends StatelessWidget {
  final List<Game> games;
  const GameGridViewWidget({super.key, required this.games});

  @override
  Widget build(BuildContext context) {
    return Flexible(
            fit: FlexFit.loose,
            child: MasonryGridView.builder(
              padding: const EdgeInsets.all(0),
              gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: games.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => GameWidget(game: games[index],isExpand: ( index%3 != 0)),
            ),
          );
  }
}