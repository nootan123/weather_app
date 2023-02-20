import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/currentWeather/current_weather_cubit.dart';
import 'package:weatherapp/cubit/searchCity/search_city_cubit.dart';
import 'package:weatherapp/repository/weather_repository.dart';
import 'package:weatherapp/screen/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
BlocProvider(
        create: (context)=>CurrentWeatherCubit(WeatherRepository()),
),
BlocProvider(
        create: (context)=>SearchCityCubit(WeatherRepository()),
)
      ],

        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(),
        ),
      );
    
  }
}
