import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedBuilderPage extends StatefulWidget {
  AnimatedBuilderPage();

  @override
  State<AnimatedBuilderPage> createState() => _AnimatedBuilderPage();
}

class _AnimatedBuilderPage extends State<AnimatedBuilderPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animation;

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Image.network(
          "https://ak.picdn.net/shutterstock/videos/26887384/thumb/1.jpg",
          fit: BoxFit.fitWidth,
        ),
        AnimatedBuilder(
          builder: (_, __) {
            return ClipPath(
              clipper: const BeamClipper(),
              child: Container(
                height: 1000 - _animation.value * 1000,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    radius: 1.5,
                    colors: [
                      Colors.yellow,
                      Colors.transparent,
                    ],
                    stops: [0, _animation.value],
                  ),
                ),
              ),
            );
          },
          animation: _animation,
        )
      ],
    );
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }
}

class BeamClipper extends CustomClipper<Path> {
  const BeamClipper();

  @override
  getClip(Size size) {
    return Path()
      ..lineTo(size.width / 2, size.height / 2)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(size.width / 2, size.height / 2)
      ..close();
  }

  /// Return false always because we always clip the same area.
  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}
