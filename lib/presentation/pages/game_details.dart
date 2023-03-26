import 'package:educational_app_maquetacion/data/model/game.dart';
import 'package:educational_app_maquetacion/data/model/sub_game.dart';
import 'package:educational_app_maquetacion/presentation/widgets/points_widget.dart';
import 'package:educational_app_maquetacion/shared/bezier_clipper.dart';
import 'package:educational_app_maquetacion/shared/colors.dart';
import 'package:flutter/material.dart';

class GameDetails extends StatelessWidget {
  final Game game;
  const GameDetails({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: AppColors.backgroundColor,
      child: SingleChildScrollView(
        child: Column(
            children: [
              _header(context, size),
              _content(context, size)
            ],
         
        ),
      ),
    );
  }

  Widget _header(BuildContext context, Size size) {
    return ClipRRect(// que la imagen se ajuste al border del container
      borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      child: ClipPath(// borde inferior con cuvas
        clipper: BezierClipper(),
        child: Container(
          decoration:  BoxDecoration(
           
            color: game.category.backgroundColor,
            image: const DecorationImage(
                image: AssetImage(
                  'assets/images/game_details_bg.png',
                ),
                scale: 1,
                fit: BoxFit.cover
              ),
          ),
          height: size.height * 0.48,
          width: size.width,
          child: Stack(
            children: [
              Positioned(
                top: 20,
                right: -100,
                child: Image.asset(
                  game.imageAsset,
                  scale: 0.35,
                ),
              ),
              // Close button
              Align(
                alignment: Alignment.topLeft,
                child: _closeButton(context)
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _closeButton(BuildContext context){
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(
            center: Alignment.topLeft,
            radius: 1,
            colors:[
              Colors.black.withOpacity(0.3),
              Colors.transparent
            ]
          ),
        ),
        padding:const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.48),
                  borderRadius: BorderRadius.circular(8)),
              child: const Icon(
                Icons.arrow_downward,
                size: 24,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text('Close')
          ],
        ),
      ),
    );
  }

  Widget _content(BuildContext context, Size size) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          PointsWidget(points: game.getTotalPoints()),
          const SizedBox(height: 15,),
          Text(game.name,style: Theme.of(context).textTheme.headlineLarge,),
          const SizedBox(height: 10,),
          Text(game.description, 
            style: Theme.of(context).textTheme.bodyMedium!
                .copyWith(color: AppColors.textColor.withOpacity(0.72))),
          const SizedBox(height: 15,),
        
          _subGames(game.subGames, context)
        ],
      ),
    );
  }

  Widget _subGames(List<SubGame> subgames, BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('GAMES',style: Theme.of(context).textTheme.labelMedium,),
        const SizedBox(height: 15,),
         ...game.subGames.map((e) =>  _subGame(e,context))
      ],
    );
  }
  Widget _subGame(SubGame subGame,BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Row(
        children: [
          // icono
          Image.asset(subGame.imageUrl,height: 40),
          const SizedBox(width: 14,),
          // nombre
          _subGameTitle(context,subGame),
          const SizedBox(width: 20,),

          // play button
          _playButton(context)
        ],
      ),
    );
  }

  Widget _subGameTitle(BuildContext context, SubGame subGame){
    return Flexible(
            fit: FlexFit.tight,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(game.name,style: Theme.of(context).textTheme.bodySmall,),
                PointsWidget(points: subGame.points,withBackground:false,small: true,),
              
              ],
            ),
          );
  }

  Widget _playButton(BuildContext context){
    return Card(
            color:  Colors.white.withAlpha(82),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/play_icon.png'),
                  const SizedBox(width: 4,),
                  Text('PLAY',style: Theme.of(context).textTheme.labelSmall,)
                ],
              ),
            ),
          );
  }
}
