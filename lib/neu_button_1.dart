import 'package:flutter/material.dart';

class NeuButton1 extends StatelessWidget {
  const NeuButton1({Key? key, this.child, this.bevel =  2.0}) : super(key: key);
  final double bevel;
  final Color outerTopLeftBorderColor = const Color(0xFFFFFFFF);
  final Color outerBottomRightBorderColor = const Color(0xFF000000);
  final Color innerTopLeftBorderColor = const Color(0xFFDFDFDF);
  final Color innerBottomRightBorderColor = const Color(0xFF7F7F7F);
  final Color buttonColor = const Color(0xFFBFBFBF);
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: bevel, color: outerTopLeftBorderColor),
          left: BorderSide(width: bevel, color: outerTopLeftBorderColor),
          right: BorderSide(width: bevel, color: outerBottomRightBorderColor),
          bottom: BorderSide(width: bevel, color: outerBottomRightBorderColor),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: bevel, color: innerTopLeftBorderColor),
            left: BorderSide(width: bevel, color: innerTopLeftBorderColor),
            right: BorderSide(width: bevel, color: innerBottomRightBorderColor),
            bottom: BorderSide(width: bevel, color: innerBottomRightBorderColor),
          ),
          color: buttonColor,
        ),
        child: child,
      ),
    );
  }
}
