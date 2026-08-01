# BMI Calculator & Health Tracker

A beautifully designed, multi-screen Body Mass Index (BMI) calculator built with Flutter. Beyond standard calculations, this application features a fully integrated **SQLite backend** to provide persistent local storage, allowing users to track their health metrics over time.

## Features

* **Interactive User Interface:** Custom-built sliders, gesture detectors, and increment buttons for seamless data entry.
* **Instant Calculations:** Computes BMI based on height, weight, age, and gender, providing an accurate health categorization (e.g., Normal, Overweight, Underweight) and personalized interpretations.
* **Persistent Local Storage:** Utilizes the `sqflite` package to save every calculation to a local device database.
* **Historical Tracking:** Features a dedicated History Page that queries the database and displays past records in reverse chronological order (newest first) using an optimized SQL `ORDER BY` clause.

## Tech Stack

* **Framework:** Flutter / Dart
* **Database:** SQLite (`sqflite` package)
* **Path Management:** `path` package (for cross-platform database directory resolution)
* **Icons:** `font_awesome_flutter`

## Architecture & Backend Design

This project demonstrates strict separation of concerns and standard backend data flow principles:

1. **Data Transfer Object (DTO) / Model (`bmi_model.dart`):** 
   A strictly typed Dart class (`BmiRecord`) that defines the database schema. It utilizes `toMap()` and `fromMap()` factory constructors to serialize and deserialize data between the Dart logic layer and the SQLite relational database.
2. **Singleton Database Manager (`database_helper.dart`):** 
   A dedicated class managing the database lifecycle. It ensures only one active connection exists (Singleton pattern) and handles raw SQL execution for table creation and CRUD operations.
3. **Asynchronous UI Integration:** 
   The application leverages `async`/`await` threading to ensure database I/O operations do not block the main UI rendering thread, resulting in a smooth user experience during data insertion and retrieval.

## Purpose
The main objective of creating this app was to learn Flutter with a focus on learning backend. You can find different comments in the app where I was trying to explain different concepts to myself 🥸. Have a look at my basic app. I'm going to add three more screens to the app soon, including BMI Categories, Health Tips, and Units, where users can change the units. Also, I am thinking of adding light mode and dark mode to the app. So, for future updates, stay tuned.

## Getting Started

### Prerequisites
* Flutter SDK (Latest stable version)
* An IDE (Visual Studio Code, Android Studio, or Xcode)
* A physical device or emulator (iOS/Android)

### Installation

1. Clone the repository:
   ```bash
   git clone [https://github.com/your-username/bmi-calculator.git](https://github.com/your-username/bmi-calculator.git)
