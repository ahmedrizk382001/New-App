import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({Key? key, required this.url, required this.source})
      : super(key: key);

  final String url, source;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState(url, source);
}

class _WebViewScreenState extends State<WebViewScreen> {
  final String url, source;

  _WebViewScreenState(this.url, this.source);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          source,
          style: Theme.of(context).textTheme.headlineMedium,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
