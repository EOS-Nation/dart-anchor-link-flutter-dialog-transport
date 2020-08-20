import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

const title = 'Anchor';

class DialogTransportWidget extends StatelessWidget {
  final String uri;
  final Function cancel;

  DialogTransportWidget(this.uri, this.cancel, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white),
            child: QrImage(
              data: uri,
              version: QrVersions.auto,
              size: 200.0,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Flexible(
              child: Text(
            uri,
            overflow: TextOverflow.clip,
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.content_copy),
                onPressed: () async {
                  await Clipboard.setData(new ClipboardData(text: uri));
                },
              ),
              IconButton(
                icon: Icon(Icons.link),
                onPressed: () {},
              )
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: RaisedButton(
              child: Text('Close'),
              onPressed: () => Navigator.pop(context),
            ),
          )
        ],
      ),
    );
  }
}
