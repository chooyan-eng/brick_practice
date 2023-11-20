import 'package:flutter/material.dart';

enum ControllerState {
  left,
  right,
  neutral,
}

class ControllerStateNotifier extends ValueNotifier<ControllerState> {
  ControllerStateNotifier() : super(ControllerState.neutral);
}
