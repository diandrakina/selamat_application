// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/styles/styles.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  //VOID BUAT TAMPUNG HISTORY
  void updateList(String value) {}
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.maxFinite,
      child: TextField(
        style: TextStyles.regular_16,
        decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.activeCalendar,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: "Search",
            hintStyle: TextStyles.regular_16,
            contentPadding: EdgeInsets.symmetric(vertical: 5),
            prefixIcon: Icon(Icons.search),
            prefixIconColor: Colors.white),
      ),
    );
  }
}

class CustomSearchBar2 extends StatefulWidget {
  //VOID BUAT TAMPUNG HISTORY
  void updateList(String value) {}
  final double height;
  final double width;
  final Color color;
  const CustomSearchBar2(
      {super.key,
      required this.color,
      required this.height,
      required this.width});

  @override
  State<CustomSearchBar2> createState() => _CustomSearchBar2State();
}

class _CustomSearchBar2State extends State<CustomSearchBar2> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: TextField(
        style: TextStyles.regular_14,
        decoration: InputDecoration(
            filled: true,
            fillColor: widget.color,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: "Search",
            hintStyle: TextStyles.regular_14,
            contentPadding: EdgeInsets.symmetric(vertical: 5),
            prefixIcon: Icon(Icons.search),
            prefixIconColor: Colors.white),
      ),
    );
  }
}
