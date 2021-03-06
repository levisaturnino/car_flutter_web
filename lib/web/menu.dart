import 'package:backendflutterweb/app_model.dart';
import 'package:backendflutterweb/pages/carros.dart';
import 'package:backendflutterweb/pages/default.dart';
import 'package:backendflutterweb/pages/usuarios.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ItemMenu{
  String title;
  IconData icon;
  Widget page;

  bool selected = false;

  ItemMenu(this.title, this.icon, this.page);
}

class Menu extends StatefulWidget {
    @override
    _MenuState createState() => _MenuState();
  }

  class _MenuState extends State<Menu> {
    List<ItemMenu> menus = [];

  @override
  void initState() {
    super.initState();
    menus.add(ItemMenu("Home",FontAwesomeIcons.home,DefaultPage()));
    menus.add(ItemMenu("Carros",FontAwesomeIcons.car,CarrosPage()));
    menus.add(ItemMenu("usuários",FontAwesomeIcons.user,UsuariosPage()));
  }

    @override
    Widget build(BuildContext context) {
      return  ListView.builder(
          itemCount: menus.length,
          // ignore: missing_return
          itemBuilder: (context,index){
        ItemMenu item = menus[index];
       return _itemMenu(item);
      });
    }

    _itemMenu(ItemMenu item){

      return Material(
        color: item.selected ? Theme.of(context).hoverColor:Colors.transparent,
        child: InkWell(
          onTap: (){
          AppModel app = Provider.of<AppModel>(context,listen: false);
          app.push(item.page);
          setState(() {
            menus.forEach((element) { element.selected = false;});

            item.selected = true;
          });
          },
          child: ListTile(
            leading: Icon(item.icon),
            title: Text(item.title,style:TextStyle(fontWeight: item.selected  ? FontWeight.bold : FontWeight.normal),),
          ),
        ),
      );
    }
  }





























