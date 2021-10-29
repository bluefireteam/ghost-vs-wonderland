import 'dart:math';

import 'package:flame/extensions.dart';

final r = Random();

extension RandomExtension on Random {
  Vector2 nextVector2() {
    return Vector2(nextDouble(), nextDouble());
  }
}
