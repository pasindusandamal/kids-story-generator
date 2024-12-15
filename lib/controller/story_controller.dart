import 'dart:math';
import 'package:flutter/material.dart';
import 'package:kids_story_generator/model/story_model.dart';
import 'package:kids_story_generator/services/ollama_service.dart';

class StoryController extends ChangeNotifier {
  final StoryModel _model = StoryModel();
  final OllamaService _service = OllamaService();
  final TextEditingController promptController = TextEditingController();
  bool _isGenerating = false;

  String get story => _model.story;
  String get error => _model.error;
  bool get isGenerating => _isGenerating;
  bool get hasError => _model.hasError;

  Future<void> generateStory() async {
    if (promptController.text.isEmpty) {
      _model.setError(e.toString());
      return;
    }

    try {
      _isGenerating = true;
      notifyListeners();
      final generatedStory =
          await _service.generateStory(promptController.text);
      _model.setStory(promptController.text, generatedStory);
    } catch (e) {
      _model.setError(e.toString());
    } finally {
      _isGenerating = false;
      notifyListeners();
    }
  }
}
