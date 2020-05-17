import 'package:flutter/material.dart';
import 'package:flutter_show_dialog/pages/page_a.dart';
import 'package:flutter_show_dialog/repositories/mock_repository.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<MockRepository>(
          create: (_) => MockRepository(),
          lazy: false,
          dispose: (_, repository) => repository.dispose(),
        ),
        Provider.value(value: navigatorKey),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        navigatorKey: navigatorKey,
        routes: <String, Widget>{
          '/a': PageA.wrapped(),
          '/b': PageB(),
        }.map(
          (route, child) => MapEntry(route, (BuildContext context) => child),
        ),
        home: PageA.wrapped(),
      ),
    );
  }
}

class PageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PAGE B'),
      ),
    );
  }
}
