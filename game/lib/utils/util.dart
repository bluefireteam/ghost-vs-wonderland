import 'dart:math';

import 'package:flame/extensions.dart';

final r = Random();

extension RandomExtension on Random {
  Vector2 nextVector2() {
    return Vector2(nextDouble(), nextDouble());
  }

  Vector2 nextAscendingVector2() {
    return Vector2(nextDouble(), 0);
  }
}

// TODO(luan) consider for dartlin
extension ListExt<T> on List<T> {
  T sample() {
    return this[r.nextInt(length)];
  }
}
