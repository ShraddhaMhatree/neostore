import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
          width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.red, Colors.redAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: _isLoading ? Center(child: CircularProgressIndicator()) : Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              headerSection(),
              textInputSection(),
              buttonSection(),
              textSection(),
              Align(
                alignment: Alignment.bottomCenter,
                child: footerSection(),
              )
              
            ],
          ),
        ),
      ),
    
    );
  }

  Container headerSection(){
    return Container(
      margin: EdgeInsets.only(top: 200),
      child: Text('NeoSTORE',
      style: TextStyle(color: Colors.white, fontSize:50, fontWeight: FontWeight.bold),),
    );
  }

  Container textInputSection(){
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.person, color: Colors.white),
              hintText: 'Username',
              hintStyle: TextStyle(
                color: Colors.white
              )
            
            ),
          ),
          SizedBox(height: 30,),
          TextFormField(
          
            decoration: InputDecoration(
              
              icon: Icon(Icons.lock, color: Colors.white,),
              hintText: 'Password',
              hintStyle: TextStyle(
                color: Colors.white
              )
            ),
          ),

        ],
      ),
    );
  }

  Container buttonSection(){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60.0,
      padding: EdgeInsets.symmetric(horizontal: 30),
      margin: EdgeInsets.only(top: 30),
      child: RaisedButton(
        textColor: Colors.red,
        child: Text('LOGIN', style: TextStyle(fontSize: 30,),),
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        onPressed: (){},
      )
      ,
    );
  }

  Container textSection(){
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Text('Forgot Password?', style: TextStyle(color: Colors.white,fontSize: 24 ),),
    );
  }

  Container footerSection(){
    return Container(
      
      child: Row(
        children: <Widget>[
          Text('Don\'nt have an account? '),
          Icon(Icons.add)
        ],
      ),
    );
  }

}