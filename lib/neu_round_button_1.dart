import 'package:flutter/material.dart';

class NeuRoundButton1 extends StatelessWidget {
  const NeuRoundButton1({Key? key, this.child}) : super(key: key);

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
          center: AlignmentDirectional(0.05, 0.05),
          focal: AlignmentDirectional(0, 0),
          radius: 0.5,
          focalRadius: 0,
          stops: [0.75, 1.0],
        ),
      ),
      child: child,
    );
  }
}
