import 'package:flutter/material.dart';
import 'package:neostore/models/product_model.dart';
import 'package:neostore/providers/product_provider.dart';
import 'package:provider/provider.dart';

class ProductsRespository {
  ProductsProvider _provider;

  Future<ProductResponse> getProductsList(int productId,BuildContext ctx) async {
   _provider = Provider.of<ProductsProvider>(ctx,listen: false);
    final response = await _provider.getProducts(productId);
    return ProductResponse.fromJson(response);
  }
}
