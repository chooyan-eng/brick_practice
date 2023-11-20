import 'package:brick_practice/state/controller_state.dart';
import 'package:flame/components.dart';

mixin ControllerNotifiable {
  ControllerStateNotifier get notifier;

  static ControllerStateNotifier find(Component component) {
    final game = component.findGame();
    assert(
      game is ControllerNotifiable,
      'Ancestor Game DOESN\'T mixin ControllerNotifiable',
    );

    return (game as ControllerNotifiable).notifier;
  }
}
