import 'package:flutter/material.dart';

extension ContextEx on BuildContext {
  void pushNamed(String routeName, {Object? arguments}) {
    Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  void pushNamedAndRemoveAll(String routeName) {
    Navigator.pushNamedAndRemoveUntil(
      this,
      routeName,
      (route) => false,
    );
  }

  void pushReplacmentNamed(String routeName) {
    Navigator.pushReplacementNamed(this, routeName);
  }

  void pop() {
    Navigator.pop(this);
  }

  ColorScheme get colorScheme {
    return Theme.of(this).colorScheme;
  }
}

extension PaddingEx on Widget {
  Widget paddingSymmetric({double horizontal = 0, double vertical = 0}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal,
        vertical: vertical,
      ),
      child: this,
    );
  }

  Widget paddingOnly({
    double left = 0,
    double right = 0,
    double top = 0,
    double bottom = 0,
  }) {
    return Padding(
      padding:
          EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
      child: this,
    );
  }

  Widget paddingAll(
    double value,
  ) {
    return Padding(
      padding: EdgeInsets.all(value),
      child: this,
    );
  }
}
