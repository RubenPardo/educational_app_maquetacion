import 'package:educational_app_maquetacion/data/model/game.dart';
import 'package:educational_app_maquetacion/presentation/widgets/game_widget.dart';
import 'package:educational_app_maquetacion/shared/iterable_extensions.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GameGridViewWidget extends StatelessWidget {
  final List<Game> games;
  const GameGridViewWidget({super.key, required this.games});

  @override
  Widget build(BuildContext context) {
    List<List<Game>> gamesChunked = games.chunk(4);
    print(gamesChunked);
    return Flexible(
        fit: FlexFit.loose,
        child: ListView.builder(
          itemCount: gamesChunked.length,
          itemBuilder: (context, indexList) {
            return MasonryGridView.builder(
              padding: const EdgeInsets.all(0),
              gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: gamesChunked[indexList].length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, indexGrid){
                return GameWidget(game: gamesChunked[indexList][indexGrid],isExpand: (indexGrid%3!=0));
                
                }
              );
          },
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,

      )
    );
  }
}