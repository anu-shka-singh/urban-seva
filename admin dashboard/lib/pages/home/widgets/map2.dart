import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LeafletMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'assets/leaflet_map.html', // HTML file that contains Leaflet map
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
