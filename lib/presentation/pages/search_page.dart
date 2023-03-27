import 'package:educational_app_maquetacion/data/model/category.dart';
import 'package:educational_app_maquetacion/data/model/game.dart';
import 'package:educational_app_maquetacion/data/service/game_service.dart';
import 'package:educational_app_maquetacion/presentation/widgets/categories_widget.dart';
import 'package:educational_app_maquetacion/presentation/widgets/game_grid_view_widget.dart';
import 'package:educational_app_maquetacion/shared/colors.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {


  final List<Category> _categories = GameService().getCategories();
  late List<Category> _categoriesTMP;
  final List<Game> _recomendedGames = GameService().getRecomendedGames();
  late List<Game> _recomendedGamesTMP;

  @override
  void initState() {
    super.initState();
    _categoriesTMP = _categories;
    _recomendedGamesTMP = _recomendedGames;
  }

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
                _categoriesTMP.isEmpty ?  const Padding(padding: EdgeInsets.only(top: 24), child: Center(child: Text('No categories'),),): CategoriesWidget(categories: _categoriesTMP),
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
          _recomendedGamesTMP.isEmpty 
            ? const Padding(
              padding:  EdgeInsets.only(top:24.0),
              child:  Center(child: Text('No games')),
            )
            : GameGridViewWidget(games: _recomendedGamesTMP)
        ],
      );
  }

  Widget _searchBar(){
    return TextField(
      onChanged: (name) {
        _filterGamesAndCategoriesByName(name);
      },
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


  void _filterGamesAndCategoriesByName(String name){
    setState(() {
      if(name.trim().isEmpty){
        _categoriesTMP = _categories;
        _recomendedGamesTMP = _recomendedGames;
      }else{
        _categoriesTMP = _categories.where((element) => element.name.toLowerCase().startsWith(name.toLowerCase())).toList();
      _recomendedGamesTMP = _recomendedGames.where((element) => element.name.toLowerCase().startsWith(name.toLowerCase())).toList();
      }
      
    });
  }
}