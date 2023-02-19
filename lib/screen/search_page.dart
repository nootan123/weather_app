import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:weatherapp/widgets/custom_search.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Search City"),
          bottom: const PreferredSize(
            preferredSize: Size(double.infinity, 50),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomSearch(),
            ),
          ),
        ),
        body: Column(
          children: [Text("result")],
        ));
  }
}
