import 'package:flutter/material.dart';
import 'package:kids_story_generator/controller/story_controller.dart';
import 'package:provider/provider.dart';

import 'widgets/input_prompt.dart';
import 'widgets/story_display.dart';

class StoryGenerator extends StatefulWidget {
  const StoryGenerator({super.key});

  @override
  State<StoryGenerator> createState() => _StoryGeneratorState();
}

class _StoryGeneratorState extends State<StoryGenerator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Story Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const InputPrompt(),

            const SizedBox(height: 16),
            Consumer<StoryController>(builder: (context, controller, child) {
              return ElevatedButton(
                onPressed:
                    controller.isGenerating ? null : controller.generateStory,
                child: const Text('Generate Story'),
              );
            }),

            Expanded(child: Consumer<StoryController>(
                builder: (context, controller, child) {
              if (controller.isGenerating) {
                return const Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 16),
                      Text('Generating story...'),
                    ],
                  ),
                );
              }

              const SizedBox(height: 16);
              
              if (controller.hasError) {
                return Center(
                  child: Text(
                    controller.error,
                    style: const TextStyle(color: Colors.amber),
                  ),
                );
              }

              if (controller.story.isEmpty) {
                return const Center(
                  child: Text('No story generated yet'),
                );
              }
              return SingleChildScrollView(
                  child: StoryDisplay(controller: controller));
            })),
          ],
        ),
      ),
    );
  }
}
