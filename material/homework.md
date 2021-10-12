
# Homework

The homework is a mandatory requirement to pass the course. 60% of the course grade comes from the result of the homework.

## Application requirements

- The application must be written in Dart, using Flutter, and must support at least two different platforms with the same codebase:
  - Android
  - iOS
  - Web (responsive UI is a plus, but not mandatory)
  - Windows/macOS/Linux (only in beta stage, choose at your own risk)
- The application must use a state management library (such as `provider` or `flutter_bloc`)
- Supporting at least 2 languages is a plus, but not mandatory
- Here are some strongly advised examples for app complexity:
    - Communicate with a public API
       - [A list of public APIs]([https://github.com/public-apis/public-apis](https://github.com/public-apis/public-apis))
       - One list page and one details page
       - Sorting based on some property OR searching based on some property
     - Simple game with basic Firebase integration
       - Based on widgets or the [`flame`](https://pub.dev/packages/flame) library
       - Firebase usage examples in a game (minimum of 1 integration is required):
         - User authentication, storing player scores, storing level data, storing images, etc.
     - Your own idea
       - Must be approved by one of the lecturers beforehand!

> ⚠️WARNING⚠️: We don't recommend copying and pasting a whole project (e.g. from a tutorial) and handing it in as homework. You can use tutorials and follow approaches presented in them of course, just try to come up with your own code as well. You can safely use examples from this course, provided that you come up with your own solutions too.

## Format of the homework submission & deadlines

 - A specification of the application must be submitted in **.pdf** format by the end of the **8th week (2021.10.31. 23:59)** on Moodle.
 - The specification must
   - be no longer than 1 page
   - contain the list of all the features what you're planning to implement in the app
 - The uploaded specification will be checked by the lecturers and may require clarification afterwards.
 - The homework must be submitted in the following format:
   - An archive file (zip, rar, 7zip, etc.) containig
     -  the project (run `flutter clean` beforehand), and
     -  and a short video demonstrating the completed application and the code.
       - The video must be around 5 minutes long, but should not exceeed 10 minutes.
       - The video must contain a demonstration of the working features of the app and a short walkthrough on the codebase.
         - A video demonstrating only the working app and no walkthrough or commentaire is not acceptable. 
       - The video can also be provided as a link in a text file or in a comment on Moodle in the assingment.
 - The completed project must be submitted by the end of the term, **2021.12.12. 23:59** - not including the "póthét".
 - The homework can be submitted up to one week later - **until the end of "póthét", 2021.12.19. 23:59** - for a compulsory fee.

## Useful tools and links for recording the video

- [OBS](https://obsproject.com/) + emulator/simulator/browser window/desktop window
- On Android:
  - [scrcpy](https://github.com/Genymobile/scrcpy)
  - [Vysor](https://www.vysor.io/)
  - Built-in screen recording on a physical Android device
