# Flutter Clean Architecture TDD

This is a very simple project at 2024 A2sv summer internship onboarding  focusing on  Clean Architecture principles and uses Test-Driven Development (TDD) practices.

## Table of Contents

- [Introduction](#introduction)
 
- [Architecture](#architecture)
 
- [Getting Started](#getting-started)
 
- [Prerequisites](#prerequisites)

- [Installation](#installation)

- [Running the App](#running-the-app)
 
- [Project Structure](#project-structure)
 
- [Technologies Used](#technologies-used)
 


## Introduction

This project is a showcase of how to implement the Clean Architecture and TDD practices in a Flutter application. The goal is to create a maintainable and scalable codebase that is easy to test and extend.

## Architecture

The project follows the Clean Architecture principles, which consist of the following layers:

1. **Presentation Layer**: This layer is responsible for the UI and user interactions. It includes the Widgets, Pages, and Bloc/Cubit classes.
2. **Domain Layer**: This layer contains the business logic and core entities of the application. It includes the use cases, entities, and repositories.
3. **Data Layer**: This layer is responsible for data access and handling. It includes the data sources, repositories, and models.

Each layer is independent and can be tested in isolation, following the Dependency Inversion Principle.

## Getting Started

### Prerequisites

- Flutter SDK (version 2.8.0 or higher)
- Dart SDK (version 2.16.0 or higher)
- Code Editor

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/Aschalew524/-2024-internship-mobile-tasks.git '''
2, Change to the project directory:


 cd -2024-internship-mobile-tasks

3,Install the dependencies:

flutter pub get
Running the App
Connect a device or start an emulator.

4,Run the app:

flutter run

** PROJECT STRUCTURE **

The project structure follows the Clean Architecture principles:

**  
lib/
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
└── presentation/
    ├── pages/
    ├── widgets/
    └── blocs/
test/
├── data/
├── domain/
└── presentation/             **

*** TECHNOLOGIES USED*** 

Flutter
Dart
Mockito (for testing)
Bloc (state management)










 
#############################################                                                           Aschalew Abayneh                                                                    ##################################################3
