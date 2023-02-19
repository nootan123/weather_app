import "dart:convert";

import "package:http/http.dart" as http;
import "package:weatherapp/constants/api_details.dart";
import 'package:weatherapp/models/weather_details_model.dart';

class WeatherRepository {
  Future<WeatherDetailsModel> getDetails() async {
    final response = await http.get(Uri.parse(current_weather));
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body.toString());
      print(jsonResponse);
      return WeatherDetailsModel.fromJson(jsonResponse[0]);
    } else {
      throw "Something went wrong";
    }
  }
}
