class StoryModel {
  String _prompt = '';
  String _story = '';
  String _error = '';

  String get prompt => _prompt;
  String get story => _story;
  String get error => _error;

  void setStory(String prompt, String story) {
    _prompt = prompt;
    _story = story;
    _error = '';
  }

  void setError(String errorMessage) {
    _error = errorMessage;
    _story = '';
  }

  bool get hasError => _error.isNotEmpty;
}
