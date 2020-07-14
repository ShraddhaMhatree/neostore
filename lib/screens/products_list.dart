import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:neostore/helpers/SizeConfig.dart';
import 'package:neostore/providers/product.dart';
import 'package:neostore/providers/product_provider.dart';
import 'package:neostore/screens/product_description_screen.dart';
import 'package:provider/provider.dart';

class ProductsList extends StatelessWidget {
  static final route = '/products-list';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final productData =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final productCategoryId = productData['category_id'];
    final productCategoryName = productData['category_name'];
    final productsList = Provider.of<ProductsProvider>(context).getProductsByCategory(productCategoryId);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          productCategoryName,
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
        child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 10),
            separatorBuilder: (BuildContext context, int index) => Divider(
                  height: 1,
                  color: Colors.grey.shade800,
                ),
            itemCount: productsList.length,
            itemBuilder: (ctx, i) => _productItem(productsList, i, context, productCategoryName)
            ),
      ),
    );
  }

  Widget _productItem(List<Product> data, int index, BuildContext context, String categoryName) {
    return InkWell(
      onTap: () {
       Navigator.of(context).pushNamed(ProductDescription.route,
        arguments: {'product_id': data[index].id, 'category_name': categoryName});
      },
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: SizeConfig.safeBlockVertical * 15,
              height: SizeConfig.safeBlockVertical * 15,
              margin: EdgeInsets.all(5),
               padding: const EdgeInsets.symmetric(vertical: 5),
              child: Image(
                image: NetworkImage(data[index].productImages),
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 8, left: 8),
                    child: Text(data[index].name,
                        style: TextStyle(fontSize: 18),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4, left: 8),
                    child: Text(data[index].producer,
                        style: TextStyle(fontSize: 13),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 18, left: 8, right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Text('Rs. ${data[index].cost}',
                              style: TextStyle(
                                  fontSize: 24, color: Colors.red),
                              softWrap: true,
                              overflow: TextOverflow.ellipsis),
                        ),
                        RatingBar(
                          initialRating: data[index].rating.toDouble(),
                          itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemSize: 16,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          unratedColor: Colors.grey.shade500,
                          onRatingUpdate: (rating) {
                            print(rating);

                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
