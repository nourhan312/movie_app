import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/details/ui/widgets/cast_tab.dart';
import 'package:movie_app/features/details/ui/widgets/fav_icon.dart';
import 'package:movie_app/features/details/ui/widgets/movie_tab.dart';
import 'package:movie_app/features/details/ui/widgets/reviwes_tab.dart';
import 'package:movie_app/features/home_screen/data/models/movie_model.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/theming/text_style.dart';
import '../logic/details_cubit.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xff242A32),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: const BackButton(color: Colors.white),
          title: Text(
            ' Movie Details',
            style: TextStyles.font23semiBold,
          ),
          actions: [FavIcon(movie: movie)],
        ),
        body: BlocBuilder<DetailsCubit, DetailsState>(
          builder: (context, state) {
            if (state is DetailsLoading ||
                state is CreditLoading ||
                state is ReviewLoading ||
                context.read<DetailsCubit>().details == null ||
                context.read<DetailsCubit>().movieCredits == null ||
                context.read<DetailsCubit>().reviewList == null) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DetailsError ||
                state is CreditError ||
                state is ReviewError) {
              return const Center(
                child: Text(
                  'Error: ',
                  style: TextStyle(color: Colors.red),
                ),
              );
            } else {
              return Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: CachedNetworkImage(
                            width: double.infinity,
                            height: 250,
                            fit: BoxFit.cover,
                            imageUrl:
                                "https://image.tmdb.org/t/p/w500/${context.read<DetailsCubit>().details?.backdropPath}",
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -40,
                        left: 30.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://image.tmdb.org/t/p/w500/${context.read<DetailsCubit>().details?.posterPath}',
                            height: 180,
                            width: 120,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(30),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            textAlign: TextAlign.center,
                            context.read<DetailsCubit>().details!.title,
                            style: TextStyles.font24SemiBoldWhite.copyWith(
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Colors.black.withOpacity(0.5),
                                  offset: const Offset(2.0, 2.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TabBar(
                    dividerColor: Colors.transparent,
                    labelColor: Colors.white,
                    indicatorColor: Colors.blueAccent,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorPadding:
                        const EdgeInsets.symmetric(horizontal: 10),
                    unselectedLabelColor: Colors.white.withOpacity(0.6),
                    tabs: const [
                      Tab(
                        icon: Icon(Icons.info_outline),
                        text: 'About Movie',
                      ),
                      Tab(
                        icon: Icon(Icons.rate_review),
                        text: 'Reviews',
                      ),
                      Tab(
                        icon: Icon(Icons.people),
                        text: 'Cast',
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        MovieTab(
                          details: context.read<DetailsCubit>().details!,
                        ),
                        ReviewsTab(
                          review: context.read<DetailsCubit>().reviewList!,
                        ),
                        CastTab(
                          credits: context.read<DetailsCubit>().movieCredits,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
