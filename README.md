# smart_pay_app


### Application structure


```
.
├── android                         - It contains files required to run the application on an Android platform.
├── assets                          - It contains all images and fonts of your application.
├── ios                             - It contains files required to run the application on an iOS platform.
├── lib                             - Most important folder in the application, used to write most of the Dart code..
    ├── core
   
        ├── errors                  - It contains all the custom error class of the application
        ├── localization            - It contains all the string locals of the application for easy translation
        ├── routes                  - It contains all the routes of the application
        ├── theme                   - It contains app theme and decoration classes
        ├── utils                   - It contains common files and utilities of the application
        ├── widgets                 - It contains all custom widget classes
        ├── app_export.dart         - It contains commonly used file imports

    ├── data                        - It contains data file used in the application 
        ├── models                  
        ├── remote_data             
    ├── domaim                      
        ├── repository                  
        ├── usecase 
    ├── presentation                - It contains widgets of the screens 
        ├── confirmation_screen                  
        ├── create_pin_screen 
        ├── dashboard_screen 
        ├── onboarding_screen
        ├── otp_authentication_screen
        ├── sign_in_screen
        ├── sign_up_screen
        ├── splash_screen
        └── verify_screen

    └── main.dart                   - Starting point of the application
```
### Application structure
    The application structure follows the principles of Clean Architecture, 
    which is an architectural pattern that emphasizes separation of concerns and maintainability of code.
    This structure organizes the codebase into distinct layers, each responsible for a specific aspect of the application. 

- Let's break down the key components of this architecture:
    
### Core: This directory houses essential components that are fundamental to the application's functionality. It includes:
      * Errors: Contains custom error classes for handling specific error scenarios within the application.
        Localization: Contains localized strings used throughout the application, facilitating easy translation.
        Routes: Manages all the routes of the application, defining navigation paths between different screens.
        Theme: Defines the application's theme and decoration classes, ensuring consistent visual styling.
        Utils: Contains common utility functions and files used across the application.
        Widgets: Houses custom widget classes that can be reused across multiple screens.
        Network: Stores static constants related to network configuration.

### Data: This directory deals with data management within the application. It includes:
        Models: Defines data models representing entities used in the application.
        Remote Data: Contains classes responsible for handling remote data sources, such as APIs.

### Domain: This layer encapsulates business logic and use cases of the application. It consists of:
        Repository: Defines interfaces for data repositories, abstracting away the data source implementation details.
        Usecase: Implements use case classes that orchestrate business logic operations, interacting with repositories to fetch and manipulate data.

### Presentation: This directory contains the UI layer of the application, comprising various screens and widgets. It includes:
        Individual directories for different screens, such as confirmation, authentication, onboarding, etc.
        Each screen directory contains widget classes responsible for rendering UI components and handling user interactions.
### Main.dart: This is the entry point of the application, where the application is initialized and the initial screen is loaded.


### Libraries and tools used

- BLoC - State management
  https://bloclibrary.dev
- cached_network_image - For storing internet image into cache
  https://pub.dev/packages/cached_network_image

### Support

If you have any problems or questions, send me a DM on [obettabenjamin44@gmail.com]()

