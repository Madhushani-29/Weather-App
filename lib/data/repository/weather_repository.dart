// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:weather_app/data/data_provider/weather_data_provider.dart';

class WeatherRepository {
  final WeatherDataProvider weatherDataProvider;
  WeatherRepository(
    this.weatherDataProvider,
  );

  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      String cityName = 'London';

      final weatherData =
          await WeatherDataProvider().getCurrentWeather(cityName);

      final data = jsonDecode(weatherData);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }

      return data;
    } catch (e) {
      throw e.toString();
    }
  }
}
