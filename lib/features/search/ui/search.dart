import 'package:flutter/material.dart';
import 'package:movie_app/features/search/widgets/image_back.dart';
import 'package:movie_app/features/search/widgets/text_widget_on_drawer.dart';

import '../../home_screen/ui/widgets/search.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key,
    this.textInputType,
    this.textController,
    this.errorMessage,
    this.labelText,
  });

  final TextInputType? textInputType;
  final TextEditingController? textController;
  final String? errorMessage, labelText;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.yellow,
      drawer: Drawer(
        child: Container(
          color: Colors.yellow,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  _scaffoldKey.currentState!.closeDrawer();
                },
                child: const ImageBack(top: 50),
              ),
              const SizedBox(height: 110),
              const TextWidgetOnDrawer(text: "Favorite Movies"),
              const TextWidgetOnDrawer(text: "Language"),
              const TextWidgetOnDrawer(text: "Feedback"),
              const TextWidgetOnDrawer(text: "About"),
              const TextWidgetOnDrawer(text: "Contact-Us"),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              child: const ImageBack(top: 10),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 20),
              child: SizedBox(
                width: 300,
                height: 56,
                child: SearchTextForm(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
