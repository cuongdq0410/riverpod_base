import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/widget/animations/fade_through_transition.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/widget/animations/show_up_animation.dart';

class FadePageRoute<T> extends MaterialPageRoute<T> {
  final Direction? direction;
  final bool isUseCrossFade;
  final bool isSlide;

  FadePageRoute({
    this.direction,
    required WidgetBuilder builder,
    RouteSettings? settings,
    this.isUseCrossFade = true,
    this.isSlide = true,
  }) : super(
          builder: builder,
          settings: settings,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeThroughTransition(
      animation: animation,
      secondaryAnimation: secondaryAnimation,
      direction: direction,
      isUseCrossFade: isUseCrossFade,
      isSlide: isSlide,
      child: child,
    );
  }
}
