import 'dart:async';

import 'package:brick_practice/game/ball.dart';
import 'package:brick_practice/game/breaking_block.dart';
import 'package:brick_practice/game/player.dart';
import 'package:brick_practice/game/wall.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';

class BrickWorld extends World {
  static final size = Vector2(400, 640);

  @override
  FutureOr<void> onLoad() {
    add(Player());
    add(Ball());
    add(Wall(parentSize: size));

    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        add(
          BreakingBlock(
            position: Vector2((size.x / 2 * -1) + 34 + i * 42,
                (size.y / 2 * -1) + 34 + j * 22),
            paint: BasicPalette.darkGreen.paint(),
          ),
        );
      }
    }
  }
}
