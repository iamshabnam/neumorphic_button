import 'package:flutter/material.dart';

class NeuRoundButton2 extends StatelessWidget {
  const NeuRoundButton2({Key? key, this.child}) : super(key: key);

  final Color shadowColor = Colors.black;
  final Color backgroundColor = Colors.grey;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.white,
        shape: BoxShape.circle,
        // gradient: LinearGradient(colors: [Colors.white, Colors.black])
        gradient: RadialGradient(
          colors: [
            backgroundColor,
            shadowColor,
          ],
          center: const AlignmentDirectional(0.05, 0.05),
          focal: const AlignmentDirectional(0, 0),
          radius: 0.5,
          focalRadius: 0,
          stops: const [0.75, 1.0],
        ),
      ),
      child: Container(
        decoration: BoxDecoration(color: backgroundColor, shape: BoxShape.circle, boxShadow: [
          const BoxShadow(color: Colors.white70, offset: Offset(-10, -10), blurRadius: 20, spreadRadius: 0),
          BoxShadow(color: shadowColor, offset: const Offset(10, 10), blurRadius: 20, spreadRadius: 0)
        ]),
        child: child,
      ),
    );
  }
}
