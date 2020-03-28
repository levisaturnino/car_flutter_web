import 'package:flutter/material.dart';

import 'carros/carro.dart';

class CarroPage extends StatelessWidget {
  
  Carro carro;
  CarroPage(this.carro);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(carro.nome),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: 200
              ),
              child: Container(
                child: Image.network(
                    carro.urlFoto ?? "http://www.livroandroid.com.br/livro/carros/esportivos/Renault_Megane_Trophy.png"),
              ),
            ),
            Text(  carro.nome,
              overflow: TextOverflow.ellipsis,)
          ],
        ),
      ),
    );
  }
}
