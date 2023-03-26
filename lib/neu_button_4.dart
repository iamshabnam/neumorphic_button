import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

extension ColorUtils on Color {
  Color? mix(Color another, double amount) {
    return Color.lerp(this, another, amount);
  }
}

class NeuButton4 extends StatefulWidget {
  const NeuButton4({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  State<NeuButton4> createState() => _NeuButton4State();
}

class _NeuButton4State extends State<NeuButton4> {
  bool isDarkMode = false;
  bool isPressed = false;
  final double borderRadius = 30.0;

  // final Color darkBackgroundColor = const Color(0xFF2E3239);
  // final Color lightBackgroundColor = const Color(0xFFE7ECEF);

  // final Color darkShadowColor1 = const Color(0xFF35393F);
  // final Color darkShadowColor2 = const Color(0xFF23262A);

  // final Color lightShadowColor1 = Colors.white;
  // final Color lightShadowColor2 = const Color(0xFFA7A9AF);

  // final Offset blurOffsetIfPressed = const Offset(10, 10);
  // final Offset blurOffsetIfUnpressed = const Offset(28, 28);

  // final double blurRadiusIfPressed = 5.0;
  // final double blurRadiusIfUnpressed = 40.0;

  @override
  Widget build(BuildContext context) {
    final double containerSize = isPressed ? 195.0 : 200.0;
    final Color backgroundColor = isDarkMode ? const Color(0xFF2E3239) : const Color(0xFFE7ECEF);
    final Color shadowColor1 = isDarkMode ? const Color(0xFF35393F) : Colors.white;
    final Color shadowColor2 = isDarkMode ? const Color(0xFF23262A) : const Color(0xFFA7A9AF);
    // final Color shadowColor1 = isDarkMode ? Colors.white.withOpacity(0.1) : Colors.white.withOpacity(0.8);
    // final Color backgroundColor = isDarkMode ? const Color(0xFF292D32) : const Color(0xFFEFEEEE);
    // final Color shadowColor2 = isDarkMode ? Colors.black.withOpacity(0.4) : Colors.black.withOpacity(0.1);
    final Offset blurOffset = isPressed ? const Offset(10, 10) : const Offset(20, 20);
    final double blurRadius = isPressed ? 5.0 : 60.0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => setState(() => isDarkMode = !isDarkMode),
            icon:
                isDarkMode ? const Icon(Icons.light_mode) : const Icon(Icons.dark_mode, color: Colors.black),
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      body: Center(
        child: GestureDetector(
          onLongPress: () => setState(() => isPressed = !isPressed),
          onTap: () async {
            setState(() => isPressed = !isPressed);
            await Future.delayed(const Duration(milliseconds: 200));
            setState(() => isPressed = !isPressed);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: isPressed
                    ? [
                        backgroundColor,
                        backgroundColor,
                        backgroundColor.mix(Colors.black, .1) ?? Colors.white,
                        backgroundColor.mix(Colors.black, .3) ?? Colors.white,
                      ]
                    : [
                        backgroundColor.mix(Colors.black, .3) ?? Colors.white,
                        backgroundColor.mix(Colors.black, .1) ?? Colors.white,
                        backgroundColor,
                        backgroundColor,
                      ],
                stops: const [0.0, .4, .6, 1.0],
              ),
              // color: backgroundColor,
              boxShadow: [
                BoxShadow(
                  color: shadowColor1,
                  offset: -blurOffset,
                  blurRadius: blurRadius,
                  inset: isPressed,
                ),
                BoxShadow(
                  color: shadowColor2,
                  offset: blurOffset,
                  blurRadius: blurRadius,
                  inset: isPressed,
                ),
              ],
            ),
            child: SizedBox(
              height: containerSize,
              width: containerSize,
              child: widget.child ??
                  Center(
                    child: Text(
                      'BUTTON 4',
                      style: TextStyle(
                        color: isDarkMode ? Colors.black : Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
