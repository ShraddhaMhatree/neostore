import 'package:flutter/material.dart';
import 'package:neostore/providers/product.dart';

class ProductsProvider with ChangeNotifier{
  List<Product> _items = [

    Product(
      id: 1 ,
      productCategoryId: 1,
      name: 'Cool Side Table',
      producer: 'Tabla',
      description: 'Simple geometry\r\nMinimalistic Side Table\r\nSleek x-shaped legs\r\nBase:BFTfree Laminate',
      cost: 880,
      rating: 2,
      viewCount: 5 ,
      created: '2015-08-31T13:57:41+0000',
      modified: '2015-09-03T04:45:18+0000',
      productImages: 'https://cdn.pixabay.com/photo/2018/07/10/21/23/pancake-3529653_1280.jpg'
    ),
    Product(
      id: 2 ,
      productCategoryId: 1,
      name: 'Cool Center Table',
      producer: 'Tabla',
      description: 'Simple geometry\r\nMinimalistic Side Table\r\nSleek x-shaped legs\r\nBase:BFTfree Laminate',
      cost: 880,
      rating: 2,
      viewCount: 5 ,
      created: '2015-08-31T13:57:41+0000',
      modified: '2015-09-03T04:45:18+0000',
      productImages: 'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg'
    ),

    Product(
      id: 3 ,
      productCategoryId: 2,
      name: 'Cool Sofa',
      producer: 'Tabla',
      description: 'Simple geometry\r\nMinimalistic Side Table\r\nSleek x-shaped legs\r\nBase:BFTfree Laminate',
      cost: 880,
      rating: 2,
      viewCount: 5 ,
      created: '2015-08-31T13:57:41+0000',
      modified: '2015-09-03T04:45:18+0000',
      productImages: 'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg'
    ),

    Product(
      id: 4 ,
      productCategoryId: 2,
      name: 'Royal Sofa',
      producer: 'Tabla',
      description: 'Simple geometry\r\nMinimalistic Side Table\r\nSleek x-shaped legs\r\nBase:BFTfree Laminate',
      cost: 880,
      rating: 2,
      viewCount: 5 ,
      created: '2015-08-31T13:57:41+0000',
      modified: '2015-09-03T04:45:18+0000',
      productImages: 'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg'
    ),

    Product(
      id: 5 ,
      productCategoryId: 3,
      name: 'Cool Side Cahir',
      producer: 'Tabla',
      description: 'Simple geometry\r\nMinimalistic Side Table\r\nSleek x-shaped legs\r\nBase:BFTfree Laminate',
      cost: 880,
      rating: 2,
      viewCount: 5 ,
      created: '2015-08-31T13:57:41+0000',
      modified: '2015-09-03T04:45:18+0000',
      productImages: 'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg'
    ),
    Product(
      id: 6 ,
      productCategoryId: 3,
      name: 'Luxurious Chair',
      producer: 'Tabla',
      description: 'Simple geometry\r\nMinimalistic Side Table\r\nSleek x-shaped legs\r\nBase:BFTfree Laminate',
      cost: 880,
      rating: 2,
      viewCount: 5 ,
      created: '2015-08-31T13:57:41+0000',
      modified: '2015-09-03T04:45:18+0000',
      productImages: 'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg'
    ),

    Product(
      id: 7 ,
      productCategoryId: 4,
      name: 'Cool Cupboard',
      producer: 'Tabla',
      description: 'Simple geometry\r\nMinimalistic Side Table\r\nSleek x-shaped legs\r\nBase:BFTfree Laminate',
      cost: 880,
      rating: 2,
      viewCount: 5 ,
      created: '2015-08-31T13:57:41+0000',
      modified: '2015-09-03T04:45:18+0000',
      productImages: 'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg'
    ),

    Product(
      id: 8 ,
      productCategoryId: 4,
      name: 'Wintage Cupboard',
      producer: 'Tabla',
      description: 'Simple geometry\r\nMinimalistic Side Table\r\nSleek x-shaped legs\r\nBase:BFTfree Laminate',
      cost: 880,
      rating: 2,
      viewCount: 5 ,
      created: '2015-08-31T13:57:41+0000',
      modified: '2015-09-03T04:45:18+0000',
      productImages: 'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg'
    )
  ];

  List<Product> get items {
   
    return [..._items];
  }

  List<Product> getProductsByCategory(int categoryId){
    return _items.where((item) => 
       item.productCategoryId == categoryId
       ).toList();
  }


  Product findById(int id) {
    return _items.firstWhere((product) => product.id == id);
  }

  
}