# Flutter Weather Application

A simple Flutter application to display current weather information using the OpenWeatherMap API.

## Features

- Fetches current weather data based on city name input.
- Displays weather details such as temperature, humidity, and description.
- Allows viewing and clearing weather history.

## Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/arishahmad661/weather_app.git

3. Navigate into the project directory:
   ```sh
   cd weather_app
   
4. Install dependencies:
   ```sh
   flutter pub get

## Usage

1. Obtain an API key from [OpenWeatherMap](https://openweathermap.org/) and replace `'API_KEY'` in `lib/services/weather_api_client.dart` with your API key.

2. Run the application:
   ```sh
   flutter run
   
4. Enter a city name and press search to view current weather information.

5. View and clear weather history from the history screen.

## Dependencies

- [http](https://pub.dev/packages/http) : For making HTTP requests to the OpenWeatherMap API.
- [shared_preferences](https://pub.dev/packages/shared_preferences) : For storing and retrieving weather history locally.

## Structure

- weather_app
   - lib
     - models
        - histoty_madel.dart
        - weather_data_model.dart
     - screens
        - history
           - history.dart
        - weather_report
           - widgets
              - details_widget.dart
              - error_message.dart
              - weather_description.dart
              - weather_report_widget.dart
           - weather_report_page.dart
     - services
        - history_client.dart
        - weather_api_client.dart
     - main.dart
