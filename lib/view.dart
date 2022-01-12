import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:webview_flutter/webview_flutter.dart';

class LongdoMapWidget extends StatefulWidget {
  final String apiKey;

  const LongdoMapWidget({required this.apiKey, Key? key}) : super(key: key);

  @override
  LongdoMapState createState() => LongdoMapState();
}

class LongdoMapState extends State<LongdoMapWidget> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController controller) {
        _controller = controller;
        _load();
      },
    );
  }

  void _load() async {
    String content = await rootBundle
        .loadString("packages/longdo_maps_api3_flutter/assets/index.html");
    content = content.replaceFirst("[YOUR_KEY_API]", widget.apiKey);
    _controller.loadHtmlString(content);
  }

  Object object(String object, String id, List<Object> args) => {
    "\$object": object,
    "\$id": id,
    "args": args
  };

  call(method, [List<Object> args = const []]) async {
    String data = await _controller.runJavascriptReturningResult(
        "call('" + method + "','" + json.encode(args) + "');");
    return json.decode(data);
  }

  objectCall(object, method, [List<Object> args = const []]) async {
    String data = await _controller.runJavascriptReturningResult(
        "objectCall('" +
            json.encode(object) +
            "' ,'" +
            method +
            "' ,'" +
            json.encode(args) +
            "');");
    return json.decode(data);
  }
}
