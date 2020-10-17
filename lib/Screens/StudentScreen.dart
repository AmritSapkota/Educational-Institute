import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentScreen extends StatelessWidget {
  Padding _post(Size size) {
    return Padding(
      padding: EdgeInsets.all(size.height * size.width * 0.00006),
      child: Container(
        //if we use boxdecor we cannot use color property outside boxdecor
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(size.width * 0.05)),
        ),
        constraints: BoxConstraints(
          minHeight: size.height * 0.3,
          minWidth: size.width,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        endDrawer: Drawer(
          child: ListView(children: <Widget>[
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Checkout'),
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              leading: Icon(Icons.report),
              title: Text('Transactions'),
              onTap: () {
                Navigator.pushNamed(context, '/transactionsList');
              },
            ),
          ]),
        ),
        appBar: AppBar(
          title: Row(
            children: [
              Icon(
                Icons.school,
                size: size.height * 0.03 * size.width * 0.004,
                color: Colors.white,
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.03),
                child: Text(
                  'Educational Institute',
                  style: TextStyle(
                    fontSize: size.height * 0.01 * size.width * 0.004,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              minHeight: size.height,
              maxHeight: double.infinity,
              minWidth: size.width,
              maxWidth: size.width,
            ),
            decoration: BoxDecoration(
              color: Colors.blue[300],
            ),
            child: Column(
              children: [
                _post(size),
                _post(size),
                _post(size),
                _post(size),
                _post(size),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
