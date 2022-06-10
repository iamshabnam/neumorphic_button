import 'package:flutter/material.dart';

extension ColorUtils on Color {
  Color? mix(Color another, double amount) {
    return Color.lerp(this, another, amount);
  }
}

class NeuButton3 extends StatelessWidget {
  NeuButton3({Key? key, this.child}) : super(key: key);

  final backgroundColor = const Color(0xFFE7ECEF);
  final Offset blurOffset = const Offset(28, 28);
  final double borderWidth = 30.0;
  final Color? color = Colors.grey.shade400;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderWidth)),
        gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
          color?.mix(Colors.black, .1) ?? Colors.white,
          color ?? Colors.white,
          color ?? Colors.white,
          color?.mix(Colors.white, .5) ?? Colors.white,
        ], stops: const [
          0.0,
          .3,
          .6,
          1.0,
        ]),
        // color: backgroundColor,
        // boxShadow: [
        //   BoxShadow(
        //     spreadRadius: 15,
        //     blurRadius: 20,
        //     offset: -blurOffset,
        //     color: Colors.white.withOpacity(0.5),
        //   ),
        //   BoxShadow(
        //     spreadRadius: 15,
        //     blurRadius: 20,
        //     offset: blurOffset,
        //     color: Colors.grey.shade400,
        //   ),
        // ],
      ),
      child: SizedBox(
        height: 150,
        width: 150,
        child: child,
      ),
    );
  }
}
