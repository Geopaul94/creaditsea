

# CreditSea

A new Flutter project for managing credit transactions.

## Getting Started

This project utilizes **Firebase** for data storage and user authentication. However, due to Firebase's limitations in providing free OTP verification for phone numbers and emails, I implemented a static OTP of `123456` for testing purposes during the account creation process. The same approach is used for email verification due to the base plan restrictions of Firebase.

Key Features:
- **Phone Number Authentication**: Custom OTP system using `123456`.
- **Email Verification**: Similarly implemented with the same OTP (`123456`).
- **State Management**: The project uses **GetX** for efficient state management.
- **MVVM Architecture**: The code follows the MVVM (Model-View-ViewModel) architectural pattern for better code structure and maintainability.

## APK & Demo

- [Download APK](https://drive.google.com/file/d/1LSw-py1JLAZf36HQqeTRj_efdpUkqSAp/view?usp=sharing)
- [Video Demonstration](https://drive.google.com/file/d/1LSw-py1JLAZf36HQqeTRj_efdpUkqSAp/view?usp=sharing)

