import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:neostore/interfaces/ProductInterface.dart';
import 'package:neostore/models/product_model.dart';
import 'package:neostore/networking/Response.dart';
import 'package:neostore/repository/ProductsRespository.dart';

class ProductsBloc {
  ProductInterface interface;
  ProductsRespository _repository ;
  StreamController _productController;

  StreamSink<Response<ProductResponse>> get productSink =>
      _productController.sink;

  Stream<Response<ProductResponse>> get productStream =>
      _productController.stream;

  ProductsBloc(int categoryId,BuildContext ctx){
    _productController = StreamController<Response<ProductResponse>>();
    _repository = ProductsRespository();
    fetchProducts(categoryId,ctx);
  }


   fetchProducts(int category,BuildContext ctx) async {
    productSink.add(Response.loading('Getting Products'));
    try {
      ProductResponse products = await _repository.getProductsList(category,ctx);
      productSink.add(Response.completed(products));
    } catch (e) {
      productSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _productController?.close();
  }
  // void getProducts(int productId) async {
  //   try {
  //     final response = await repository.getProductsList(productId);
  //     interface.onSucess(response.data);
  //   } catch (e) {
  //     interface.onFailure(e.toString());
  //   }
  // }
}
