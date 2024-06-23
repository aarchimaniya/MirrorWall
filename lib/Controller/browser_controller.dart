import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class CustomWebViewController extends ChangeNotifier {
  late InAppWebViewController webViewController;
  String WebURL = '';

  void setWebViewController(dynamic controller) {
    webViewController = controller;
  }

  void reloadPage() {
    webViewController.reload();
  }

  void onWebViewCreated(InAppWebViewController controller) {
    webViewController = controller;
  }

  void loadUrl(String url) {
    // webViewController.loadUrl(url);
  }
}
