import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/currentWeather/current_weather_state.dart';
import 'package:weatherapp/repository/weather_repository.dart';

class CurrentWeatherCubit extends Cubit<CurrentWeatherState> {
  final WeatherRepository _repository;
  CurrentWeatherCubit(this._repository) : super(InitCurrentWeatherState());
  fetchData() async {
    emit(LoadingCurrentWeatherState());
    try {
      final response = await _repository.getDetails();
      emit(ResponseCurrentWeatherState(response));
    } catch (e) {
      emit(ErrorCurrentWeatherState(e.toString()));
    }
  }
}
