import 'package:educational_app_maquetacion/data/model/game.dart';
import 'package:educational_app_maquetacion/presentation/widgets/points_widget.dart';
import 'package:flutter/material.dart';

class GameWidget extends StatelessWidget {
  final Game game;
  final bool isExpand;
  const GameWidget({super.key, required this.game, required this.isExpand});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      color: game.category.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        constraints: BoxConstraints(
          minHeight: isExpand ? size.height*0.33 : size.height*0.3
         ),
        padding: const EdgeInsets.only(left: 15,),
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            
            // nombre -------
            Positioned(
              bottom: !isExpand ? 15 : null, 
              top: !isExpand ? null : 15,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: size.width*0.3
                ),
                child: Text(game.name,style: Theme.of(context).textTheme.headlineMedium,),
              ),
            ),
            // imagen -----------
            Positioned(
              right: -30,
              top: isExpand ? 60 : 13, 
              child: Image.asset(game.imageAsset,fit: BoxFit.cover,scale: 0.9,),
            ),
            
            //puntos -------------
            Align(
              alignment: isExpand ? Alignment.bottomLeft  : Alignment.topLeft,
              child: Padding(padding: const EdgeInsets.only(bottom: 15,top: 15),child: PointsWidget(points: game.getTotalPoints(), small:true),),
            ),

          
            
          ],
        ),
      ),
    );
  }
}