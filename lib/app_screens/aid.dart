import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


class Aid extends StatelessWidget {
  final String title;
  Aid(this.title);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: "http://www.sja.org.uk/sja/first-aid-advice.aspx",
      appBar: new AppBar(
        title: const Text('First Aid'),
      ),
      withZoom: true,
      withLocalStorage: true,
    );


  }


}

