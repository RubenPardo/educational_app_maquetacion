import 'package:educational_app_maquetacion/data/model/game.dart';
import 'package:educational_app_maquetacion/data/service/game_service.dart';
import 'package:educational_app_maquetacion/presentation/widgets/points_widget.dart';
import 'package:educational_app_maquetacion/presentation/widgets/recent_game_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {

  final List<Game> _recentGames = GameService().getRecentGames();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _header(),
              _recent(size),
              _categories(),
              _newGames(),
            ],
          ),
      ),
    );
  }

  Widget _header(){
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            Expanded(
              child: Text('What do you want to play today?',style: Theme.of(context).textTheme.headlineLarge ,maxLines: 2,),
            ),
            const SizedBox(width: 33,),
            const PointsWidget(points: 22)

          ]
        
      ),
    );
  }

  Widget _recent(Size size){
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25,),
          Text("RECENT", style: Theme.of(context).textTheme.labelMedium,),
          SizedBox(
            height: size.height*0.215,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: _recentGames.map((e) => RecentGameWidget(game: e)).toList(),
            ),
          ),
        ],
      );
  }

  Widget _categories(){
    return Text('Categories');
  }

  Widget _newGames(){
    return Text('New Games');
  }
}