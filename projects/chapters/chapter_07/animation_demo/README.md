# Flutter Animation Demo App

## Overview

This project is a demo application built using Flutter and is designed to showcase various animation techniques and libraries. It serves as an educational resource for developers who want to explore Flutter's animation APIs, as well as popular libraries like Lottie and Rive. Each page within the app demonstrates a specific animation technique, providing a clear and interactive example.

This project was (re)built using **Flutter version 3.24.3** through **FVM (Flutter Version Management)** for easy version control and management. It also utilizes **flutter_screenutil** for responsive design across various screen sizes and **flutter_gen** for safe and convenient asset generation.

---


## Demo Pages

### 1. **AnimatedSize Demo Page**
   - **Purpose**: Demonstrates the use of `AnimatedSize` to smoothly animate size changes of widgets when they resize. It automatically transitions between the old and new size when a size change occurs.
   - **Example**: A container that expands and contracts on button press, with smooth size transitions.

### 2. **AnimatedContainer Demo Page**
   - **Purpose**: Showcases the `AnimatedContainer` widget, which animates changes in its properties such as width, height, color, and padding.
   - **Example**: A container whose dimensions and colors change on user interaction, with smooth animations between states.

### 3. **AnimatedBuilder Demo Page**
   - **Purpose**: Displays the usage of `AnimatedBuilder` to animate widgets by listening to an `AnimationController`. `AnimatedBuilder` helps create animations in a more reusable and efficient manner.
   - **Example**: A rotating square that is animated using a custom controller, with the ability to modify the animation curve.

### 4. **Staggering Animation Demo Page**
   - **Purpose**: Demonstrates a more complex, staggered animation sequence where multiple animations start at different times and durations using Flutter's `Tween` and `AnimationController`.
   - **Example**: Animations such as fading, sliding, and resizing of several widgets happening in a staggered fashion.

### 5. **Animated SVG Demo Page**
   - **Purpose**: Illustrates how to animate SVG graphics using Flutter's `flutter_svg` package, enabling smooth vector graphic animations.
   - **Example**: An SVG icon that animates its path drawing, scaling, or color transitions over time.

### 6. **Drawing Animation Demo Page**
   - **Purpose**: Showcases drawing animations, where lines or shapes are drawn progressively on the screen, creating dynamic and engaging visuals.
   - **Example**: A path being drawn in real-time, simulating a hand-drawing effect.

### 7. **Lottie Demo Page**
   - **Purpose**: Integrates the popular **Lottie** animation format, which allows the rendering of JSON-based vector animations created in tools like After Effects and exported using the Bodymovin plugin.
   - **Example**: A Lottie animation that plays on a loop, showcasing an animated character or illustration with interactive controls for playback.

### 8. **Rive Demo Page**
   - **Purpose**: Demonstrates the use of **Rive** to run complex animations created in the Rive app. Rive animations can be dynamic and interactive, supporting state machines and real-time user input.
   - **Example**: A Rive animation that responds to user input, such as pressing buttons or sliding controls to change animation states.

---

## How to Run the App

- **Run using FVM**:  
   Ensure you have **FVM** installed. If not, install it by running the following command:
   ```bash
   dart pub global activate fvm
   ```
   Then:
   ```bash
   fvm flutter run
   ```
- **Or just simply run**:  
   ```bash
   flutter run
   ```
