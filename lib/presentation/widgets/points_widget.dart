import 'package:flutter/material.dart';

class PointsWidget extends StatelessWidget {
  final int points;
  final bool small;
  const PointsWidget({super.key, required this.points, this.small = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withAlpha(82),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: small ?16 :24,child: Image.asset('assets/images/diamonds.png',),),
            const SizedBox(width: 6,),
            Text(points.toString(),style: 
            small ? Theme.of(context).textTheme.labelMedium
                  : Theme.of(context).textTheme.labelLarge,)
          ],
        ),
      ),
    );
  }
}