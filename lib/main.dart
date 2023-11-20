import 'package:brick_practice/game/brick_game.dart';
import 'package:brick_practice/overlay/controller.dart';
import 'package:brick_practice/overlay/start_button.dart';
import 'package:brick_practice/state/controller_state.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late final BrickGame _game;
  final _controllerStateNotifier = ControllerStateNotifier();

  @override
  void initState() {
    super.initState();
    _game = BrickGame(_controllerStateNotifier);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GameWidget(
          // game: _game,
          game: BrickGame(_controllerStateNotifier),
          overlayBuilderMap: {
            StartButton.label: (context, game) => StartButton(
                  onTap: () {},
                ),
            Controller.label: (context, game) => Positioned(
                  right: 32,
                  bottom: 32,
                  child: Controller(
                    onLeft: () =>
                        _controllerStateNotifier.value = ControllerState.left,
                    onRight: () =>
                        _controllerStateNotifier.value = ControllerState.right,
                    onNutral: () => _controllerStateNotifier.value =
                        ControllerState.neutral,
                  ),
                ),
          },
        ),
      ),
    );
  }
}
