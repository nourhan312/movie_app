import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/helper/spacing.dart';
import 'package:movie_app/features/details/logic/details_cubit.dart';
import '../../../../core/theming/text_style.dart';
import 'genres_section.dart';

class MovieTab extends StatelessWidget {
  const MovieTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(builder: (context, state) {
      var cubit = context.read<DetailsCubit>();
      var details = cubit.details;
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(8),
            const GenresSection(),
            verticalSpace(16),
            Row(
              children: [
                const Text("Release Date :",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  details!.releaseDate.toString().substring(0, 10),
                  style: TextStyles.font16Medium,
                )
              ],
            ),
            verticalSpace(16),
            Row(
              children: [
                const Text("Run Time :",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  details.runtime.toString(),
                  style: TextStyles.font16Medium,
                )
              ],
            ),
            const Text("Description : ",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            verticalSpace(10),
            Text(
              details.overview.toString(),
              style: TextStyle(color: Colors.white.withOpacity(.7)),
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
    });
  }
}
