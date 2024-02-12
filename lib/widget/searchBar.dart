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
      // SizedBox(
      //   height: 20,
      // ),
      // Expanded(
      //   child: ListView(),
      // ),
    );
  }
}
