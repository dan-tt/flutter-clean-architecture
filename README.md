# flutter_application_1

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Project structure
''bash
lib
 │── domain                 # Domain layer (entities, navigation, tracking, manager, use-cases, repository interface)
 ├── data                   # Data layer (repositories, models, cache, database, mock, remote)
 ├── common                 # Common layer (reuse core utilities, constants, error handling, ui)
 ├── features               # Features layer
 │    └── auth              # Feature: Authentication
 │         └── widgets      # UI
 │         └── state        # State management
 └── main.dart              # Entry point
test                        # Unit tests
''