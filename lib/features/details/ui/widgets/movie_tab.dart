import 'package:flutter/material.dart';
import 'package:movie_app/core/helper/spacing.dart';
import '../../../../core/theming/text_style.dart';
import 'genres_section.dart';

class MovieTab extends StatelessWidget {
  const MovieTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(8),
          const GenresSection(),
          verticalSpace( 16),
          Row(
            children: [
              const Text("Release Date :", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
              const SizedBox(width: 5,),
              Text("8/7/2001",style: TextStyles.font16Medium,)
            ],
          ),
          verticalSpace(16),
          Row(
            children: [
              const Text("Run Time :", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
              const SizedBox(width: 5,),
              Text("122",style: TextStyles.font16Medium,)
            ],
          ),
          const Text("Description : ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
          verticalSpace(10),
          Text(
            'From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.',
            style: TextStyle(color: Colors.white.withOpacity(.7)),
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

