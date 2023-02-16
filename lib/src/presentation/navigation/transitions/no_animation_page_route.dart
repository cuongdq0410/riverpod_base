import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/widget/animations/fade_through_transition.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/widget/animations/show_up_animation.dart';

class NoAnimationPageRoute<T> extends MaterialPageRoute<T> {
  final Direction? direction;

  NoAnimationPageRoute({
    this.direction,
    required WidgetBuilder builder,
    RouteSettings? settings,
  }) : super(
          builder: builder,
          settings: settings,
          maintainState: true,
          fullscreenDialog: false,
        );

  @override
  Duration get transitionDuration => Duration.zero;

  @override
  Duration get reverseTransitionDuration => Duration.zero;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeThroughTransition(
      animation: animation,
      secondaryAnimation: secondaryAnimation,
      direction: direction,
      isUseCrossFade: false,
      isSlide: false,
      child: child,
    );
  }
}
