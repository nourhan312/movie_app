import 'package:flutter/material.dart';

class ReviewsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: 2, // Example review count
      itemBuilder: (context, index) {
        return ListTile(
          leading: Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/circle_avatar.png'),
                // Replace with actual image URL
                radius: 24,
              ),
              Positioned(
                bottom: -20,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(2.0),

                  child: const Text(
                    '6.3',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          title: Text('Iqbal Shafiq Razaan'),
          subtitle: Text('From DC Comics comes the Suicide Squad, an antihero team of incarcerated...'),
        );
      },
    );
  }
}
