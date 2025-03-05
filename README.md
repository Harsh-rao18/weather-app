# 🌤 Weather App

A simple Flutter weather app that fetches real-time weather data using an API and displays animations with **Lottie**.

## 🚀 Features  
- 🌎 Fetches current weather data for the user's location  
- 🌦 Displays weather conditions with **Lottie animations**  
- 🎨 Beautiful gradient background based on weather conditions  
- ⚡ Uses **HTTP package** to fetch data from the API  

## 📦 Dependencies  
Make sure you have the following dependencies in your `pubspec.yaml`:  
```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^0.13.6
  lottie: ^2.6.0

🔧 Setup & Usage 

# Clone the repository  
git clone https://github.com/Harsh-rao18/weather_app.git  
cd weather_app  

# Install dependencies  
flutter pub get  

# Run the app  
flutter run  

🛠 API Integration
// Get your API key from OpenWeatherMap and add it inside WeatherService
final _weatherService = WeatherService(apiKey: 'YOUR_API_KEY');

👨‍💻 About the Developer
Made with ❤️ by Harsh

