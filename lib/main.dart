import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:statefulmodel/statefulmodel.dart';

import 'model.dart';
import 'ui/home/main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FutureBuilder<PackageInfo>(
    future: PackageInfo.fromPlatform(),
    builder: (context, snapshot) {
      if(snapshot.connectionState != ConnectionState.done) return null;
      return StatefulModel<AppModel>.builder(
        creator: (context, model) => AppModel(snapshot.data),
        builder: _build,
      );
    },
  );

  Widget _build(BuildContext context, AppModel model) => MaterialApp(
    title: model.packageInfo.appName,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: HomePage(title: model.packageInfo.appName),
  );
}
