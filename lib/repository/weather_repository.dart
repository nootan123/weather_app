import "dart:convert";
import "dart:io";

import "package:http/http.dart" as http;
import "package:weatherapp/constants/api_details.dart";
import "package:weatherapp/models/city_list_model.dart";
import 'package:weatherapp/models/weather_details_model.dart';

class WeatherRepository {
  Future<WeatherDetailsModel> getDetails(String cityId) async {
    try {
      final response =
          await http.get(Uri.parse(currentWeather + cityId + currentWeather2));
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body.toString());
        return WeatherDetailsModel.fromJson(jsonResponse[0]);
      } else {
        throw "Something went wrong";
      }
    } on SocketException {
      throw 'No Internet connection';
    }
  }

  getCityLists(String city) async {
    try {
      final response = await http.get(Uri.parse(searchCity + city));
      if (response.statusCode == 200) {
        final List jsonResponse = json.decode(response.body.toString());
        return jsonResponse.map((e) => CityListModel.fromJson(e)).toList();
      } else {
        throw "Something went wrong";
      }
    } on SocketException {
      throw 'No Internet connection';
    }
  }
}
