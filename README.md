# Code Challenge: Flutter Developer

## Objective
Create a Flutter app that displays a list of doctors, fetched from a mock API, with a detail screen for each doctor.

## Challenge Guidelines
- **Fork the Repository**: Fork the repository on GitHub.
- **Complete the Challenge**: Implement the required features and ensure cross-platform compatibility.
- **Timebox**: Limit your time to **4 hours**.
- **Commit Regularly**: Use clear, concise commit messages.
- **Submit**: Ensure the repository is public or grant access if private and submit your solution.
- Ensure the app works on **Android**, **iOS**, and **Web**.

## Requirements

### 1. Design
- The UI should be clean, responsive, and simple.
- Use [Material Theme Builder](https://material-foundation.github.io/material-theme-builder) to create a custom theme.
- Use Flutter’s Material Design components.

### 2. Code Structure
- Use a modular and scalable structure.
- Separate concerns (e.g., models, services, screens).
- Follow best practices for state management (e.g., `FutureBuilder`, `setState`).

### 3. Mock API Call
- Simulate an API call to fetch doctors using a JSON file in the `data` folder.
- Data for each doctor:
  - `id`, `avatar`, `first_name`, `last_name`
  - Doctor settings:
    - `practice`, `about (in all languages)`, `education`, `accepting_new_patients`, `countries`, `supported_languages`, `years_experience`

### 4. Overview Screen
- Display a list of doctors with:
  - Avatar, first name, last name, and practice.
- Implement smooth scrolling for the list.

### 5. Doctor Detail Screen
- When a doctor is clicked, navigate to a detail screen with the doctor’s full information.

### 6. Cross-Platform Support
- Ensure the app works on **Android**, **iOS**, and **Web** platforms.
- Test the app across all platforms for compatibility.

### 7. Bonus (Optional)
- Implement extra features like filtering or sorting.
- Add unit tests for the doctor model.
