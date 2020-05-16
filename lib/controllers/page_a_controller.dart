import 'package:flutter/material.dart';
import 'package:flutter_show_dialog/repositories/mock_repository.dart';
import 'package:provider/provider.dart';

class PageAController extends ChangeNotifier {
  PageAController({this.locator, Function(BuildContext) showLoginDialog}) {
    print('page A created');

    final repository = locator<MockRepository>();
    final navigatorKey = locator<GlobalKey<NavigatorState>>();
    repository.isLoginChecked.listen((event) {
      if (event) {
        print(repository.randNum);
        showLoginDialog(navigatorKey.currentState.overlay.context);
      }
    });
  }

  final Locator locator;
}
