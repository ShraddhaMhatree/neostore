import 'package:flutter/material.dart';
import 'package:neostore/helpers/SizeConfig.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // final deviceSize = MediaQuery.of(context).size;
    // final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: SizeConfig.safeBlockHorizontal * 100,
          height: SizeConfig.screenHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.red, Colors.redAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : Padding(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          inputFields(
            'Email',
            Icons.person,
          ),
          SizedBox(
            height: SizeConfig.safeBlockVertical * 3,
          ),
          inputFields('Password', Icons.lock),
        ],
      ),
    );
  }

  Container inputFields(String label, IconData icon) {
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
              icon,
              color: Colors.white,
            ),
          ),
          Flexible(
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10.0),
                hintText: label,
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
        textColor: Color(0xFFE91C1A),
        child: Text(
          'LOGIN',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold
          ),
        ),
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        onPressed: () {},
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
          Icon(
            Icons.add,
            color: Colors.white,
            size: SizeConfig.safeBlockHorizontal * 10,
          )
        ],
      ),
    );
  }
}
