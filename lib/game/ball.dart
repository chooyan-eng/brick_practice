import 'dart:async';

import 'package:brick_practice/game/controller_notifiable.dart';
import 'package:brick_practice/game/hit/hit_positions.dart';
import 'package:brick_practice/game/player.dart';
import 'package:brick_practice/state/controller_state.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';

class Ball extends CircleComponent with CollisionCallbacks {
  Ball()
      : super(
          radius: 10,
          paint: BasicPalette.black.paint(),
          position: Vector2(-100, -60),
        );

  static const _initialSpeed = 200.0;

  var _vector = Vector2(10, 10);
  var _collisionFreeTime = 0.0;
  var _additionalSpeed = 0.0;

  double get _speed => _initialSpeed + _additionalSpeed;

  @override
  Future<void> onLoad() {
    add(CircleHitbox());
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);

    position += _vector.normalized() * dt * _speed;

    if (_collisionFreeTime > 0) {
      _collisionFreeTime -= dt;
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (_collisionFreeTime > 0) {
      return;
    }
    _vector = _vector.reflected(switch (other) {
      UpperHitbox() => Vector2(0, -1),
      BottomHitbox() => Vector2(0, -1),
      LeftHitbox() => Vector2(-1, 0),
      RightHitbox() => Vector2(-1, 0),
      _ => Vector2(0, 0),
    });

    if (other.parent is Player) {
      _vector += switch (ControllerNotifiable.find(this).value) {
        ControllerState.left => Vector2(-5, 0),
        ControllerState.right => Vector2(5, 0),
        ControllerState.neutral => Vector2(0, 0),
      };
      _additionalSpeed += 10;
    }

    _collisionFreeTime = 0.1;
    super.onCollision(intersectionPoints, other);
  }
}
