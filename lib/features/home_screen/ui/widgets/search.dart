import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_text_form_field.dart';

class SearchTextForm extends StatefulWidget {
  const SearchTextForm({
    super.key,
  });

  @override
  State<SearchTextForm> createState() => _SearchTextForm();
}

class _SearchTextForm extends State<SearchTextForm> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 50,
      decoration: ShapeDecoration(
        color: const Color(0xFF3A3F47),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Center(
        child: CustomTexFormField(
          inputBorder: InputBorder.none,
          hintText: "Search",
          hintStyle: const TextStyle(color: Color(0xff67686D),),
          controller: searchController,
          suffixIcon: const Icon(Icons.search_sharp,color: Color(0xff67686D),),
        ),
      ),
    );
  }
}
