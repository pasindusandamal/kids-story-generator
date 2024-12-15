// lib/services/ollama_service.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

class OllamaService {
  static const String baseUrl = 'http://localhost:11434';

  Future<String> generateStory(String prompt) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/generate'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'model': 'deepseek-coder-v2:16b',
          'prompt': '''Create a short kids story about $prompt. 
                      Make it educational and fun, suitable for children.
                      Keep it under 200 words.''',
          'stream': false,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return responseData['response'];
      } else {
        throw Exception('Failed to generate story');
      }
    } catch (e) {
      throw Exception('Error connecting to Ollama: $e');
    }
  }
}
