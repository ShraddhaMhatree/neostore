import 'package:flutter/material.dart';
import 'package:neostore/blocs/LoginBloc.dart';
import 'package:neostore/helpers/HelperConfig.dart';
import 'package:neostore/helpers/SizeConfig.dart';
import 'package:neostore/interfaces/LoginCallInterface.dart';
import 'package:neostore/models/login_model.dart';
import 'package:neostore/providers/auth_provider.dart';
import 'package:neostore/providers/product.dart';
import 'package:neostore/screens/home_screen.dart';
import 'package:neostore/screens/registration_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    implements LoginCallBackInterface {
  bool _isLoading = false;
  var helper = HelperConfig();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _password;
  String _username;
  LoginBloc presenter;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    presenter = LoginBloc(this);
    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Container(
          width: SizeConfig.safeBlockHorizontal * 100,
          height: SizeConfig.screenHeight,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 2.5),
            child: Column(
              children: <Widget>[
                headerSection(),
                textInputSection(),
                buttonSection(),
                textSection(),
                // footerSection(),
                // footerSection(),
                // footerSection(),
                Spacer(),
                footerSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container headerSection() {
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 25),
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.safeBlockHorizontal * 2.5),
      child: Text(
        'NeoSTORE',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 50,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Container textInputSection() {
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 6),
      padding:
          EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 5),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            inputUserNameField(),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 3,
            ),
            inputPasswordField(),
          ],
        ),
      ),
    );
  }

  Container inputUserNameField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          Flexible(
            child: TextFormField(
              onSaved: (value) {
                _username = value;
              },
              validator: (value) =>
                  value.isEmpty ? 'Username cannot be empty' : null,
              decoration: InputDecoration(
                errorStyle: TextStyle(color: Colors.black),
                contentPadding: const EdgeInsets.all(10.0),
                hintText: 'Username',
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
                border: InputBorder.none,
              ),
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container inputPasswordField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Icon(
              Icons.lock,
              color: Colors.white,
            ),
          ),
          Flexible(
            child: TextFormField(
              onSaved: (value) {
                _password = value;
              },
              validator: (value) =>
                  value.isEmpty ? 'Password cannot be empty' : null,
              decoration: InputDecoration(
                errorStyle: TextStyle(color: Colors.black),
                contentPadding: const EdgeInsets.all(10.0),
                hintText: 'Password',
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
                border: InputBorder.none,
              ),
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buttonSection() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: SizeConfig.safeBlockVertical * 8,
      padding:
          EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 5),
      margin: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 6),
      child: RaisedButton(
        textColor: helper.getColorFromHex("#E91C1A"),
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : Text(
                'LOGIN',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        onPressed: () {
          _saveForm(context);
        },
      ),
    );
  }

  Container textSection() {
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 2),
      child: FittedBox(
        child: Text(
          'Forgot Password?',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }

  Container footerSection() {
    return Container(
      padding: EdgeInsets.only(
        bottom: SizeConfig.safeBlockVertical * 1.5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Text(
              'DON\'T HAVE AN ACCOUNT?',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(RegistrationScreen.route);
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: SizeConfig.safeBlockHorizontal * 10,
            ),
          )
        ],
      ),
    );
  }

  void _saveForm(BuildContext context) {
    // final isValid = _formKey.currentState.validate();
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    presenter.login(_username, _password);
    setState(() {
      _isLoading = true;
    });
  }

  @override
  void loginFailed(String msg) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          'Login Failed',
          style: TextStyle(color: Colors.red),
        ),
        content: Text(
          msg,
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(ctx).pop(false);
            },
          ),
        ],
      ),
    );
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void loginSuccess(User user) {
    createUserSession(user);
    Navigator.of(context).popAndPushNamed(HomeScreen.route);
    setState(() {
      _isLoading = false;
    });
  }

  void createUserSession(User user) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('accessToken', user.accessToken);
    prefs.setString('name', user.firstName+' '+user.lastName);
    prefs.setString('email', user.email);
    prefs.setString('userId', user.id.toString());
    prefs.setString('username', user.username);
    
  }
}
