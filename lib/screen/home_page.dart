import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/constants/app_color.dart';
import 'package:weatherapp/constants/font_size.dart';
import 'package:weatherapp/constants/font_weight.dart';
import 'package:weatherapp/cubit/currentWeather/current_weather_cubit.dart';
import 'package:weatherapp/cubit/currentWeather/current_weather_state.dart';
import 'package:weatherapp/screen/search_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

String cityName = "Kathmandu";

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      final cubit = context.read<CurrentWeatherCubit>();
      cubit.fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 0.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SearchPage()));
                        },
                        icon: const Icon(Icons.search)),
                  ],
                ),
                const SizedBox(height: 150.0),
                BlocBuilder<CurrentWeatherCubit, CurrentWeatherState>(
                  builder: (BuildContext context, state) {
                    if (state is InitCurrentWeatherState ||
                        state is LoadingCurrentWeatherState) {
                      return const CircularProgressIndicator();
                    }
                    if (state is ResponseCurrentWeatherState) {
                      return Column(
                        children: [
                          Text(
                            cityName,
                            style: const TextStyle(
                                color: kLightBlack,
                                fontSize: font_30,
                                fontWeight: w6),
                          ),
                          const SizedBox(height: 20.0),
                          Text(
                            state.response.temperature.metric.value.toString() +
                                " " +
                                state.response.temperature.metric.unit,
                            style: const TextStyle(
                                color: kLightBlack,
                                fontSize: font_36,
                                fontWeight: w7),
                          ),
                          const SizedBox(height: 10.0),
                          Image.asset(
                            "assets/images/${state.response.weatherIcon}.png",
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text(state.response.weatherText),
                          SizedBox(height: 20),
                        ],
                      );
                    }
                    if (state is ErrorCurrentWeatherState) {
                      return Text(state.errorMessage);
                    }
                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
