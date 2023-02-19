import 'package:weatherapp/models/weather_details_model.dart';

abstract class CurrentWeatherState {}

class InitCurrentWeatherState extends CurrentWeatherState {}

class LoadingCurrentWeatherState extends CurrentWeatherState {}

class ErrorCurrentWeatherState extends CurrentWeatherState {
  final String errorMessage;
  ErrorCurrentWeatherState(this.errorMessage);
}

class ResponseCurrentWeatherState extends CurrentWeatherState {
  final WeatherDetailsModel response;
  ResponseCurrentWeatherState(this.response);
}
