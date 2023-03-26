import 'package:educational_app_maquetacion/data/model/category.dart';
import 'package:educational_app_maquetacion/data/model/game.dart';
import 'package:educational_app_maquetacion/data/model/sub_game.dart';

class GameService{

  List<Game> getRecentGames(){
    return [
      Game(
        Category.math(), 
        66,
        "The game of six numbers", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi iaculis pretium tempor. Praesent scelerisque molestie ipsum, consequat placerat nulla congue eget. Vestibulum vitae diam quis odio rhoncus convallis at non ipsum.", 
        "assets/images/music_card.png",
        [
          SubGame('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi iaculis pretium tempor.', 'imageUrl', 3),
          SubGame('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi iaculis pretium tempor.', 'imageUrl', 3),
          SubGame('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi iaculis pretium tempor.', 'imageUrl', 3),
        
        ]
      ),
      Game(
        Category.geography(), 
        25,
        "Around the world", "Wear your explorer’s helmet and be prepared to fly to exciting and exotic locations.", 
        "assets/images/geo_card.png",
        
        [
          SubGame('The European capitals', 'assets/images/arraound_the_world_1.png', 2),
          SubGame('The highest mountains', 'assets/images/arraound_the_world_2.png', 3),
          
        ]
      ),
      Game(
        Category.grammar(), 
        10,
        "Titulo ejemploo", "Wear your explorer's helmet and be prepared to fly to exciting and exotic locations.", 
        "assets/images/find_card.png",
        
        [
          SubGame('The European capitals', 'assets/images/arraound_the_world_1.png', 2),
          SubGame('The highest mountains', 'assets/images/arraound_the_world_2.png', 3),
          
        ]
      ),
    ];
  }

  List<Game> getNewGames(){
    return [
      Game(
        Category.grammar(), 
        0,
        "Listen and learn", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi iaculis pretium tempor. Praesent scelerisque molestie ipsum, consequat placerat nulla congue eget. Vestibulum vitae diam quis odio rhoncus convallis at non ipsum.", 
        "assets/images/grammar_card.png",
        [
          SubGame('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi iaculis pretium tempor.', 'imageUrl', 3),
          SubGame('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi iaculis pretium tempor.', 'imageUrl', 3),
          SubGame('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi iaculis pretium tempor.', 'imageUrl', 4),
        
        ]
      ),
      Game(
        Category.sicence(), 
        25,
        "Memory cards", "Wear your explorer's helmet and be prepared to fly to exciting and exotic locations.", 
        "assets/images/science_card.png",
        [
          SubGame('The European capitals', 'assets/images/arraound_the_world_1.png', 2),
          SubGame('The highest mountains', 'assets/images/arraound_the_world_2.png', 3),
          
        ]
      ),
    ];
  }

  List<Game> getRecomendedGames(){
    return [
      Game(
        Category.music(), 
        25,
        "Listen and learn", "Wear your explorer's helmet and be prepared to fly to exciting and exotic locations.", 
        "assets/images/music_card_2.png",
        [
          SubGame('The European capitals', 'assets/images/arraound_the_world_1.png', 5),
          SubGame('The highest mountains', 'assets/images/arraound_the_world_2.png', 5),
          
        ]
      ),
      Game(
        Category.grammar(), 
        0,
        "Listen and learn", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi iaculis pretium tempor. Praesent scelerisque molestie ipsum, consequat placerat nulla congue eget. Vestibulum vitae diam quis odio rhoncus convallis at non ipsum.", 
        "assets/images/find_card.png",
        [
          SubGame('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi iaculis pretium tempor.', 'imageUrl', 3),
          SubGame('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi iaculis pretium tempor.', 'imageUrl', 3),
          SubGame('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi iaculis pretium tempor.', 'imageUrl', 4),
        
        ]
      ),
      Game(
        Category.math(), 
        66,
        "Puzzle games", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi iaculis pretium tempor. Praesent scelerisque molestie ipsum, consequat placerat nulla congue eget. Vestibulum vitae diam quis odio rhoncus convallis at non ipsum.", 
        "assets/images/puzzle_card.png",
        [
          SubGame('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi iaculis pretium tempor.', 'imageUrl', 3),
          SubGame('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi iaculis pretium tempor.', 'imageUrl', 3),
          SubGame('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi iaculis pretium tempor.', 'imageUrl', 3),
        
        ]
      ),
      Game(
        Category.sicence(), 
        25,
        "Around the world", "Wear your explorer’s helmet and be prepared to fly to exciting and exotic locations.", 
        "assets/images/clock_card.png",
        [
          SubGame('The European capitals', 'assets/images/arraound_the_world_1.png', 2),
          SubGame('The highest mountains', 'assets/images/arraound_the_world_2.png', 3),
          
        ]
      ),
    ];
  }

  List<Category> getCategories(){
    return [
      Category.math(),
      Category.sicence(),
      Category.grammar(),
      Category.music(),
      Category.geography(),

    ];
  }

}