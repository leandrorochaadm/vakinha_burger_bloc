import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

  static ColorsApp get i {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color(0xFFee633a);

  Color get secondary => const Color(0xFFF88B0C);
}

extension ColorsAppExcetions on BuildContext {
  ColorsApp get colors => ColorsApp.i;
}
