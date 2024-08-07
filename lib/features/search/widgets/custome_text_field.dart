import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/cubit/search_cubit.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Builder(
        builder: (context) {
          return TextFormField(
            onChanged: (query) {
              context.read<SearchCubit>().searchMovies(query);
            },
            cursorColor: Colors.white,
            style: const TextStyle(
              color: Colors.white,
            ),
            decoration: const InputDecoration(
              filled: true,
              counterStyle: TextStyle(
                color: Colors.white,
              ),
              fillColor: Color(0xFF67686D),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(16.0)), // Set the border radius to 16
              ),
              hintText: 'Search',
              hintStyle: TextStyle(
                color: Colors.white,
              ),
              suffixIcon: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
