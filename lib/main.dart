import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:p13/screens/home.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MaterialApp(
        home: Home(),
      ),
    ),
  );
}
