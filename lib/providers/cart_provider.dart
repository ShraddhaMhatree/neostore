import 'package:flutter/cupertino.dart';
import 'package:neostore/providers/cart.dart';
import 'package:neostore/providers/product.dart';
import 'package:neostore/screens/my_cart_screen.dart';
import 'package:provider/provider.dart';


class CartProdvider with ChangeNotifier{
 List<Cart> _items =  [];

 List<Cart> get items {
   
    return [..._items];
  }

  Future<void> addToCart (Product product , int quantity) async{
     Cart cart = Cart(id: DateTime.now().toString(), productId: product.id, quantity: quantity, product: product);
    _items.add(cart);
     print('${product.name}  $quantity');
     notifyListeners();
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((cartItem) {
      total += cartItem.quantity * cartItem.product.cost;
    });
    return total;
  }

void removeItem(String id){
  _items.removeWhere((item) => 
    item.id == id
    );
    notifyListeners();
}
  

  
}