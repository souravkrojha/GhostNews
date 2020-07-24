import 'dart:async';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import "package:webview_flutter/webview_flutter.dart";

class Article extends StatefulWidget {
  final String newsUrl;
  Article({this.newsUrl});
  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Ghost"),
            Text(
              "News",
              style: TextStyle(color: Colors.red[700]),
            ),
          ],
        ),
        elevation: 0,
        centerTitle: true,
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Share.share(widget.newsUrl);
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(
                  Icons.share,
                )),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: widget.newsUrl,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            }),
      ),
    );
  }
}
