import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/constants/font_size.dart';
import 'package:weatherapp/constants/font_weight.dart';
import 'package:weatherapp/cubit/currentWeather/current_weather_cubit.dart';
import 'package:weatherapp/cubit/searchCity/search_city_cubit.dart';
import 'package:weatherapp/cubit/searchCity/search_city_state.dart';
import 'package:weatherapp/screen/home_page.dart';
import 'package:weatherapp/widgets/custom_search.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var cubit;
  var detailsCubit;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      cubit = context.read<SearchCityCubit>();
      detailsCubit = context.read<CurrentWeatherCubit>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Search City"),
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 50),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomSearch(onChanged: (val) {
                context.read<SearchCityCubit>().fetchData(val!);
              }),
            ),
          ),
        ),
        body: BlocBuilder<SearchCityCubit, SearchCityState>(
          builder: (context, state) {
            if (state is LoadingSearchCityState) {
              return const CircularProgressIndicator();
            }
            if (state is ResponseSearchCityState) {
              final cities = state.response;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView.builder(
                    itemCount: cities.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          cities[index].localizedName,
                          style: const TextStyle(
                            fontSize: font_18,
                            fontWeight: w6,
                          ),
                        ),
                        subtitle: Text(
                          cities[index].country.localizedName,
                          style: const TextStyle(
                            fontSize: font_18,
                            fontWeight: w6,
                          ),
                        ),
                        onTap: () {
                          context
                              .read<CurrentWeatherCubit>()
                              .fetchData(cityId: cities[index].key);
                          cityName = cities[index].localizedName;
                          Navigator.pop(context);
                        },
                      );
                    }),
              );
            }
            return const SizedBox();
          },
        ));
  }
}
