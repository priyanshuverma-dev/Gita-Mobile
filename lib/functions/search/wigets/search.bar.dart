import 'package:GitaMobile/theme/index.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  const SearchBar({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      style: const TextStyle(
        fontSize: 18,
        color: Pallet.whiteColor,
      ),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: Pallet.searchBarColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: Pallet.greyColor,
          ),
        ),
        contentPadding: const EdgeInsets.all(15),
        hintText: hintText,
        fillColor: Pallet.greyColor,
        filled: true,
        hintStyle: const TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}
