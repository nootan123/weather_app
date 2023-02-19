import "dart:convert";

import "package:http/http.dart" as http;
import "package:weatherapp/constants/api_details.dart";
import "package:weatherapp/models/city_list_model.dart";
import 'package:weatherapp/models/weather_details_model.dart';

class WeatherRepository {
  Future<WeatherDetailsModel> getDetails(String cityId) async {
    final response =
        await http.get(Uri.parse(current_weather + cityId + current_weather2));
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body.toString());
      print(jsonResponse);
      return WeatherDetailsModel.fromJson(jsonResponse[0]);
    } else {
      throw "Something went wrong";
    }
  }

  getCityLists(String city) async {
    final response = await http.get(Uri.parse(search_city + city));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body.toString());
      print(response.runtimeType);

      // return CityListModel.fromJson(jsonResponse);
      return jsonResponse.map((e) => CityListModel.fromJson(e)).toList();
    } else {
      throw "Something went wrong";
    }
  }
}
