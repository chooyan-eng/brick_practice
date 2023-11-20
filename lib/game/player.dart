import 'dart:async';
import 'dart:math';

import 'package:brick_practice/game/controller_notifiable.dart';
import 'package:brick_practice/game/hit/hit_positions.dart';
import 'package:brick_practice/state/controller_state.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';

class Player extends RectangleComponent {
  Player()
      : super(
          size: Vector2(100, 20),
          position: Vector2(-50, 240),
          paint: BasicPalette.blue.paint(),
        );

  static const _speed = 200;

  var _state = ControllerState.neutral;

  @override
  FutureOr<void> onLoad() {
    add(UpperHitbox(size));
    add(BottomHitbox(size));
    add(LeftHitbox(size));
    add(RightHitbox(size));

    ControllerNotifiable.find(this).addListener(_updateState);
  }

  void _updateState() {
    _state = ControllerNotifiable.find(this).value;
  }

  @override
  void update(double dt) {
    super.update(dt);
    switch (_state) {
      case ControllerState.left:
        final start = position.x;
        final destination = max(start - _speed * dt, -200.0);
        position.x = destination;
        break;
      case ControllerState.right:
        final start = position.x;
        final destination = min(start + _speed * dt, 200.0 - size.x);
        position.x = destination;
        break;
      case ControllerState.neutral:
        break;
    }
  }
}
