import 'package:flutter/material.dart';
import 'package:kids_story_generator/controller/story_controller.dart';
import 'package:kids_story_generator/view/story_generator.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) =>StoryController(),
    child: MaterialApp(
      title: 'Story Generator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),home: const StoryGenerator(),
    ),);
  }
}
