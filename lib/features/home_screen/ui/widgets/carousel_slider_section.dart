import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home_screen/logic/trending_movie_cubit/trending_cubit.dart';
import 'package:movie_app/features/home_screen/ui/widgets/shimmer_trending_list_view_item.dart';
import 'package:movie_app/features/home_screen/ui/widgets/trending_list_view_item.dart';

class CarouselSliderSection extends StatelessWidget {
  const CarouselSliderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingCubit, TrendingState>(
      builder: (context, state) {
        if (state is TrendingMoviesLoading) {
          return SizedBox(
            height: 335,
            child: CarouselSlider.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return ShimmerTrendingListViewItem(
                  index: index,
                );
              },
              options: CarouselOptions(
                  height: 335,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                  aspectRatio: 16 / 9,
                  initialPage: 0,
                  autoPlayInterval: const Duration(seconds: 2)),
            ),
          );
        }
        if (state is TrendingMoviesError) {
          return const Text("Please Check the Internet connection");
        }
        return SizedBox(
          height: 335,
          child: CarouselSlider.builder(
            itemCount: context.read<TrendingCubit>().trendingMovies.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return TrendingListViewItem(
                index: index,
                movie: context.read<TrendingCubit>().trendingMovies[index],
              );
            },
            options: CarouselOptions(
                height: 335,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.8,
                aspectRatio: 16 / 9,
                initialPage: 0,
                autoPlayInterval: const Duration(seconds: 2)),
          ),
        );
      },
    );
  }
}
