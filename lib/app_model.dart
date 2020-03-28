import 'package:backendflutterweb/pages/carros/carros_page.dart';
import 'package:backendflutterweb/pages/default.dart';
import 'package:flutter/material.dart';

class AppModel extends ChangeNotifier{
   List<Widget> pages = [];
Widget defaultPage = DefaultPage();
  AppModel(){
    pages.add(defaultPage);
  }
  push(Widget page,{bool replace = false}){
    if(replace){
      this.pages.clear();
    }
    this.pages.add(page);
    notifyListeners();
  }

  void pop(){
    this.pages.removeLast();
    notifyListeners();
  }

   void popAll(){
     this.pages.clear();
     pages.add(defaultPage);
     notifyListeners();

   }

   void popTo(int index){
     pages.removeRange(index+1, pages.length);
     notifyListeners();

   }
}