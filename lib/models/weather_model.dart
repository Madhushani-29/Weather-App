import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class WeatherModel {
  final String currentSky;
  final double currentPressure;
  final double currentWindSpeed;
  final double currentHumidity;
  final double currentTemp;

  WeatherModel({
    required this.currentSky,
    required this.currentPressure,
    required this.currentWindSpeed,
    required this.currentHumidity,
    required this.currentTemp,
  });

  WeatherModel copyWith({
    String? currentSky,
    double? currentPressure,
    double? currentWindSpeed,
    double? currentHumidity,
    double? currentTemp,
  }) {
    return WeatherModel(
      currentSky: currentSky ?? this.currentSky,
      currentPressure: currentPressure ?? this.currentPressure,
      currentWindSpeed: currentWindSpeed ?? this.currentWindSpeed,
      currentHumidity: currentHumidity ?? this.currentHumidity,
      currentTemp: currentTemp ?? this.currentTemp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'currentSky': currentSky,
      'currentPressure': currentPressure,
      'currentWindSpeed': currentWindSpeed,
      'currentHumidity': currentHumidity,
      'currentTemp': currentTemp,
    };
  }

  //purpose of this factory constructor is to create an instance of WeatherModel
  //based on a provided Map<String, dynamic>.
  //get the Map<String, dynamic> data and extrace them inro weather model
  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    //get the first element from the map
    final currentWeatherData = map['list'][0];
    return WeatherModel(
      currentSky: currentWeatherData['weather'][0]['main'],
      currentPressure: currentWeatherData['main']['pressure'].toDouble(),
      currentWindSpeed: currentWeatherData['wind']['speed'].toDouble(),
      currentHumidity: currentWeatherData['main']['humidity'].toDouble(),
      currentTemp: currentWeatherData['main']['temp'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WeatherModel(currentSky: $currentSky, currentPressure: $currentPressure, currentWindSpeed: $currentWindSpeed, currentHumidity: $currentHumidity, currentTemp: $currentTemp)';
  }

  @override
  bool operator ==(covariant WeatherModel other) {
    if (identical(this, other)) return true;

    return other.currentSky == currentSky &&
        other.currentPressure == currentPressure &&
        other.currentWindSpeed == currentWindSpeed &&
        other.currentHumidity == currentHumidity &&
        other.currentTemp == currentTemp;
  }

  @override
  int get hashCode {
    return currentSky.hashCode ^
        currentPressure.hashCode ^
        currentWindSpeed.hashCode ^
        currentHumidity.hashCode ^
        currentTemp.hashCode;
  }
}
