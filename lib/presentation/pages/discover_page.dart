import 'package:educational_app_maquetacion/data/model/category.dart';
import 'package:educational_app_maquetacion/data/model/game.dart';
import 'package:educational_app_maquetacion/data/service/game_service.dart';
import 'package:educational_app_maquetacion/presentation/widgets/categories_widget.dart';
import 'package:educational_app_maquetacion/presentation/widgets/game_grid_view_widget.dart';
import 'package:educational_app_maquetacion/presentation/widgets/points_widget.dart';
import 'package:educational_app_maquetacion/presentation/widgets/recent_game_widget.dart';
import 'package:flutter/material.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {

  final List<Game> _recentGames = GameService().getRecentGames();
  final List<Category> _categories = GameService().getCategories();
  final List<Game> _newGames = GameService().getNewGames();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(bottom: kToolbarHeight+8),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _header(),
              _recent(size),
              _builCategories(size),
              _new(size),
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
          const SizedBox(height: 15,),
          SizedBox(
            height: size.height*0.215,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(width: 15),
              shrinkWrap: true,
              itemCount: _recentGames.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => RecentGameWidget(game: _recentGames[index]),
            ),
          ),
        ],
      );
  }

  Widget _builCategories(Size size){
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("CATEGORIES", style: Theme.of(context).textTheme.labelMedium,),
              Text("See all →", style: Theme.of(context).textTheme.labelSmall,),
            ],
          ),
          const SizedBox(height: 15,),
          CategoriesWidget(categories: _categories)
        ],
      );
  }

  Widget _new(Size size){
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25,),
          Text("NEW GAMES", style: Theme.of(context).textTheme.labelMedium,),
          const SizedBox(height: 15,),
          GameGridViewWidget(games: _newGames)
        ],
      );
  }
}

