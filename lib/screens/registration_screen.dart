import 'package:flutter/material.dart';
import 'package:neostore/helpers/SizeConfig.dart';
import 'package:neostore/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  static final route = '/registration';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  var gender = '';
  var _isChecked = false;
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Registration'),
        centerTitle: true,
      ),
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 5),
                  child: Text(
                    "NeoSTORE",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 5,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.safeBlockHorizontal * 5),
                  child: TextField(
                    controller: _firstNameController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        isDense: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        hintText: "First Name",
                        hintStyle: TextStyle(color: Colors.white, fontSize: 15),
                        prefixIcon: Icon(Icons.person, color: Colors.white)),
                  ),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 2.5),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextField(
                    controller: _lastNameController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        isDense: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        hintText: "Last Name",
                        hintStyle: TextStyle(color: Colors.white, fontSize: 15),
                        prefixIcon: Icon(Icons.person, color: Colors.white)),
                  ),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 2.5),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _emailController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        isDense: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.white, fontSize: 15),
                        prefixIcon: Icon(Icons.email, color: Colors.white)),
                  ),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 2.5),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _passwordController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        isDense: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.white, fontSize: 15),
                        prefixIcon: Icon(Icons.lock, color: Colors.white)),
                  ),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 2.5),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _confirmPasswordController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        isDense: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        hintText: "Confirm password",
                        hintStyle: TextStyle(color: Colors.white, fontSize: 15),
                        prefixIcon: Icon(Icons.lock, color: Colors.white)),
                  ),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 2.5),
                Container(
                  width: SizeConfig.blockSizeHorizontal * 100,
                  padding: EdgeInsets.fromLTRB(25, 0, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        'Gender',
                        style: TextStyle(color: Colors.white),
                      ),
                      new Radio(
                          value: 'M',
                          groupValue: gender,
                          onChanged: (value) {
                            _setGender(value);
                          },
                          activeColor: Colors.white),
                      new Text(
                        'Male',
                        style: TextStyle(color: Colors.white),
                      ),
                      new Radio(
                          value: 'F',
                          groupValue: gender,
                          onChanged: (value) {
                            _setGender(value);
                          },
                          activeColor: Colors.white),
                      new Text(
                        'Female',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 2.5,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _phoneNumberController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        isDense: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        hintText: "Phone Number",
                        hintStyle: TextStyle(color: Colors.white, fontSize: 15),
                        prefixIcon:
                            Icon(Icons.phone_android, color: Colors.white)),
                  ),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 2.5),
                Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: CheckboxListTile(
                      onChanged: (new_value) {
                        setState(() {
                          _isChecked = new_value;
                        });
                      },
                      value: _isChecked,
                      title: Text(
                        'I agree to the Terms & Coonditions',
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
                SizedBox(height: SizeConfig.safeBlockVertical * 2.5),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: RaisedButton(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: isLoading
                        ? Center(child: CircularProgressIndicator())
                        : Text(
                            "REGISTER",
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          ),
                    onPressed: () {
                      register();
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(color: Colors.red)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _setGender(String value) {
    setState(() {
      gender = value;
    });
  }

  Future<void> register() async {
    setState(() {
      isLoading = true;
    });
    await Provider.of<AuthProvider>(context, listen: false).register(
        _firstNameController.text,
        _lastNameController.text,
        _emailController.text,
        _passwordController.text,
        _confirmPasswordController.text,
        gender,
        int.parse(_phoneNumberController.text));

    setState(() {
      isLoading = false;
    });
  }
}
