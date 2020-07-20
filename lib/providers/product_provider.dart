import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:neostore/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:neostore/networking/CustomException.dart';

class ProductsProvider with ChangeNotifier {
  final String _baseUrl = "https://testapi.io/api/ShraddhaMhatre/getProducts";

  List<Product> _items = [
    // Product(
    //     id: 1,
    //     productCategoryId: 1,
    //     name: 'Cool Side Table',
    //     producer: 'Tabla',
    //     description:
    //         'Simple geometry\r\nMinimalistic Side Table\r\nSleek x-shaped legs\r\nBase:BFTfree Laminate',
    //     cost: 880,
    //     rating: 2,
    //     viewCount: 5,
    //     created: '2015-08-31T13:57:41+0000',
    //     modified: '2015-09-03T04:45:18+0000',
    //     productImages:
    //         'https://cdn.pixabay.com/photo/2018/07/10/21/23/pancake-3529653_1280.jpg'),
    // Product(
    //     id: 2,
    //     productCategoryId: 1,
    //     name: 'Cool Center Table',
    //     producer: 'Tabla',
    //     description:
    //         'Simple geometry\r\nMinimalistic Side Table\r\nSleek x-shaped legs\r\nBase:BFTfree Laminate',
    //     cost: 880,
    //     rating: 2,
    //     viewCount: 5,
    //     created: '2015-08-31T13:57:41+0000',
    //     modified: '2015-09-03T04:45:18+0000',
    //     productImages:
    //         'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg'),
    // Product(
    //     id: 3,
    //     productCategoryId: 2,
    //     name: 'Cool Sofa',
    //     producer: 'Tabla',
    //     description:
    //         'Simple geometry\r\nMinimalistic Side Table\r\nSleek x-shaped legs\r\nBase:BFTfree Laminate',
    //     cost: 880,
    //     rating: 2,
    //     viewCount: 5,
    //     created: '2015-08-31T13:57:41+0000',
    //     modified: '2015-09-03T04:45:18+0000',
    //     productImages:
    //         'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg'),
    // Product(
    //     id: 4,
    //     productCategoryId: 2,
    //     name: 'Royal Sofa',
    //     producer: 'Tabla',
    //     description:
    //         'Simple geometry\r\nMinimalistic Side Table\r\nSleek x-shaped legs\r\nBase:BFTfree Laminate',
    //     cost: 880,
    //     rating: 2,
    //     viewCount: 5,
    //     created: '2015-08-31T13:57:41+0000',
    //     modified: '2015-09-03T04:45:18+0000',
    //     productImages:
    //         'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg'),
    // Product(
    //     id: 5,
    //     productCategoryId: 3,
    //     name: 'Cool Side Cahir',
    //     producer: 'Tabla',
    //     description:
    //         'Simple geometry\r\nMinimalistic Side Table\r\nSleek x-shaped legs\r\nBase:BFTfree Laminate',
    //     cost: 880,
    //     rating: 2,
    //     viewCount: 5,
    //     created: '2015-08-31T13:57:41+0000',
    //     modified: '2015-09-03T04:45:18+0000',
    //     productImages:
    //         'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg'),
    // Product(
    //     id: 6,
    //     productCategoryId: 3,
    //     name: 'Luxurious Chair',
    //     producer: 'Tabla',
    //     description:
    //         'Simple geometry\r\nMinimalistic Side Table\r\nSleek x-shaped legs\r\nBase:BFTfree Laminate',
    //     cost: 880,
    //     rating: 2,
    //     viewCount: 5,
    //     created: '2015-08-31T13:57:41+0000',
    //     modified: '2015-09-03T04:45:18+0000',
    //     productImages:
    //         'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg'),
    // Product(
    //     id: 7,
    //     productCategoryId: 4,
    //     name: 'Cool Cupboard',
    //     producer: 'Tabla',
    //     description:
    //         'Simple geometry\r\nMinimalistic Side Table\r\nSleek x-shaped legs\r\nBase:BFTfree Laminate',
    //     cost: 880,
    //     rating: 2,
    //     viewCount: 5,
    //     created: '2015-08-31T13:57:41+0000',
    //     modified: '2015-09-03T04:45:18+0000',
    //     productImages:
    //         'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg'),
    // Product(
    //     id: 8,
    //     productCategoryId: 4,
    //     name: 'Wintage Cupboard',
    //     producer: 'Tabla',
    //     description:
    //         'Simple geometry\r\nMinimalistic Side Table\r\nSleek x-shaped legs\r\nBase:BFTfree Laminate',
    //     cost: 880,
    //     rating: 2,
    //     viewCount: 5,
    //     created: '2015-08-31T13:57:41+0000',
    //     modified: '2015-09-03T04:45:18+0000',
    //     productImages:
    //         'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg')
  ];

  Future<dynamic> getProducts(int productId) async {
    var responseJson;
    try {
      final response = await http.post(
        _baseUrl,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        },
        body: json.encode({
          'product_id': productId,
        }),
      );
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    print('response ${response.body.toString()}');
    var responseJson = json.decode(response.body.toString());
    switch (response.statusCode) {
      case 200:

        // print(responseJson);

        
        _items = ProductResponse.fromJson(responseJson).data;
          print('response fetch${items.length}');
        notifyListeners();
        return responseJson;
      case 400:
        throw BadRequestException(ProductResponse.fromJson(responseJson).userMsg);
      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());

      case 500:

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

   void setItems(List<Product> products){
     _items = products;
     notifyListeners();
   }
  List<Product> get items {
    return [..._items];
  }

  List<Product> getProductsByCategory(int categoryId) {
    return _items
        .where((item) => item.productCategoryId == categoryId)
        .toList();
  }

  Product findById(int id) {
    print(_items.length);
    return _items.firstWhere((product) => product.id == id);
  }

  String getCategoryName(int categoryId) {
    switch (categoryId) {
      case 1:
        return 'Table';
        break;

      case 2:
        return 'Sofa';
        break;

      case 3:
        return 'Chair';
        break;

      case 4:
        return 'Cupboard';
        break;

      default:
        return 'Table';
        break;
    }
  }
}
