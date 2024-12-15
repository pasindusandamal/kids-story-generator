import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/story_controller.dart';

class InputPrompt extends StatelessWidget {
  const InputPrompt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<StoryController>(builder: (context, controller, child) {
      return TextField(
        controller: controller.promptController,
        decoration: InputDecoration(
          hintText: 'Enter a prompt',
          border: const OutlineInputBorder(),
          errorText: controller.hasError ? controller.error : null,
        ),
      );
    });
  }
}
