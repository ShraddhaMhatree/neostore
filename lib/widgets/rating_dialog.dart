import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:neostore/helpers/SizeConfig.dart';
import 'package:neostore/models/product_model.dart';

class RatingDialog extends StatelessWidget {
  final Product product;

  RatingDialog({this.product});

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
            child: RatingBar(
                  initialRating: product.rating.toDouble(),
                  itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                  direction: Axis.horizontal,
                  itemCount: 5,
                  itemSize: SizeConfig.safeBlockHorizontal * 10,
                  itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                  unratedColor: Colors.grey.shade500,
                  onRatingUpdate: (rating){

                  })
          ),
          
          Container(
            margin: EdgeInsets.only(top: 15, bottom: 20),
            width: SizeConfig.safeBlockHorizontal * 60,
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: RaisedButton(
              color: Colors.red,
              padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: Text(
                "Rate Now",
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
