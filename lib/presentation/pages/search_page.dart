import 'package:educational_app_maquetacion/data/model/category.dart';
import 'package:educational_app_maquetacion/data/model/game.dart';
import 'package:educational_app_maquetacion/data/service/game_service.dart';
import 'package:educational_app_maquetacion/presentation/widgets/categories_widget.dart';
import 'package:educational_app_maquetacion/presentation/widgets/game_grid_view_widget.dart';
import 'package:educational_app_maquetacion/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {


  final List<Category> _categories = GameService().getCategories();
  final List<Game> _recomendedGames = GameService().getRecomendedGames();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _header(),
                const SizedBox(height: 15,),
                _searchBar(),
                const SizedBox(height: 15,),
                CategoriesWidget(categories: _categories),
                const SizedBox(height: 15,),
                _recomended(size),
              ],
            ),
        ),
      ),
    );
  }

  Widget _recomended(Size size){
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25,),
          Text("RECOMENDED", style: Theme.of(context).textTheme.labelMedium,),
          const SizedBox(height: 15,),
          GameGridViewWidget(games: _recomendedGames)
        ],
      );
  }

  Widget _searchBar(){
    return TextField(
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        fillColor: AppColors.textFieldBG,
        filled: true,
        hintText: 'Games, subjects...',
        prefixIcon: Image.asset('assets/images/search_icon.png',cacheHeight: 15,),
        hintStyle: Theme.of(context).textTheme.labelSmall,
        border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(4)))

      ),
    );
  }
   Widget _header(){
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Text('Search',style: Theme.of(context).textTheme.headlineLarge),
    );
  }

}