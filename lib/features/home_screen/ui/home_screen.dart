import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(

        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Image.asset("assets/images/big_line.png",width: 36,),
             const SizedBox(height:5),
            Image.asset("assets/images/small_line.png",width: 25,),
             const SizedBox(height:5),
            Image.asset("assets/images/big_line.png",width: 36,),
          ],),
        ),
        actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Image.asset("assets/images/search.png",width: 34,height: 37,),
        )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Container(
            height: 540,
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                
                image: AssetImage('assets/images/test.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10,),
          MovieTabs()
        ],
      )
    );
  }

}
class MovieTabs extends StatefulWidget {
  @override
  _MovieTabsState createState() => _MovieTabsState();
}

class _MovieTabsState extends State<MovieTabs> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Popular'),
              Tab(text: 'Top Rated'),
              Tab(text: 'Upcoming'),
              Tab(text: 'Now Playing'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                MovieCategory(
                  movies: const [
                    {'title': 'Tomorrow War', 'image': 'assets/images/test.png'},
                    {'title': 'Tomorrow War', 'image': 'assets/images/test.png'},
                    {'title': 'Tomorrow War', 'image': 'assets/images/test.png'},
                  ],
                ),
                MovieCategory(
                  movies: const [
                    {'title': 'Bloodshot', 'image': 'assets/images/test.png'},
                    {'title': 'Bloodshot', 'image': 'assets/images/test.png'},
                    {'title': 'Bloodshot', 'image': 'assets/images/test.png'},
                  ],
                ),
                MovieCategory(
                  movies: const [
                    {'title': 'Free Guy', 'image': 'assets/images/test.png'},
                    {'title': 'Free Guy', 'image': 'assets/images/test.png'},
                    {'title': 'Free Guy', 'image': 'assets/images/test.png'},
                  ],
                ),
                MovieCategory(
                  movies: const [
                    {'title': 'Bloodshot', 'image': 'assets/images/test.png'},
                    {'title': 'Bloodshot', 'image': 'assets/images/test.png'},
                    {'title': 'Bloodshot', 'image': 'assets/images/test.png'},
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MovieCategory extends StatelessWidget {
  final List<Map<String, String>> movies;

  MovieCategory({required this.movies});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 0.6,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)
              ),
              height: 120,
              child: Image.asset(movie['image']!, fit: BoxFit.cover),
            ),
            const SizedBox(height: 8.0),
            Text(
              movie['title']!,
              style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ],
        );
      },
    );
  }
}






