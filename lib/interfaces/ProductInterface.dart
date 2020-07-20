import 'package:neostore/models/login_model.dart';
import 'package:neostore/models/product_model.dart';

abstract class ProductInterface{

  void onSucess(List<Product> products);
  void onFailure(String msg);
}