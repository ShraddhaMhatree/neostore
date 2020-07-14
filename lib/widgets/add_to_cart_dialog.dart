import 'package:flutter/material.dart';
import 'package:neostore/helpers/SizeConfig.dart';
import 'package:neostore/providers/product.dart';

class AddToCartDialog extends StatelessWidget {
  final Product product;

  AddToCartDialog({this.product});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
          child: SingleChildScrollView(
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
          child: dialogContent(context),
        ),
      ),
    );
  }

  dialogContent(BuildContext context) {
    return Container(
      width: SizeConfig.safeBlockHorizontal * 100,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Text(
              product.name,
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 15),
              width: SizeConfig.safeBlockHorizontal * 70,
              height: SizeConfig.safeBlockVertical * 30,
              child: Card(
                elevation: 5,
                child: Image.network(
                  product.productImages,
                  fit: BoxFit.fill,
                ),
              )),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Text(
              'Enter Qty',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Container(
            width: SizeConfig.safeBlockHorizontal * 30,
            margin: EdgeInsets.only(top: 10),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15),
                isDense: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green)),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15, bottom: 20),
            width: SizeConfig.safeBlockHorizontal * 60,
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: RaisedButton(
              color: Colors.red,
              padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: Text(
                "SUBMIT",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
