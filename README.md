# Mobile App Internship Project

## Overview

This repository contains a Flutter mobile application that was developed as part of an internship program. The project adheres to the principles of Clean Architecture and follows Test-Driven Development (TDD). The app uses BLoC (Business Logic Component) for state management, ensuring a maintainable and scalable codebase.

## Project Structure

The application is organized into several layers, following the Clean Architecture guidelines:

- **core/**: Contains common utilities, error handling, and base classes.
- **features/**: Contains the specific features of the application, each structured into data, domain, and presentation layers.
  - **data/**: Responsible for data sources, models, and repositories.
  - **domain/**: Contains the business logic, entities, and use cases.
  - **presentation/**: Manages UI components, including BLoC files for state management.

## Technologies Used

- **Flutter**: The framework for building natively compiled applications for mobile from a single codebase.
- **Dart**: The programming language used.
- **BLoC**: For managing state in a reactive way.
- **Mockito**: For creating mock objects in tests.
- **Flutter Test**: For widget and unit testing.

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK
- An IDE (e.g., Android Studio, Visual Studio Code)

### Installation

1. **Clone the repository:**

   ```
   git clone https://github.com/Aschalew524/2024-internship-mobile-tasks.git
   cd 2024-internship-mobile-tasks
2. **Install dependencies:**
   ```
   flutter pub get
3. **flutter run**
   ```
   flutter run


   
