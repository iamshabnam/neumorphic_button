import 'package:flutter/material.dart';

extension ColorUtils on Color {
  Color? mix(Color another, double amount) {
    return Color.lerp(this, another, amount);
  }
}

class NeuButton2 extends StatelessWidget{
  NeuButton2({Key? key, required this.child, this.borderWidth = 10.0}) : this.blurOffset = Offset(borderWidth / 2, borderWidth / 2),
  super(key: key);
  final double borderWidth;
  final Color outerTopLeftBorderColor = const Color(0xFFFFFFFF);
  final Color outerBottomRightBorderColor = const Color(0xFF000000);
  final Color innerTopLeftBorderColor = const Color(0xFFDFDFDF);
  final Color innerBottomRightBorderColor = const Color(0xFF7F7F7F);
  final Color buttonColor = const Color(0xFFBFBFBF);
  final Offset blurOffset;
  final Widget? child;
  final Color? color = const Color(0xFF00FFFF);

  // final colorC = Color.alphaBlend(const Color(0xFFFFFFFF), const Color(0xFF000000));
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color?.withRed(255) ?? Colors.red,
                Color.lerp(Colors.white, Colors.blue, .2) ?? Colors.white,
                Color?.lerp(Colors.white, Colors.red, .2) ?? Colors.white,
                // color?.withRed(255) ?? Colors.red,
                // Color?.lerp(Colors.white, Colors.red, .2) ?? Colors.white,
                // color?.mix(Colors.white, .2) ?? Colors.white,
                // color?.mix(Colors.white, .9) ?? Colors.white,
              ]
          ),
          borderRadius: BorderRadius.circular(borderWidth),
          // color: Colors.grey.shade200,
          boxShadow: [
            BoxShadow(
              blurRadius: borderWidth,
              // offset: -blurOffset,
              blurStyle: BlurStyle.outer,
              color: Colors.white,
            ),
            BoxShadow(
              blurRadius: borderWidth,
              offset: blurOffset,
              blurStyle: BlurStyle.inner,
              // color: Colors.black,
            ),
          ]),
      child: child,
    );
  }
}

// class NeumorphicContainer extends StatefulWidget {
//   final Widget child;
//   final double bevel;
//   final Offset blurOffset;
//   final Color color;
//
//   NeumorphicContainer({
//     required this.child,
//     this.bevel = 10.0,
//     required this.color,
//   })  : this.blurOffset = Offset(bevel / 2, bevel / 2), super(key: key);
//
//   @override
//   _NeumorphicContainerState createState() => _NeumorphicContainerState();
// }
//
// class _NeumorphicContainerState extends State<NeumorphicContainer> {
//   // New state, representing if surface is being pressed
//   bool _isPressed = false;
//
//   // We're only really interested in down and up events,
//   // for now.
//   void _onPointerDown(PointerDownEvent event) {
//     setState(() {
//       _isPressed = true;
//     });
//   }
//
//   void _onPointerUp(PointerUpEvent event) {
//     setState(() {
//       _isPressed = false;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final color = this.widget.color ?? Theme.of(context).backgroundColor;
//
//     // Listener is almost like GestureDetector,
//     // just a bit simpler
//     return Listener(
//       onPointerDown: _onPointerDown,
//       onPointerUp: _onPointerUp,
//       child: Container(
//       padding: const EdgeInsets.all(24.0),
//       decoration: BoxDecoration(
//           gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [
//                 // Colors.blue.mix(Colors.red, .5)
//                 // buttonColor.mix(Colors.white, .2),
//                 color?.withRed(255) ?? Colors.red,
//                 Color?.lerp(Colors.white, Colors.red, .2) ?? Colors.white,
//                 color?.mix(Colors.white, .2) ?? Colors.white,
//                 color?.mix(Colors.white, .9) ?? Colors.white,
//                 // color.mix(Colors.black, .1),
//               ]
//           ),
//           borderRadius: BorderRadius.circular(borderWidth),
//           // color: Colors.grey.shade200,
//           boxShadow: [
//             BoxShadow(
//               blurRadius: borderWidth,
//               // offset: -blurOffset,
//               blurStyle: BlurStyle.outer,
//               color: Colors.white,
//             ),
//             BoxShadow(
//               blurRadius: borderWidth,
//               offset: blurOffset,
//               blurStyle: BlurStyle.inner,
//               // color: Colors.black,
//             ),
//           ]),
//       child: child,
//     )
//     );
//   }
// }