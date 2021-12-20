import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    Key? key,
    this.placeholder,
    this.onSubmitted,
  }) : super(key: key);

  final String? placeholder;
  final void Function(String value)? onSubmitted;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onQueryChanged);
  }

  void _onQueryChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _searchController.removeListener(_onQueryChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      onSubmitted: widget.onSubmitted,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xEDFAFAFA),
        hintText: widget.placeholder,
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
            : Material(
                type: MaterialType.transparency,
                child: IconButton(
                  iconSize: 18,
                  splashRadius: 24,
                  padding: EdgeInsets.zero,
                  onPressed: _searchController.clear,
                  icon: const Icon(
                    Icons.cancel,
                    color: Color(0x993C3C43),
                  ),
                ),
              ),
      ),
    );
  }
}
