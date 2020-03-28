import 'package:backendflutterweb/web/body.dart';
import 'package:backendflutterweb/web/header.dart';
import 'package:backendflutterweb/web/menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_model.dart';
import 'constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Size get size  => MediaQuery.of(context).size;
  bool get showMenu => size.width > 500;
  bool get shoDrawer => size.width <= pageWidth;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:Column(
        children: <Widget>[
          _header(),
          _body(),
        ],
      )
    );
  }

  _header(){
    return Container(
      padding: EdgeInsets.all(16),
      width: size.width,
      height: headerHeight,
      color: Colors.blue,
      child:Header(),
    );
  }

  _body() {
    return Container(
      width: size.width,
      height: size.height - headerHeight,
      child: showMenu?
        Row(
      children: <Widget>[
      _menu(),
        _right(),
      ],
    ): _right(),
    );
  }

  _menu(){
    return Container(
      width: menuWidth,
      color: Colors.grey[100],
      child:Menu(),
    );
  }

  _right(){

    return Container(
      width: showMenu ? size.width - menuWidth:size.width,
      child: Body(),
    );
  }
}
