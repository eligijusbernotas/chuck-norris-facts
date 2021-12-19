import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  SearchTextField({Key? key, this.onSubmitted}) : super(key: key);

  final void Function(String value)? onSubmitted;
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xEDFAFAFA),
        hintText: 'Search for a random joke',
        contentPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        prefixIcon: const Icon(
          Icons.search,
        ),
        suffixIcon: _searchController.value.text.isEmpty
            ? null
            : IconButton(
                iconSize: 18,
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: const Icon(
                  Icons.cancel,
                  color: Color(0x993C3C43),
                ),
              ),
      ),
    );
  }
}
