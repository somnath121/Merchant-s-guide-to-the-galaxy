import 'package:flutter/material.dart';

class AnimatedElevatedButton extends StatefulWidget {
  late Widget childToshow;
  late double borderRadius;
  late Color backColor;
  late GestureTapCallback onTapped;
  AnimatedElevatedButton(
      {required Widget child,
      required Color color,
      required double cornerRadius,
      required GestureTapCallback onTap}) {
    childToshow = child;
    backColor = color;
    borderRadius = cornerRadius;
    onTapped = onTap;
  }
  @override
  _AnimatedElevatedButtonState createState() =>
      _AnimatedElevatedButtonState();
}

class _AnimatedElevatedButtonState extends State<AnimatedElevatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animationTween;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(milliseconds: 30),
      vsync: this,
    );
    _animationTween =
        Tween(begin: 20.0, end: 0.0).animate(_animationController);
    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var childWidget = widget.childToshow;
    return GestureDetector(
      onTap: widget.onTapped,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      child: Material(
        color: widget.backColor,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        elevation: _animationTween.value,
        child: childWidget,
      ),
    );
  }

  void _onTapDown(TapDownDetails details) {
    _animationController.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _animationController.reverse();
  }
}
