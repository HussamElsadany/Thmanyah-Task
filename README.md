
# Thmanyah-Task

[![Swift Version](https://img.shields.io/badge/Swift-5.9-brightgreen.svg)](https://swift.org) [![Xcode Version](https://img.shields.io/badge/Xcode-15-brightgreen.svg)](https://developer.apple.com/xcode/) [![License](https://img.shields.io/badge/License-MIT-brightgreen.svg)](LICENSE)

## Overview

Thmanyah-Task is a mobile application designed to seamlessly connect users with a vast collection of albums and photos. With a simple and intuitive interface, Thmanyah-Task offers a unique browsing experience across three distinct screens, making it easier than ever to explore and enjoy a wide range of imagery.

## Features
- **Users & Albums Screen**: Fetch and display a list of users along with their albums. Users can browse through the albums associated with each user to find their interests.
- **Album Photos Screen**: Upon selecting an album, users are taken to a screen showcasing all photos within the selected album, allowing for a deeper dive into the visual content.
- **Photo Viewer Screen**: Selecting a photo opens it in full view, providing a detailed and focused look at the image.

## Architecture 
The MovieApp follows a clean and modular architecture to promote maintainability, scalability, and testability. The key components of the architecture include: 
-  **MVVM (Model-View-ViewModel):** The app adopts the MVVM design pattern, separating concerns between the UI (View), business logic (ViewModel), and data (Model). This promotes a clear separation of concerns and enables better unit testing. 
-  **Repository Pattern:** Data access is abstracted through repositories, providing a clean API to fetch and store movie-related data. This pattern enhances code maintainability and facilitates the switch between different data sources. 
-  **Dependency Injection:** Dependencies are injected into components, promoting a loosely coupled architecture. This enhances testability and allows for easy replacement of components.

## Dependencies 
The Thmanyah-Task App is written entirely in Swift and doesn't rely on any third-party libraries or frameworks. The use of native code ensures optimal performance, easier maintenance, and a reduced app footprint.

## Requirements

- iOS 17.0+
- Swift 5.9+
- Xcode 15.0+

## Installation

To run the Movie App locally, follow these steps:

```bash
# Clone the repository
git clone https://github.com/HussamElsadany/Thmanyah-Task.git

# Navigate to the project directory
cd Thmanyah-Task

# Open the project in Xcode
open Thmanyah-Task.xcworkspace
