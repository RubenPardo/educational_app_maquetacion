import 'package:educational_app_maquetacion/data/model/category.dart';
import 'package:educational_app_maquetacion/data/model/sub_game.dart';


class Game{
  Category category;
  String imageAsset;
  int progres;
  String name;
  String description;
  List<SubGame> subGames;

  Game(this.category,this.progres, this.name,this.description, this.imageAsset,this.subGames,);


  int getTotalPoints(){
    return subGames.fold(0, (previousValue, element) => previousValue + element.points);
  }
}