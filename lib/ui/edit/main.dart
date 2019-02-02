import 'package:flutter/material.dart';
import 'package:statefulmodel/statefulmodel.dart';

import 'model.dart';

class EditPage extends StatefulWidget {
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<StatefulWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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

  Widget _buildBody(BuildContext context, EditModel model) => Container(
    padding: EdgeInsets.all(16.0),
    child: Column(
      children: <Widget>[
        Expanded(
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 0.0, bottom: 8.0),
                  child: _buildTitle(context, model),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: _buildCategory(context, model),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: _buildAccount(context, model),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: _buildPassword(context, model),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 0.0),
                  child: _buildComment(context, model),
                ),
              ],
            ),
          ),
        ),
        RaisedButton(
          child: Text('test'),
          onPressed: () {
            if(_formKey.currentState.validate()) {
              _formKey.currentState.save();
              model.save();
            }
          },
        ),
      ],
    ),
  );

  Widget _buildText({
    @required String label,
    @required String initialValue,
    bool obscureText,
    Widget suffixIcon,
    @required FormFieldValidator<String> validator,
    @required FormFieldSetter<String> onSaved,
  }) => TextFormField(
    initialValue: initialValue,
    validator: validator,
    onSaved: onSaved,
    decoration: InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      suffixIcon: suffixIcon,
    ),
  );

  Widget _buildTitle(BuildContext context, EditModel model) => _buildText(
    label: 'Title',
    initialValue: model.title,
    validator: model.validateTitle,
    onSaved: model.saveTitle,
  );

  Widget _buildCategory(BuildContext context, EditModel model) => _buildText(
    label: 'Category',
    initialValue: model.category,
    validator: model.validateCategory,
    onSaved: model.saveCategory,
    suffixIcon: IconButton(
      icon: Icon(Icons.category),
      onPressed: () {},
    ),
  );

  Widget _buildAccount(BuildContext context, EditModel model) => _buildText(
    label: 'Account',
    initialValue: model.account,
    validator: model.validateAccount,
    onSaved: model.saveAccount,
  );

  Widget _buildPassword(BuildContext context, EditModel model) => StreamBuilder<bool>(
    initialData: model.obscureText,
    stream: model.obscureTextStream,
    builder: (context, snapshot) => _buildText(
      label: 'Password',
      initialValue: model.password,
      obscureText: snapshot.data,
      validator: model.validatePassword,
      onSaved: model.savePassword,
      suffixIcon: IconButton(
        icon: Icon(snapshot.data ? Icons.visibility_off : Icons.visibility),
        onPressed: model.toggleObscureText,
      ),
    ),
  );

  Widget _buildComment(BuildContext context, EditModel model) => _buildText(
    label: 'Comment',
    initialValue: model.comment,
    validator: model.validateComment,
    onSaved: model.saveComment,
  );
}
