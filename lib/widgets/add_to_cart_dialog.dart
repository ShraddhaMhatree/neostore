import 'package:flutter/material.dart';
import 'package:neostore/helpers/SizeConfig.dart';
import 'package:neostore/providers/cart_provider.dart';
import 'package:neostore/models/product_model.dart';
import 'package:neostore/providers/product_provider.dart';
import 'package:neostore/screens/my_cart_screen.dart';
import 'package:provider/provider.dart';

class AddToCartDialog extends StatelessWidget {
  final Product product;
  final qtyController = TextEditingController();

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
              controller: qtyController,
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
              onPressed: () {
                Provider.of<CartProdvider>(context, listen: false)
                    .addToCart(product, int.parse(qtyController.text))
                    .then((value) =>
                        Navigator.of(context).popAndPushNamed(MyCart.route));
              },
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
