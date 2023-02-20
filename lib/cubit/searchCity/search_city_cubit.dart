import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/searchCity/search_city_state.dart';
import 'package:weatherapp/repository/weather_repository.dart';

class SearchCityCubit extends Cubit<SearchCityState> {
  final WeatherRepository _repository;
  SearchCityCubit(this._repository) : super(InitSearchCityState());
  fetchData(String city) async {
    emit(LoadingSearchCityState());
    try {
      final response = await _repository.getCityLists(city);
      emit(ResponseSearchCityState(response));
    } catch (e) {
      emit(ErrorSearchCityState(e.toString(),city));
    }
  }
}
