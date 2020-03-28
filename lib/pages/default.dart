import 'package:backendflutterweb/web/web_utils.dart';
import 'package:flutter/material.dart';

class DefaultPage extends StatefulWidget {
  @override
  _DefaultPageState createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return GridView.builder(
      itemCount: 100,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1.5
        ),
        itemBuilder: (context, index){
        return LayoutBuilder(
          builder: (context,constraints) {
            double fontSize = size(
                constraints.maxWidth * 0.1, min: 10, max: Theme
                .of(context)
                .textTheme
                .body1.fontSize);
            return Card(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 200
                    ),
                    child: Container(
                      child: Image.network(
                          "http://www.livroandroid.com.br/livro/carros/esportivos/Renault_Megane_Trophy.png"),
                    ),
                  ),
                  Text("Renault Megane Trophy",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: fontSize),)
                ],
              ),
            );
          },
        );
        });
  }
}




















