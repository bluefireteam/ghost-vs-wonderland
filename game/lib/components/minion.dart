import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:ghost_vs_wonderland/game.dart';

class Minion extends PositionComponent with HasGameRef<GhostGame> {
  static const double _radius = 15.0;
  static final Paint _paint = Paint()..color = Colors.orange; 

  final Vector2 move = Vector2.zero();

  Vector2 speed = Vector2.zero();

  Minion() {
    anchor = Anchor.center;
    size = Vector2.all(_radius);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawCircle(Offset.zero, _radius, _paint);
  }
}
