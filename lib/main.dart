import 'package:flutter/material.dart';
import 'package:kids_story_generator/view/story_generator.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SimpleStoryScreen(),
    );
  }
}
