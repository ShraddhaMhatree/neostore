import 'package:flutter/material.dart';
import 'package:neostore/helpers/SizeConfig.dart';
import 'package:neostore/providers/cart.dart';
import 'package:neostore/providers/cart_provider.dart';
import 'package:neostore/providers/product_provider.dart';
import 'package:provider/provider.dart';

class MyCart extends StatefulWidget {
  static final route = '/my-cart';
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  String _chosenQty ;
  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartProdvider>(context);
    final cartList = cartData.items;
    final product = Provider.of<ProductsProvider>(context);

    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'My Cart',
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: ListView.builder(
                    itemCount: cartList.length,
                    itemBuilder: (ctx, index) => Column(
                          children: <Widget>[
                            _cartItem(
                                cartList[index],
                                product.getCategoryName(
                                    cartList[index].product.productCategoryId),
                                cartData),
                          ],
                        )),
              ),
            ),
            Container(
              height: SizeConfig.safeBlockVertical * 5,
              width: SizeConfig.safeBlockHorizontal * 100,
              margin: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('TOTAL',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis),
                  Text('Rs. ${cartData.totalAmount}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            Divider(
              color: Colors.grey.shade800,
            ),
            Container(
              height: SizeConfig.safeBlockVertical * 8,
              width: SizeConfig.safeBlockHorizontal * 100,
              margin: EdgeInsets.all(20),
              child: RaisedButton(
                child: Text(
                  'ORDER NOW',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
                onPressed: () {},
                color: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Dismissible _cartItem(Cart cart, String category, CartProdvider cartData) {
    _chosenQty = '';
    return Dismissible(
      key: ValueKey(cart.id),
      direction: DismissDirection.endToStart,
      background: Container(
        child: CircleAvatar(
          radius: SizeConfig.safeBlockHorizontal * 5 ,
          backgroundColor: Colors.red,
          child: Icon(
            Icons.delete,
            color: Colors.white,
            size: SizeConfig.safeBlockHorizontal * 5,
          ),
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text(
              'Do you want to remove the item from the cart?',
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
              ),
              FlatButton(
                child: Text('Yes'),
                onPressed: () {
                  Navigator.of(ctx).pop(true);
                },
              ),
            ],
          ),
        );
      },
      onDismissed: (direction) {
        cartData.removeItem(cart.id);
      },
      child: Container(
        child: Column(children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: SizeConfig.safeBlockVertical * 12,
                height: SizeConfig.safeBlockVertical * 12,
                margin: EdgeInsets.all(15),
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Image(
                  image: NetworkImage(cart.product.productImages),
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(cart.product.name,
                          style: TextStyle(fontSize: 22),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis),
                    ),
                    Container(
                      child: Text('($category)',
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey.shade500),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 2, right: 15, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                              child: DropdownButton<String>(
                                  value: _getProductQuantity(
                                      cart.quantity.toString()),
                                  items: <String>[
                                    '1',
                                    '2',
                                    '3',
                                    '4',
                                    '5',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String value) {
                                    setState(() {
                                      _setProductQuantity(value);
                                      print(value);
                                    });
                                  })),
                          Container(
                            // margin: EdgeInsets.only(right: 15),
                            child: Text('Rs.${cart.product.cost}',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey.shade500),
                                softWrap: true,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Divider(
            color: Colors.grey.shade800,
          )
        ]),
      ),
    );
  }

  String _getProductQuantity(String qty) {
    if (_chosenQty.isEmpty) {
      _chosenQty = qty.toString();
    } 
    // else {
    //   _chosenQty = '1';
    // }
    print(_chosenQty);
    return _chosenQty;
  }

  void _setProductQuantity(String value) {
    _chosenQty = value;
  }
}
