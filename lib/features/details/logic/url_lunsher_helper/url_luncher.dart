import 'package:url_launcher/url_launcher.dart';

void launchURL(String videoKey) async {
  final Uri url = Uri.parse('https://www.youtube.com/watch?v=$videoKey');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}