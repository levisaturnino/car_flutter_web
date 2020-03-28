import 'package:backendflutterweb/app_model.dart';
import 'package:backendflutterweb/pages/carro.dart';
import 'package:backendflutterweb/pages/carros/carros_api.dart';
import 'package:backendflutterweb/utils/nav.dart';
import 'package:backendflutterweb/web/web_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'carros/carro.dart';

class CarrosPage extends StatefulWidget {
  @override
  _CarrosPageState createState() => _CarrosPageState();
}

class _CarrosPageState extends State<CarrosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Carro>>(
        future: CarrosApi.getCarros(context),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator(),);
          }
          List<Carro> carros = snapshot.data;
          return _listView(carros);
        },
      ),
    );
  }

  _listView(List<Carro> carros) {
    return GridView.builder(
        itemCount: carros.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 1.5
        ),
        itemBuilder: (context, index){
          Carro carro = carros[index];
          return LayoutBuilder(
            builder: (context,constraints) {
              double fontSize = size(
                  constraints.maxWidth * 0.1, min: 10, max: Theme
                  .of(context)
                  .textTheme
                  .body1.fontSize);
              return InkWell(
                onTap: () => _onClickCarro(carro),
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ConstrainedBox(
                        constraints: BoxConstraints(
                         //   maxWidth: 200
                        ),
                        child: Container(
                          child: Image.network(
                              carro.urlFoto ?? "http://www.livroandroid.com.br/livro/carros/esportivos/Renault_Megane_Trophy.png"),
                        ),
                      ),
                      Text(  carro.nome,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: fontSize),)
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
  _onClickCarro(Carro carro) {
    AppModel appModel = Provider.of<AppModel>(context);
    appModel.push(CarroPage(carro));
}
}


