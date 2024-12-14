// lib/screens/simple_story_screen.dart
import 'package:flutter/material.dart';

import 'ollama_service.dart';

class SimpleStoryScreen extends StatefulWidget {
  const SimpleStoryScreen({super.key});

  @override
  State<SimpleStoryScreen> createState() => _SimpleStoryScreenState();
}

class _SimpleStoryScreenState extends State<SimpleStoryScreen> {
  final TextEditingController _promptController = TextEditingController();
  final OllamaService _ollamaService = OllamaService();
  String _story = '';
  bool _isLoading = false;

  Future<void> _generateStory() async {
    if (_promptController.text.isEmpty) return;

    setState(() => _isLoading = true);

    try {
      final story = await _ollamaService.generateStory(_promptController.text);
      setState(() => _story = story);
    } catch (e) {
      setState(() => _story = 'Error: ${e.toString()}');
    }

    setState(() => _isLoading = false);
  }

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
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _promptController,
                    decoration: const InputDecoration(
                      hintText: 'Enter story topic...',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: _isLoading ? null : _generateStory,
                  icon: _isLoading 
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.send),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    _story.isEmpty ? 'Your story will appear here...' : _story,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}