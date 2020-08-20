import 'package:url_launcher/url_launcher.dart';

void lauchESRURL(String url) async {
  if (!url.startsWith('esr://')) {
    throw ('Wrong Protocol, should start with "esr://"');
  }
  await launch(url);
}

void lauchUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
