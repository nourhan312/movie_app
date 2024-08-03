import 'package:flutter/material.dart';
import 'package:movie_app/features/home_screen/widgets/movie_tab.dart';

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
            decoration:  const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight:  Radius.circular(15)),
              image: DecorationImage(
                
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







