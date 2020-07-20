import 'package:flutter/cupertino.dart';
import 'package:neostore/models/product_model.dart';

class Cart {
  final String id;
  final int productId;
  int quantity;
  final Product product;
 
 Cart({
   @required this.id,
   @required this.productId,
   @required this.quantity,
   @required this.product
 });

 void setQty(int qty){
   this.quantity = qty;
 }
}