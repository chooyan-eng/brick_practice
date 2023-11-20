import 'dart:async';

import 'package:brick_practice/game/ball.dart';
import 'package:brick_practice/game/hit/hit_positions.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class BreakingBlock extends RectangleComponent with CollisionCallbacks {
  BreakingBlock({super.paint, super.position}) : super(size: Vector2(40, 20));

  @override
  FutureOr<void> onLoad() {
    add(UpperHitbox(size));
    add(BottomHitbox(size));
    add(LeftHitbox(size));
    add(RightHitbox(size));
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Ball) {
      removeFromParent();
    }
    super.onCollision(intersectionPoints, other);
  }
}
