import 'dart:async';

import 'package:brick_practice/game/hit/hit_positions.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';

class Wall extends RectangleComponent {
  Wall({required this.parentSize})
      : super(
          size: parentSize + Vector2.all(2),
          position: Vector2((parentSize.x / 2 * -1), (parentSize.y / 2 * -1)),
          paint: BasicPalette.transparent.paint(),
        );

  final Vector2 parentSize;

  @override
  FutureOr<void> onLoad() {
    // wall on the right side
    add(
      RectangleComponent(
        size: Vector2(10, size.y),
        position: Vector2(parentSize.x, 0),
        paint: BasicPalette.red.paint(),
        children: [LeftHitbox(Vector2(10, size.y))],
      ),
    );

    // wall on the left side
    add(
      RectangleComponent(
        size: Vector2(1, size.y),
        position: Vector2(-1, 0),
        paint: BasicPalette.transparent.paint(),
        children: [RightHitbox(Vector2(1, size.y))],
      ),
    );

    // wall on the top
    add(
      RectangleComponent(
        size: Vector2(size.x, 1),
        position: Vector2(0, -1),
        paint: BasicPalette.transparent.paint(),
        children: [BottomHitbox(Vector2(size.x, 1))],
      ),
    );

    // wall on the bottom
    add(
      RectangleComponent(
        size: Vector2(size.x, 1),
        position: Vector2(0, parentSize.y - 1),
        paint: BasicPalette.transparent.paint(),
        children: [UpperHitbox(Vector2(size.x, 1))],
      ),
    );
  }
}
