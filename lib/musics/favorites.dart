import 'package:flutter/material.dart';
class Music_oprations extends ChangeNotifier {
  List _pictures = [];

  List get picture => _pictures;
  List _names = [];

  List get name => _names;

  void pictureMusic(String song) {
    if(_pictures.contains(song)){
      _pictures.remove(song);
    }
    else{
      _pictures.add(song);
    }
    notifyListeners();
  }
  void nameMusic(String titles){
    if(_names.contains(titles)){
      _names.remove(titles);
    }
    else{
      _names.add(titles);
    }
    notifyListeners();
  }
  bool colorChange(String picaddress){
    final colcod=_pictures.contains(picaddress);
    print(colcod);
    return colcod;
  }



}