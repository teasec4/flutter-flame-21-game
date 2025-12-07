# Gambling Game

![Flutter](https://img.shields.io/badge/Flutter-3.0%2B-blue?logo=flutter)
![Flame](https://img.shields.io/badge/Flame-1.34.0-orange?logo=flame)
![Dart](https://img.shields.io/badge/Dart-3.10%2B-0175C2?logo=dart)
![License](https://img.shields.io/badge/License-MIT-green)

A card gambling game built with Flutter and Flame game engine.

## Features

- 🎴 Card-based gameplay with sprite sheets
- 🎯 Interactive UI with buttons
- 🎨 Smooth animations for card movement
- 📱 Mobile-optimized vertical layout
- 🎭 Multiple card suits (Clubs, Hearts, Spades, Diamonds)

## Getting Started

### Prerequisites

- Flutter 3.0 or higher
- Dart 3.10 or higher

### Installation

```bash
# Clone repository
git clone <your-repo>
cd gambling_game

# Get dependencies
flutter pub get

# Run the app
flutter run
```

## Project Structure

```
lib/
├── main.dart
├── game/
│   ├── gambling_game.dart
│   ├── logic/
│   │   ├── bet_manager.dart
│   │   └── blackjack_rules.dart
│   └── components/
│       ├── card_component.dart
│       ├── card_sheet.dart
│       ├── hand_container.dart
│       ├── background_component.dart
│       ├── balance_component.dart
│       └── btn_get_card.dart
```

## Assets

Card sprites are organized in sprite sheets (440x372):
- `Clubs-88x124.png` - Club suit cards
- `Hearts-88x124.png` - Heart suit cards
- `Spades-88x124.png` - Spade suit cards
- `Diamonds-88x124.png` - Diamond suit cards

## License

This project is licensed under the MIT License.
