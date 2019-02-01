import 'package:flutter/material.dart';
import 'package:statefulmodel/statefulmodel.dart';

import 'model.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) => StatefulModel<HomeModel>.builder(
    creator: (context, previus) => HomeModel(),
    builder: _build,
  );

  Widget _build(BuildContext context, HomeModel model) => Scaffold(
    appBar: _buildAppBar(),
    body: _buildBody(context, model),
    drawer: _buildDrawer(context),
    floatingActionButton: _buildFloatingActionButton(context, model),
  );

  Widget _buildAppBar() => AppBar(
    title: Text(title),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.info),
        onPressed: () {},
      ),
    ],
  );

  Widget _buildDrawer(BuildContext context) => Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text('header'),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(
          title: Text('item1'),
          onTap: () {Navigator.pop(context);},
        ),
        ListTile(
          title: Text('item2'),
          onTap: () {Navigator.pop(context);},
        ),
      ],
    ),
  );

  Widget _buildFloatingActionButton(BuildContext context, HomeModel model) => FloatingActionButton(
    onPressed: model.incement,
    tooltip: 'Increment',
    child: Icon(Icons.add),
  );

  Widget _buildBody(BuildContext context, HomeModel model) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'You have pushed the button this many times:',
        ),
        StreamBuilder<int>(
          stream: model.counterStream,
          initialData: model.counter,
          builder: (context, snapshot) => Text(
            '${snapshot.data}',
            style: Theme.of(context).textTheme.display1,
          ),
        ),
      ],
    ),
  );
}
