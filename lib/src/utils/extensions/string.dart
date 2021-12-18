import 'dart:core';

extension XString on String {
  String capitalize() => '${this[0].toUpperCase()}${substring(1)}';
}
