import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/cubit/search_cubit.dart';
import '../logic/cubit/search_state.dart';
import '../ui/no_result_page.dart';
import '../ui/search_page_result.dart';

class StatesCheck extends StatelessWidget {
  const StatesCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SearchSuccess) {
            return SearchResultsPage(resultmodel: state.movies);
          } else if (state is SearchError) {
            return Center(
                child: Text(state.message,
                    style: const TextStyle(color: Colors.white)));
          } else {
            return NoResultsPage();
          }
        },
      ),
    );
  }
}
