import 'package:flutter/material.dart';
import 'dialog_transport_widget.dart';

import 'package:dart_esr/dart_esr.dart';
import 'package:dart_anchor_link/dart_anchor_link.dart';

class DialogTransport implements LinkTransport {
  BuildContext context;
  String title;
  DialogTransport(this.context, this.title);

  @override
  Future<void> onRequest(SigningRequestManager request,
      Function({Exception exception, String reason}) cancel) async {
    var uri = request.encode();
    await showDialog(
      context: context,
      child: DialogTransportWidget(this.title, uri),
    ).then((value) => cancel());
  }

  @override
  LinkStorage storage;

  @override
  void onFailure(SigningRequestManager request, Exception exception) {
    Navigator.pop(context);
  }

  @override
  void onSessionRequest(LinkSession session, SigningRequestManager request,
      void Function({Exception exception, String reason}) cancel) {
    // Called when a session request is initiated. Not used in dialog transport
  }

  @override
  void onSuccess(SigningRequestManager request, TransactResult result) {
    Navigator.pop(context);
  }

  @override
  Future<SigningRequestManager> prepare(SigningRequestManager request,
      {LinkSession session}) async {
    return request;
  }

  @override
  void showLoading() {
    // Called immediately when the transaction starts. Not used in dialog transport
  }
}
