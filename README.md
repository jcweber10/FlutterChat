# Chat App

## Purpose
This is a chat application built with Flutter. It allows users to sign up, log in, and participate in real-time conversations. The backend is powered by Supabase, providing authentication, database, and real-time messaging capabilities.

## High-Level Architecture

- **Flutter**: The main framework for building cross-platform mobile apps.
- **Riverpod**: Used for state management, leveraging `@riverpod` annotations and provider generation for scalable, testable state.
- **Supabase**: Handles authentication, database storage, and real-time features.
- **Feature-First Directory Structure**: Each feature (e.g., authentication, conversations, messages) is organized into its own directory, with clear separation between presentation, domain, and data layers.

### Directory Structure

- `lib/features/<feature>/`
  - `presentation/`: UI components, screens, and widgets for the feature
  - `domain/`: Business logic, models, and core abstractions
  - `data/`: Data sources, repositories, and API integrations
- `lib/main.dart`: App entry point, routing, and global configuration

### Key Technologies
- **State Management**: Riverpod (`@riverpod`, `AsyncNotifierProvider`, `NotifierProvider`)
- **Backend**: Supabase (auth, database, real-time)


## Usage
If you would like to test this out, create an issue and I'll give you the supabase credentials