import 'package:flutter/material.dart';

class PointsWidget extends StatelessWidget {
  final int points;
  final bool small;
  final bool withBackground;

  const PointsWidget({super.key, required this.points, this.small = false, this.withBackground = true});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: withBackground ?  Colors.white.withAlpha(82) : Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Padding(
        padding: !withBackground ? EdgeInsets.zero: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
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