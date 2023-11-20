import 'dart:async';

import 'package:brick_practice/game/brick_world.dart';
import 'package:brick_practice/game/controller_notifiable.dart';
import 'package:brick_practice/overlay/controller.dart';
import 'package:brick_practice/state/controller_state.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';

class BrickGame extends FlameGame
    with HasCollisionDetection, ControllerNotifiable {
  BrickGame(this.controllerNotifier)
      : super(
          world: BrickWorld(),
          camera: CameraComponent.withFixedResolution(
            width: BrickWorld.size.x,
            height: BrickWorld.size.y,
          ),
        );

  final ControllerStateNotifier controllerNotifier;

  @override
  ControllerStateNotifier get notifier => controllerNotifier;

  @override
  FutureOr<void> onLoad() {
    overlays.add(Controller.label);

    camera.backdrop.add(RectangleComponent(
      size: size,
      paint: BasicPalette.cyan.paint(),
    ));
  }
}
