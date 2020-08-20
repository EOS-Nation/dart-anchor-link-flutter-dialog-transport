import 'package:dart_anchor_link/dart_anchor_link.dart';
import 'package:flutter/material.dart';

import 'package:dart_anchor_link_flutter_dialog_transport/dart_anchor_link_flutter_transport.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DialogTransportExample(),
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF3a3a3a),
          primaryColorDark: Color(0xFF152026),
          buttonColor: Color(0xFFd66c44),
          buttonTheme: ButtonThemeData(
            buttonColor: Color(0xFFd66c44),
          )),
    );
  }
}

class DialogTransportExample extends StatefulWidget {
  @override
  _DialogTransportExampleState createState() => _DialogTransportExampleState();
}

class _DialogTransportExampleState extends State<DialogTransportExample> {
  Future<void> login() async {
    try {
      // app identifier, should be set to the eosio contract account if applicable
      var identifier = 'pacoeosnatio';

      var transport = DialogTransport(context);

      var options = LinkOptions(
        transport,
        chainName: ChainName.JUNGLE,
        rpc: JsonRpc('https://jungle.greymass.com', 'v1'),
      );

      // initialize the link
      var link = Link(options);

      var res = await link.login(identifier);
      print(res?.session?.identifier);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          RaisedButton(
            onPressed: () => this.login(),
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
