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
    content = base64Encode(Utf8Encoder().convert(content));
    _controller.loadUrl("data:text/html;base64,$content");
  }

  getZoom() async {
    return await _controller.runJavascriptReturningResult("getZoom()");
  }

  void setZoom(double level, {bool animation = false}) {
    _controller.runJavascript("setZoom($level, $animation)");
  }

  getZoomRange() async {
    final result =
        await _controller.runJavascriptReturningResult("getZoomRange()");
    return json.decode(result);
  }

  void setZoomRange(double min, double max) {
    _controller.runJavascript("setZoomRange($min, $max)");
  }

  getLocation() async {
    final result =
        await _controller.runJavascriptReturningResult("getLocation()");
    return json.decode(result);
  }

  void setLocation(double lon, double lat, {bool animation = false}) {
    _controller.runJavascript("setLocation($lon, $lat, $animation)");
  }

  getBound() async {
    final result = await _controller.runJavascriptReturningResult("getBound()");
    return json.decode(result);
  }

  void setBound(double minLon, double minLat, double maxLon, double maxLat) {
    _controller
        .runJavascript("setLocation($minLon, $minLat, $maxLon, $maxLat)");
  }

  void move(double x, double y, {bool animation = false}) {
    _controller.runJavascript("move($x, $y, $animation)");
  }

  getLang() async {
    return await _controller.runJavascriptReturningResult("getLang()");
  }

  getRotate() async {
    return await _controller.runJavascriptReturningResult("getRotate()");
  }

  void setRotate(rotate) {
    _controller.runJavascript("setRotate($rotate)");
  }

  getPitch() async {
    return await _controller.runJavascriptReturningResult("getPitch()");
  }

  void setPitch(pitch) {
    _controller.runJavascript("setPitch($pitch)");
  }

  getFilter() async {
    return _controller.runJavascriptReturningResult("getFilter()");
  }

  void setDarkFilter() {
    _controller.runJavascript("setDarkFilter()");
  }

  void setNoneFilter() {
    _controller.runJavascript("setNoneFilter()");
  }
}
