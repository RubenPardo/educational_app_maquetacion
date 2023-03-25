import 'package:educational_app_maquetacion/data/model/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'dart:math' as math;

class RecentGameWidget extends StatelessWidget {
  final Game game;
  const RecentGameWidget({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    print(game.imageAsset);
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width*0.6,
      height: size.height*0.215,
      child: Stack(
        children: [
          // card -----------
          Align(
            alignment: Alignment.topLeft,
            child: _card(size,context)
          ),
          // progres -
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: _progress(size,context),
            ),
          )
        ],
      )
    );
  }

  Card _card(Size size, BuildContext context){
   return Card(
      
      color: game.category.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SizedBox(
        width: size.width*0.6,
        height: size.height*0.192,
        child: Stack(
          clipBehavior: Clip.hardEdge,
          fit: StackFit.loose,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: size.width*0.4),
              padding: const EdgeInsets.only(top: 20,left: 15),
              child: Align(
                
                alignment: Alignment.topLeft,
                child: Text(game.name,style: Theme.of(context).textTheme.headlineMedium,),
              ),
            ),
            Positioned(
              bottom: -50,
              right: -20,
              child: Image.asset(game.imageAsset,fit: BoxFit.cover,),
            )
          ],
        ),

      ),
    );
  }

  Widget _progress(Size size,context){
    double buttonSize = size.width*0.2;
    double buttonSizeInside = size.width*0.16;
    return Stack(
      children: [
        Container(
          width: buttonSize ,
          height: buttonSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xff2C2C2E),
              width: 12,
            ),
          ),
        ),
        SizedBox(
          width: buttonSize,
          height: buttonSize,
          child: CustomPaint(
            painter: ProgressIndicatorPainter(
              width: 5,
              color: game.category.secondaryColor,
              startAngle: 0,
              sweepAngle: (game.progres*3.6).toInt(), // es un circulo es respecto a 360
            ),
            child: Center(
              child: Container(
                width: buttonSizeInside,
                height: buttonSizeInside,
                decoration: BoxDecoration(
                  color: game.category.backgroundColor,
                  shape: BoxShape.circle,
                ),
                child: Center(child: Text("PLAY",style: Theme.of(context).textTheme.labelMedium,)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


class ProgressIndicatorPainter extends CustomPainter {
  const ProgressIndicatorPainter({
    required this.width,
    required this.color,
    required this.startAngle,
    required this.sweepAngle,
  }) : super();

  final double width;
  final Color color;
  final int startAngle;
  final int sweepAngle;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    final startAngleRad = (3*math.pi / 2);
    final sweepAngleRad = sweepAngle * (math.pi / 180);
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2.1) - (width / 2.1);
    paint.strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngleRad,
      sweepAngleRad,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}