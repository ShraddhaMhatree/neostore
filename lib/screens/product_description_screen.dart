import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:neostore/helpers/SizeConfig.dart';
import 'package:neostore/models/product_model.dart';
import 'package:neostore/providers/product_provider.dart';
import 'package:neostore/widgets/add_to_cart_dialog.dart';
import 'package:neostore/widgets/rating_dialog.dart';
import 'package:provider/provider.dart';

class ProductDescription extends StatefulWidget {
  static final route = '/products-description';
  @override
  _ProductDescriptionState createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  final images = [
    'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg'
  ];
  var imageUrl = '';
  @override
  Widget build(BuildContext context) {
    final productData =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final productId = productData['product_id'];
    final productCategoryName = productData['category_name'];
    final product = Provider.of<ProductsProvider>(context).findById(productId);

    SizeConfig().init(context);
    return Scaffold(
       resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          product.name,
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
        child: Container(
          color: Colors.grey[300],
          width: SizeConfig.safeBlockHorizontal * 100,
          height: SizeConfig.safeBlockVertical * 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _headerSection(product, productCategoryName),
              _bodySection(product),
              Expanded(child: _footerSection(product))
            ],
          ),
        ),
      ),
    );
  }

  Container _footerSection(Product product) {
    return Container(
      color: Colors.white,
      width: SizeConfig.safeBlockHorizontal * 100,
      height: SizeConfig.safeBlockVertical * 12,
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.amber,
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: SizedBox.expand(
                child: RaisedButton(
                  child: Text(
                    'BUY NOW',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (ctx) => AddToCartDialog(product: product));
                  },
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: SizedBox.expand(
                child: RaisedButton(
                  child: Text(
                    'RATE',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (ctx) => RatingDialog(product: product));
                  },
                  color: Colors.grey.shade500,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _bodySection(Product product) {
    return Container(
      margin: EdgeInsets.all(15),
      width: SizeConfig.safeBlockHorizontal * 100,
      height: SizeConfig.safeBlockVertical * 65,
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Text('Rs. ${product.cost}',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                    softWrap: true,
                    overflow: TextOverflow.ellipsis),
              ),
              Icon(
                Icons.share,
                color: Colors.grey.shade500,
              )
            ],
          ),
          Container(
              margin: EdgeInsets.only(top: 8),
              width: SizeConfig.safeBlockHorizontal * 70,
              height: SizeConfig.safeBlockVertical * 30,
              child: Image.network(
                getImageUrl(),
                fit: BoxFit.fill,
              )),
          Container(
              margin: EdgeInsets.only(top: 8, left: 8, right: 8),
              height: SizeConfig.safeBlockVertical * 15,
              child: GridView.count(
                crossAxisCount: 1,
                scrollDirection: Axis.horizontal,
                children: List.generate(
                    images.length,
                    (index) => InkWell(
                          onTap: () {
                            setImageUrl(index);
                          },
                          child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 4),
                              child: Image.network(
                                images[index],
                                fit: BoxFit.fill,
                              )),
                        )),
              )),
          Container(
            width: SizeConfig.safeBlockHorizontal * 100,
            height: 1,
            margin: EdgeInsets.only(top: 25),
            color: Colors.grey.shade400,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Description',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    'Description ddgnndflg lkb dflkhdfl ccklbgdlhkflm lkclgkglkk mmkkglldfkkb  slkgnsdlgknlbnkdmgdlfhkndfhncn clknndflhkjgl khdflhknndfhlknl kkbnlhlfbnn ndfl sdjgdhkg lxkgdlkkbbhh knnbldfkgdl  lknnlkhdflbl ldfkkhgh ',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  String getImageUrl() {
    if (imageUrl.isEmpty) {
      return images[0];
    } else {
      return imageUrl;
    }
  }

  void setImageUrl(int index) {
    setState(() {
      imageUrl = images[index];
    });
  }

  Container _headerSection(Product product, productCategoryName) {
    return Container(
      width: SizeConfig.safeBlockHorizontal * 100,
      height: SizeConfig.safeBlockVertical * 13,
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(2),
              child: Text(
                product.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          Padding(
              padding: EdgeInsets.all(2),
              child: Text('Category - $productCategoryName',
                  style: TextStyle(
                    fontSize: 16,
                  ))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(2),
                  child: Text(product.producer,
                      style: TextStyle(
                        fontSize: 14,
                      ))),
              RatingBar(
                  initialRating: product.rating.toDouble(),
                  itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                  direction: Axis.horizontal,
                  itemCount: 5,
                  itemSize: 16,
                  itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                  unratedColor: Colors.grey.shade500,
                  onRatingUpdate: null)
            ],
          )
        ],
      ),
    );
  }
}
