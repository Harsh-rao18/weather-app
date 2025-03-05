import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/service/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _weatherService =
      WeatherService(apiKey: 'c731f05e203e6457168da45ec63bd842');
  WeatherModel? _weather;

  _fetchWeather() async {
    String cityName = await _weatherService.getCurrentCity();

    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  String getWeatherAnimations(String? mainCondition) {
    if (mainCondition == null) return 'assets/sunny.json';

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/cloud.json';

      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/rainy.json';

      case 'thunderstorm':
        return 'assets/thunder.json';

      case 'clear':
        return 'assets/sunny.json';

      default:
        return 'assets/sunny.json';
    }
  }

  Color getBackgroundColor(String? mainCondition) {
    switch (mainCondition?.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'fog':
        return Colors.blueGrey.shade700;

      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return Colors.indigo.shade900;

      case 'thunderstorm':
        return Colors.deepPurple.shade900;

      case 'clear':
        return Colors.blue.shade600;

      default:
        return Colors.blueGrey.shade800;
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(seconds: 1),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              getBackgroundColor(_weather?.mainCondition),
              Colors.black87,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: _weather == null
              ? const CircularProgressIndicator(color: Colors.white)
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // City Name
                    Text(
                      _weather!.cityName,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Weather Animation
                    Lottie.asset(getWeatherAnimations(_weather!.mainCondition),
                        width: 200, height: 200, fit: BoxFit.cover),

                    // Temperature
                    Text(
                      '${_weather!.temperature.round()}°C',
                      style: const TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Condition
                    Text(
                      _weather!.mainCondition,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
