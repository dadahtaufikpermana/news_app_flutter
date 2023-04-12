import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../domain/core/interfaces/core/constants/constants.dart';

class WebViewScreen extends StatelessWidget {
  final newsUrl;

  const WebViewScreen({Key? key, this.newsUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Color(0xFFF5C600),
        centerTitle: true,
        title: Text(
          Constants.news,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        child: WebView(
          initialUrl: newsUrl,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
