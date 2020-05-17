import 'package:flutter/material.dart';
import 'package:flutter_show_dialog/controllers/page_a_controller.dart';
import 'package:provider/provider.dart';

class PageA extends StatelessWidget {
  const PageA._({Key key}) : super(key: key);

  static Widget wrapped() {
    return ChangeNotifierProvider<PageAController>(
      create: (context) => PageAController(
        locator: context.read,
        showLoginDialog: _showDialog,
      ),
      lazy: false,
      child: const PageA._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PAGE A'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => Navigator.pushNamed(context, '/b'),
          child: const Text('Page B'),
        ),
      ),
    );
  }
}

void _showDialog(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        title: const Text('ダイアログ'),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('ONE'),
          ),
          FlatButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('TWO'),
          ),
        ],
      );
    },
  );
}
