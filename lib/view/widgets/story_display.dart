import 'package:flutter/material.dart';

import '../../controller/story_controller.dart';

class StoryDisplay extends StatelessWidget {
  const StoryDisplay({
    super.key,
    required this.controller,
  });

  final StoryController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
    border: Border.all(color: Colors.blue),
    borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(controller.story),
                  );
  }
}
