import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
   WebViewScreen({super.key});
  static const  String routeName ="webview";


  @override
  Widget build(BuildContext context) {
    var link = ModalRoute.of(context)?.settings.arguments as String ;
    WebViewController controller = WebViewController()..loadRequest(Uri.parse(link));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.height*0.09,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom:Radius.circular(22)
            )
        ),
        title: const Text("WebView"),
      ),
      body: WebViewWidget(controller: controller)
    );
  }
}
