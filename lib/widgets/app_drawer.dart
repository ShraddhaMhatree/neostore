import 'package:flutter/material.dart';
import 'package:neostore/helpers/SizeConfig.dart';
import 'package:neostore/screens/products_list.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Drawer(
      child: Container(
          color: Colors.grey.shade900,
          child: Column(
            children: <Widget>[
              SideNavAccountDetails(),
              SideNavMenuList(),
            ],
          )),
    );
  }
}

class SideNavAccountDetails extends StatelessWidget {
  const SideNavAccountDetails({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // color: Colors.red,
        height: SizeConfig.safeBlockVertical * 30,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: SizeConfig.safeBlockHorizontal * 12,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: SizeConfig.safeBlockHorizontal * 11.5,
                child: Icon(
                  Icons.person,
                  size: SizeConfig.safeBlockHorizontal * 10,
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 2,
            ),
            Text(
              'Shraddha Mhatre',
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              'abc@gmail.com',
              style: Theme.of(context).textTheme.headline6,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Divider(color: Colors.white),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SideNavMenuList extends StatelessWidget {
  const SideNavMenuList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            title: Text(
              'My Cart',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(color: Colors.black87),
          ListTile(
            leading: Icon(
              Icons.table_chart,
              color: Colors.white,
            ),
            title: Text(
              'Tables',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.of(context).popAndPushNamed(ProductsList.route,
                  arguments: {'category_id': 1, 'category_name': 'Tables'});
            },
          ),
          Divider(color: Colors.black87),
          ListTile(
            leading: Icon(
              Icons.weekend,
              color: Colors.white,
            ),
            title: Text(
              'Sofas',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.of(context).popAndPushNamed(ProductsList.route,
                  arguments: {'category_id': 2, 'category_name': 'Sofas'});
            },
          ),
          Divider(color: Colors.black87),
          ListTile(
            leading: Icon(
              Icons.event_seat,
              color: Colors.white,
            ),
            title: Text(
              'Chairs',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.of(context).popAndPushNamed(ProductsList.route,
                  arguments: {'category_id': 3, 'category_name': 'Chairs'});
            },
          ),
          Divider(color: Colors.black87),
          ListTile(
              leading: Icon(
                Icons.kitchen,
                color: Colors.white,
              ),
              title: Text(
                'Cupboards',
                style: Theme.of(context).textTheme.headline6,
              ),
              onTap: () {
                Navigator.of(context).popAndPushNamed(ProductsList.route,
                    arguments: {
                      'category_id': 4,
                      'category_name': 'Cupboards'
                    });
              }),
          Divider(color: Colors.black87),
          ListTile(
            leading: Icon(
              Icons.person,
              color: Colors.white,
            ),
            title: Text(
              'MyAccount',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.of(context).popAndPushNamed('/');
            },
          ),
          Divider(color: Colors.black87),
          ListTile(
            leading: Icon(
              Icons.add_location,
              color: Colors.white,
            ),
            title: Text(
              'Store Locator',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.of(context).popAndPushNamed('/');
            },
          ),
          Divider(color: Colors.black87),
          ListTile(
            leading: Icon(
              Icons.note_add,
              color: Colors.white,
            ),
            title: Text(
              'My Orders',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.of(context).popAndPushNamed('/');
            },
          ),
          Divider(color: Colors.black87),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            title: Text(
              'Logout',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.of(context).popAndPushNamed('/');
            },
          ),
        ],
      ),
    );
  }
}
