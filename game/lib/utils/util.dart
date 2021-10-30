import 'dart:math';

import 'package:flame/extensions.dart';

extension RandomExtension on Random {
  Vector2 nextVector2() {
    return Vector2(nextDouble(), nextDouble());
  }

  Vector2 nextAscendingVector2() {
    return Vector2(nextDouble(), 0);
  }
}
