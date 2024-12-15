# 🎨 Kids Story Generator

> 📚 An educational Flutter application that generates child-friendly stories using Ollama AI. The app creates unique, engaging stories based on user prompts while keeping the content appropriate and educational for children.

## ✨ Features

| Feature | Description |
|---------|-------------|
| 🤖 AI Stories | Generate unique stories using Ollama AI |
| 👶 Kid-Friendly | Safe and educational content for children |
| 🎯 Simple UI | Intuitive and easy-to-use interface |
| 🛡️ Error Handling | Robust error management and loading states |


## 🚀 Prerequisites

Before you begin, ensure you have the following installed:
* 📱 Flutter SDK
* 🤖 Ollama AI (running locally)
* 📦 Required packages:
  * `http` for API calls
  * `provider` for state management

## 💻 Installation

1. **Clone the repository:**
```bash
git clone [your-repository-url]
```

2. **Install dependencies:**
```bash
flutter pub get
```

3. **Verify Ollama is running locally** on port 11434

4. **Launch the application:**
```bash
flutter run
```

## 📁 Project Structure

```
lib/
├── 🎮 controller/
│   └── story_controller.dart
├── 📊 model/
│   └── story_model.dart
├── 🛠️ services/
│   └── ollama_service.dart
├── 🎨 view/
│   ├── widgets/
│   │   ├── input_prompt.dart
│   │   └── story_display.dart
│   └── story_generator.dart
└── 🚀 main.dart
```

## 🔄 How It Works

1. 📝 User enters a story prompt
2. 🤖 App connects to local Ollama AI
3. ✨ AI generates kid-friendly story
4. 📱 Story displays in scrollable container

## 🛠️ Technical Details

### Architecture
* 🏗️ MVC pattern implementation
* 📊 Provider state management
* 🤖 Ollama AI integration
* ⚡ Async operations handling

### Key Components

```dart
// Story Controller
class StoryController extends ChangeNotifier {
  final TextEditingController promptController = TextEditingController();
  final OllamaService _ollamaService = OllamaService();
  // ...
}

// API Service
class OllamaService {
  Future<String> generateStory(String prompt) async {
    // AI integration logic
  }
}
```

## 🤝 Contributing

We welcome contributions! Here's how you can help:

## 📝 License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

## 🙏 Acknowledgments

* 💙 Flutter Team
* 🤖 Ollama AI
* 📦 Provider Package

---

