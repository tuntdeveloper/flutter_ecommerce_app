import 'package:flutter/material.dart';

class AppColors {
  const AppColors._(this.context);

  final BuildContext context;

  factory AppColors.of(BuildContext context) {
    return AppColors._(context);
  }

  Color get backgroundColor {
    return Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3);
  }

  Color get primaryColor {
    return Theme.of(context).colorScheme.primary;
  }

  Color get redColor {
    return Theme.of(context).colorScheme.error;
  }
}
