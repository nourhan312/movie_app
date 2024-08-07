import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/details/ui/widgets/cast_tab.dart';
import 'package:movie_app/features/details/ui/widgets/fav_icon.dart';
import 'package:movie_app/features/details/ui/widgets/movie_tab.dart';
import 'package:movie_app/features/details/ui/widgets/reviwes_tab.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/theming/text_style.dart';
import '../logic/details_cubit.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
    required this.id,
  });
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsCubit()
        ..movieDetails(id: id)
        ..getMovieCredits(id: id)
        ..getReviews(id: id),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: const Color(0xff242A32),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: const BackButton(
              color: Colors.white,
            ),
            title: Text(
              'Detail Screen',
              style: TextStyles.font23semiBold,
            ),
            actions: const [FavIcon()],
          ),
          body: BlocBuilder<DetailsCubit, DetailsState>(
            builder: (context, state) {
              if (state is DetailsLoading ||
                  state is CreditLoading ||
                  state is ReviewLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is DetailsError) {
                return Center(
                  child: Text('Error: ${state.message}',
                      style: const TextStyle(color: Colors.red)),
                );
              } else if (state is CreditError) {
                return Center(
                  child: Text('Error: ${state.message}',
                      style: const TextStyle(color: Colors.red)),
                );
              } else if (state is ReviewError) {
                return Center(
                  child: Text('Error: ${state.message}',
                      style: const TextStyle(color: Colors.red)),
                );
              } else {
                final cubit = context.read<DetailsCubit>();
                final movieDetails = cubit.details;
                final credits = cubit.movieCredits;
                final reviews = cubit.reviewList;

                return Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(16),
                              bottomLeft: Radius.circular(16),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: CachedNetworkImage(
                              width: 375,
                              height: 231,
                              fit: BoxFit.cover,
                              imageUrl:
                                  'https://image.tmdb.org/t/p/w500/${movieDetails!.backdropPath}',
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -30,
                          left: 29.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://image.tmdb.org/t/p/w500/${movieDetails.posterPath}',
                              height: 150,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(20),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            movieDetails.title,
                            style: TextStyles.font18SemiBoldWhite,
                          ),
                        ],
                      ),
                    ),
                    TabBar(
                      dividerColor: Colors.transparent,
                      labelColor: Colors.white,
                      indicatorColor: Colors.white,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                      unselectedLabelColor: Colors.white.withOpacity(.4),
                      tabs: const [
                        Tab(text: 'About Movie'),
                        Tab(text: 'Reviews'),
                        Tab(text: 'Cast'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          MovieTab(
                            details: movieDetails,
                          ),
                          ReviewsTab(
                            review: reviews,
                          ),
                          CastTab(
                            credits: credits,
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
      ),
    );
  }
}
