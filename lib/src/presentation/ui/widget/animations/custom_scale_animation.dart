import 'package:flutter/material.dart';

import 'show_up_animation.dart';

class CustomScaleAnimation extends StatefulWidget {
  final Widget child;
  final Tween<double>? tween;
  final int? millisecondsDuration;

  const CustomScaleAnimation({
    Key? key,
    required this.child,
    this.tween,
    this.millisecondsDuration,
  }) : super(key: key);

  @override
  State<CustomScaleAnimation> createState() => _CustomScaleAnimationState();
}

class _CustomScaleAnimationState extends State<CustomScaleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scale;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.millisecondsDuration ?? 1500),
    );
    scale = (widget.tween ?? Tween<double>(begin: 0.1, end: 1))
        .animate(animationController);

    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ShowUpAnimation(
      offset: 0,
      animationDuration: const Duration(milliseconds: 1500),
      curve: Curves.fastOutSlowIn,
      child: ScaleTransition(
        scale: scale,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
