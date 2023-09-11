import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

extension AnimateWidgetExtensions on Widget {
  /// Wraps the target Widget in an Animate instance. Ex. `myWidget.animate()` is equivalent
  /// to `Animate(child: myWidget)`.
  Animate animate({
    Key? key,
    List<Effect>? effects,
    AnimateCallback? onInit,
    AnimateCallback? onPlay,
    AnimateCallback? onComplete,
    bool? autoPlay,
    Duration? delay,
    AnimationController? controller,
    Adapter? adapter,
    double? target,
  }) =>
      Animate(
        key: key,
        effects: effects,
        onInit: onInit,
        onPlay: onPlay,
        onComplete: onComplete,
        autoPlay: autoPlay,
        delay: delay,
        controller: controller,
        adapter: adapter,
        target: target,
        child: this,
      );
}
