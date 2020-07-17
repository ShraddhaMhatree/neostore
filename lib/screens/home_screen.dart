import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:neostore/helpers/NavigatorUtils.dart';
import 'package:neostore/helpers/SizeConfig.dart';
import 'package:neostore/screens/products_list.dart';
import 'package:neostore/widgets/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  static final route = '/home';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NeoSTORE',
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
      drawer: AppDrawer(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: SizeConfig.safeBlockVertical * 34,
              width: SizeConfig.safeBlockHorizontal * 100,
              child: Carousel(
                  dotColor: Colors.red,
                  dotBgColor: Colors.transparent,
                  dotIncreasedColor: Colors.grey.shade800,
                  noRadiusForIndicator: true,
                  indicatorBgPadding: 5,
                  dotSize: 7,
                  images: [
                    NetworkImage(
                        'https://cdn.pixabay.com/photo/2018/07/10/21/23/pancake-3529653_1280.jpg'),
                    NetworkImage(
                        'https://cdn.pixabay.com/photo/2014/08/07/21/07/souffle-412785_1280.jpg'),
                    NetworkImage(
                        'https://cdn.pixabay.com/photo/2018/04/09/18/26/asparagus-3304997_1280.jpg'),
                    NetworkImage(
                        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg'),
                  ]),
            ),
            Expanded(
              child: Container(
                child: CategoryGrid(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3),
      crossAxisSpacing: SizeConfig.safeBlockHorizontal * 3,
      mainAxisSpacing: SizeConfig.safeBlockHorizontal * 3,
      children: <Widget>[
        InkWell(
          onTap: () {
            // Navigator.of(context).pushNamed(ProductsList.route,
            //     arguments: {'category_id': 1, 'category_name': 'Tables'});
            NavigatorUtils.goToProductListPage(context, 1, 'Tables');
          },
          child: Container(
            color: Colors.red.shade600,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 5),
                    child: Text('Tables',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                        ))),
                Row(
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3),
                      child: Icon(
                        Icons.table_chart,
                        color: Colors.white,
                        size: SizeConfig.safeBlockHorizontal * 20,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            // Navigator.of(context).pushNamed(ProductsList.route,
            //     arguments: {'category_id': 2, 'category_name': 'Sofas'});
            NavigatorUtils.goToProductListPage(context, 2, 'Sofas');
          },
          child: Container(
            color: Colors.red.shade600,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 5),
                  child: Icon(
                    Icons.weekend,
                    color: Colors.white,
                    size: SizeConfig.safeBlockHorizontal * 20,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                        padding:
                            EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3),
                        child: Text('Sofas',
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                            )))
                  ],
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            // Navigator.of(context).pushNamed(ProductsList.route,
            //     arguments: {'category_id': 3, 'category_name': 'Chairs'});
            NavigatorUtils.goToProductListPage(context, 3, 'Chairs');
          },
          child: Container(
            color: Colors.red.shade600,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 5),
                    child: Text('Chairs',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                        ))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3),
                      child: Icon(
                        Icons.event_seat,
                        color: Colors.white,
                        size: SizeConfig.safeBlockHorizontal * 20,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            // Navigator.of(context).pushNamed(ProductsList.route,
            //     arguments: {'category_id': 4, 'category_name': 'Cupboards'});
            NavigatorUtils.goToProductListPage(context, 4, 'Cupboards');
          },
          child: Container(
            color: Colors.red.shade600,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 5),
                  child: Icon(
                    Icons.kitchen,
                    color: Colors.white,
                    size: SizeConfig.safeBlockHorizontal * 20,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                        padding:
                            EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3),
                        child: Text('Cupboards',
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                            )))
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
