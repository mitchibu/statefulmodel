import 'package:flutter/material.dart';
import 'package:statefulmodel/statefulmodel.dart';

import '../widget/test.dart';
import 'model.dart';

class EditPage extends StatefulWidget {
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<StatefulWidget> {
  final GlobalKey<FormState> _passwordKey = GlobalKey<FormState>();

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

  Widget _buildBody(BuildContext context, EditModel model) => Center(
    child: Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Form(
            key: _passwordKey,
            child: StreamBuilder<bool>(
              initialData: model.obscureText,
              stream: model.obscureTextStream,
              builder: (context, snapshot) => TextFormField(
                initialValue: model.password,
                obscureText: snapshot.data,
                validator: model.validatePassword,
                onSaved: model.savePassword,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(snapshot.data ? Icons.visibility_off : Icons.visibility),
                    onPressed: model.toggleObscureText,
                  )
                ),
              ),
            ),
          ),
          PasswordFormField(
            validator: model.validatePassword,
            onSaved: model.savePassword),
          RaisedButton(
            child: Text('test'),
            onPressed: () {
              if(_passwordKey.currentState.validate()) {
                _passwordKey.currentState.save();
                model.save();
              }
            },
          )
        ],
      ),
    ),
  );
}
