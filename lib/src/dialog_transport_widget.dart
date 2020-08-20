import 'package:dart_anchor_link_flutter_dialog_transport/src/utils/url.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

const anchorIconUrl = 'https://i.imgur.com/bs3yAeW.png';
const darkBackgroundColor = Color.fromARGB(255, 19, 27, 51);
const lightBackgroundColor = Color.fromARGB(255, 38, 45, 67);

class DialogTransportWidget extends StatelessWidget {
  final String title;
  final String esr;

  DialogTransportWidget(this.title, this.esr);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      backgroundColor: darkBackgroundColor,
      child: Container(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  height: 45,
                  decoration: new BoxDecoration(
                      color: lightBackgroundColor,
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(20.0),
                        topRight: const Radius.circular(20.0),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Image.network(
                      anchorIconUrl,
                      height: 55,
                    ),
                  ),
                ),
              ],
            ),
            Text(title ?? '', style: TextStyle(fontSize: 23)),
            SizedBox(height: 10),
            Text(
              'Scan the QR-code with your Anchor app.',
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(height: 5),
            QrImage(
              backgroundColor: darkBackgroundColor,
              foregroundColor: Colors.white,
              data: esr,
              version: QrVersions.auto,
              size: 250,
            ),
            SizedBox(height: 5),
            SizedBox(
              width: 240,
              height: 40,
              child: RaisedButton(
                color: lightBackgroundColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)),
                onPressed: () async => lauchESRURL(esr),
                child: Text('Launch Anchor Wallet'),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 240,
              height: 40,
              child: RaisedButton(
                color: lightBackgroundColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)),
                onPressed: () async {
                  await Clipboard.setData(new ClipboardData(text: esr));
                },
                child: Text('Copy Encoded Request'),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Don't have Anchor? ",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    )),
                TextSpan(
                    text: "Download Anchor app now",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => lauchUrl('https://greymass.com/anchor'))
              ])),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
