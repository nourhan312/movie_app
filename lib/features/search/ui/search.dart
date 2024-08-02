

import 'package:flutter/material.dart';
import 'package:movie_app/core/theming/text_style.dart';

class Search extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.yellow,
      drawer: Drawer(
        child:Container(
          color: Colors.yellow,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: (){
                    _scaffoldKey.currentState!.closeDrawer();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50,left: 10),
                    child: Image.asset("assets/images/icon_back.png",width: 14,height: 24,),
                  )),


              const SizedBox(height: 110,),
              const TextWidgetOnDrawer(text: "Favoritte Movies",),
              const TextWidgetOnDrawer(text: "Language ",),
              const TextWidgetOnDrawer(text: "Feedback",),
              const TextWidgetOnDrawer(text: "About",),
              const TextWidgetOnDrawer(text: "Contact-Us",),

            ],
          ),
        )
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:20),
        child: Row(
          children: [
            GestureDetector(
                 onTap: (){
                   _scaffoldKey.currentState!.openDrawer();
                 },
                 child: Padding(
                   padding: const EdgeInsets.only(top: 10,left: 10),
                   child: Image.asset("assets/images/icon_back.png",width: 14,height: 24,),
                 )),

                    Padding(
               padding: const EdgeInsets.only(top:5,left: 20),
               child: SizedBox(
                 width: 300,
                 height: 56,
                 child: TextField(

                   decoration: InputDecoration(
                     suffixIcon: InkWell(
                       onTap: (){

                       },
                       child: const SizedBox(width: 14,height: 30,
                           child: Icon(Icons.close,)),
                     ),
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(15),
                     ),
                     filled: true,
                     hintStyle: const TextStyle(color: Color(0xff6D6D6D)),
                     hintText: "Search",
                     fillColor: const Color(0xffffffff),
                   ),

                 ),
               ),
             ),
          ],
        ),
      ),

    );
  }
}
class TextWidgetOnDrawer extends StatelessWidget {
  final String text;

  const TextWidgetOnDrawer({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 5),
      child: Text(text,style: TextStyles.font27Regular,),
    );
  }
}
