import 'package:flutter/material.dart';
import 'package:bk_app/services/auth.dart';

class CustomScaffold {
  static Widget setDrawer(context) {
    return Drawer(
        child: ListView(children: <Widget>[
      ListTile(
        leading: Icon(Icons.home),
        title: Text("Home"),
        onTap: () => Navigator.of(context).pushNamed("/mainForm"),
      ),
      ListTile(
        leading: Icon(Icons.shopping_cart),
        title: Text('Items'),
        onTap: () => Navigator.of(context).pushNamed("/itemList"),
      ),
      ListTile(
        leading: Icon(Icons.card_travel),
        title: Text('Transactions'),
        onTap: () => Navigator.of(context).pushNamed("/transactionList"),
      ),
      ListTile(
        leading: Icon(Icons.person),
        title: Text('logout'),
        onTap: () async {
          await AuthService().signOut();
        },
      ),
    ]));
  }

  static Widget setAppBar(title) {
    return AppBar(
      title: Text(title),
    );
  }

  static Widget setScaffold(BuildContext context, String title, var getBody,
      {appBar = setAppBar}) {
    return Scaffold(
      appBar: appBar(title),
      drawer: setDrawer(context),
      body: getBody(context),
    ); // Scaffold
  }
} // Custom Scaffold
