import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:ghost_vs_wonderland/game.dart';

class Ghost extends SpriteComponent with HasGameRef<GhostGame> {
  static const double _size = 400.0;
  static const double _maxSpeed = 350.0;
  static const double _acc = 250.0;

  // current direction being pressed by the player
  final Vector2 move = Vector2.zero();

  Vector2 speed = Vector2.zero();

  Ghost() {
    anchor = Anchor.center;
    size = Vector2.all(_size);
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite('hero.png');
  }

  @override
  void update(double dt) {
    super.update(dt);

    final targetSpeed = move.clone()..scaleTo(_maxSpeed);
    final acc = (targetSpeed - speed)..scaleTo(_acc);

    speed += acc * dt;
    position += speed * dt + acc * dt * dt / 2;
  }
}
