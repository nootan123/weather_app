import 'package:flutter/material.dart';
import 'package:weatherapp/constants/app_color.dart';

class CustomSearch extends StatefulWidget {
  final TextEditingController? controller;
  final String? Function(String?)? onChanged;
  const CustomSearch({Key? key, this.controller, this.onChanged})
      : super(key: key);

  @override
  State<CustomSearch> createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: kGrey_200,
          border: Border.all(color: kGrey_200),
          borderRadius: BorderRadius.circular(15.0)),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search Location",
          hintStyle: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
              fontWeight: FontWeight.w400),
          contentPadding: const EdgeInsets.only(left: 24, top: 16),
          prefixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            // color: appcolors.lightGreen,
          ),
          
          // focusedBorder: OutlineInputBorder(
          //   borderSide: BorderSide(color: appcolors.grey_300),
          //   borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          // ),
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
