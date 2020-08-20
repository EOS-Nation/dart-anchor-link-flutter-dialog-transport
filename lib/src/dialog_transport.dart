import 'package:flutter/material.dart';
import 'dialog_transport_widget.dart';

import 'package:dart_esr/dart_esr.dart';
import 'package:dart_anchor_link/dart_anchor_link.dart';

class DialogTransport implements LinkTransport {
  BuildContext context;
  DialogTransport(this.context);

  @override
  void onRequest(SigningRequestManager request,
      Function({Exception exception, String reason}) cancel) {
    var uri = request.encode();
    showDialog(
      context: context,
      child: DialogTransportWidget(uri, cancel),
    );
  }

  @override
  LinkStorage storage;

  @override
  void onFailure(SigningRequestManager request, Exception exception) {
    // Called if the request failed. Not used in dialog transport
  }

  @override
  void onSessionRequest(LinkSession session, SigningRequestManager request,
      void Function({Exception exception, String reason}) cancel) {
    // Called when a session request is initiated. Not used in dialog transport
  }

  @override
  void onSuccess(SigningRequestManager request, TransactResult result) {
    // Called if the request was successful.  Not used in dialog transport
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
