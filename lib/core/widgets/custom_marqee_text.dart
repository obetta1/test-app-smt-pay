import 'package:flutter/cupertino.dart';
import 'package:marquee/marquee.dart';

class CustomMarqeeText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const CustomMarqeeText({super.key, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    return Marquee(
      text: text,
      style: style ?? const TextStyle(fontWeight: FontWeight.bold),
      scrollAxis: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.start,
      blankSpace: 20.0,
      velocity: 100.0,
      pauseAfterRound: Duration(seconds: 1),
      startPadding: 10.0,
      accelerationDuration: Duration(seconds: 1),
      accelerationCurve: Curves.linear,
      decelerationDuration: Duration(milliseconds: 500),
      decelerationCurve: Curves.easeOut,
    );
  }
}
