// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:weather_app/data/data_provider/weather_data_provider.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherRepository {
  //cerate a constructor
  final WeatherDataProvider weatherDataProvider;
  WeatherRepository(
    this.weatherDataProvider,
  );

  Future<WeatherModel> getCurrentWeather() async {
    try {
      String cityName = 'London';

      final weatherData =
          await WeatherDataProvider().getCurrentWeather(cityName);

      //convert a JSON-formatted string into a Dart object
      final data = jsonDecode(weatherData);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }
      //we can use both the map row data or json raw data to convert
      //return WeatherModel.fromJson(weatherData);
      return WeatherModel.fromMap(data);
      
    } catch (e) {
      throw e.toString();
    }
  }
}
