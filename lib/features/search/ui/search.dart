import 'package:flutter/material.dart';
import 'package:movie_app/core/theming/text_style.dart';
import 'package:movie_app/features/search/widgets/image_back.dart';
import 'package:movie_app/features/search/widgets/text_widget_on_drawer.dart';

class Search extends StatefulWidget {
  TextInputType? textInputType;
  TextEditingController? textController;
  String? errorMessage, labelText;

  Search({
    this.textInputType,
    this.textController,
    this.errorMessage,
    this.labelText,
  });

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
                child: ImageBack(top: 50),
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
              child: ImageBack(top: 10),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: SizedBox(
                width: 300,
                height: 56,
                child: TextField(
                  keyboardType: widget.textInputType,
                  controller: widget.textController,
                  decoration: InputDecoration(
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          widget.textController?.clear();
                        });
                      },
                      child: const Icon(Icons.clear, size: 20),
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
