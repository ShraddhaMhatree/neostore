import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neostore/screens/login_screen.dart';
import 'package:neostore/screens/products_list.dart';

class NavigatorUtils {
  static goToLoginPage(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
        (Route<dynamic> route) => false);
  }

  static goToProductListPage(BuildContext context,int categoryId, String categoryName){
     Navigator.of(context).pushNamed(ProductsList.route,
                arguments: {'category_id': categoryId, 'category_name': categoryName});
  }
}
