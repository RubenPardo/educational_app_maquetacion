import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PointsWidget extends StatelessWidget {
  final int points;
  const PointsWidget({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withAlpha(40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
        child: Row(
          children: [
            SizedBox(width: 24,child: Image.asset('assets/images/diamonds.png',),),
            const SizedBox(width: 6,),
            Text(points.toString(),style: Theme.of(context).textTheme.labelLarge,)
          ],
        ),
      ),
    );
  }
}