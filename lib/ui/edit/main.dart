import 'package:flutter/material.dart';
import 'package:statefulmodel/statefulmodel.dart';

import '../widget/test.dart';
import 'model.dart';

class EditPage extends StatefulWidget {
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) => StatefulModel<EditModel>.builder(
    creator: (context, previus) => EditModel(),
    builder: _build,
  );

  Widget _build(BuildContext context, EditModel model) => Scaffold(
    appBar: _buildAppBar(),
    body: _buildBody(context, model),
  );

  Widget _buildAppBar() => AppBar(
    title: Text('edit'),
  );

  final bool _obscureText = false;
  final GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
  Widget _buildBody(BuildContext context, EditModel model) => Center(
    child: Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextFormField(
            key: passwordKey,
            initialValue: model.password,
            obscureText: _obscureText,
            validator: model.validatePassword,
            onSaved: model.savePassword,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                },
              )
            ),
          ),
          PasswordFormField(
            validator: model.validatePassword,
            onSaved: model.savePassword),
          RaisedButton(
            child: Text('test'),
            onPressed: () => model.save(passwordKey.currentState),
          )
        ],
      ),
    ),
  );
}

class EditPage_ extends StatelessWidget {
  EditPage_({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StatefulModel<EditModel>.builder(
    creator: (context, previus) => EditModel(),
    builder: _build,
  );

  Widget _build(BuildContext context, EditModel model) => Scaffold(
    appBar: _buildAppBar(),
    body: _buildBody(context, model),
  );

  Widget _buildAppBar() => AppBar(
    title: Text('edit'),
  );

  final bool _obscureText = false;
  final GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
  Widget _buildBody(BuildContext context, EditModel model) => Center(
    child: Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextFormField(
            key: passwordKey,
            initialValue: model.password,
            obscureText: _obscureText,
            validator: model.validatePassword,
            onSaved: model.savePassword,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                },
              )
            ),
          ),
          PasswordFormField(
            validator: model.validatePassword,
            onSaved: model.savePassword),
          RaisedButton(
            child: Text('test'),
            onPressed: () => model.save(null),
          )
        ],
      ),
    ),
  );
}
