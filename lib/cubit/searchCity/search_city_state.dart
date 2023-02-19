import 'package:weatherapp/models/city_list_model.dart';

abstract class SearchCityState {}

class InitSearchCityState extends SearchCityState {}

class LoadingSearchCityState extends SearchCityState {}

class ErrorSearchCityState extends SearchCityState {
  final String errorMessage;
  ErrorSearchCityState(this.errorMessage);
}

class ResponseSearchCityState extends SearchCityState {
  final List<CityListModel> response;
  ResponseSearchCityState(this.response);
}
