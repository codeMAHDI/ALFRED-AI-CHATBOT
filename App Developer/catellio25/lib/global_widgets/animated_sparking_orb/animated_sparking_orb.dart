import 'dart:ui';
import 'package:flutter/material.dart';

class AnimatedSparkingOrb extends StatefulWidget {
  final String imagePath;
  final double width;
  final double height;

  const AnimatedSparkingOrb({
    super.key,
    required this.imagePath,
    required this.width,
    required this.height,
  });

  @override
  State<AnimatedSparkingOrb> createState() => _AnimatedSparkingOrbState();
}

class _AnimatedSparkingOrbState extends State<AnimatedSparkingOrb> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();

    // Create an erratic pulsing effect to simulate electric sparking
    _opacityAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.8), weight: 10),
      TweenSequenceItem(tween: Tween(begin: 0.8, end: 0.1), weight: 5),
      TweenSequenceItem(tween: Tween(begin: 0.1, end: 0.9), weight: 15),
      TweenSequenceItem(tween: Tween(begin: 0.9, end: 0.0), weight: 20),
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.3), weight: 10),
      TweenSequenceItem(tween: Tween(begin: 0.3, end: 1.0), weight: 10),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 30),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Base static image
          Image.asset(
            widget.imagePath,
            width: widget.width,
            height: widget.height,
            fit: BoxFit.contain,
          ),
          
          // Glowing/sparking layer
          AnimatedBuilder(
            animation: _opacityAnimation,
            builder: (context, child) {
              return Opacity(
                opacity: _opacityAnimation.value,
                child: child,
              );
            },
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 2.0),
              child: ColorFiltered(
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.overlay,
                ),
                child: Image.asset(
                  widget.imagePath,
                  width: widget.width,
                  height: widget.height,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
