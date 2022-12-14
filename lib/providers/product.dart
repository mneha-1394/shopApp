import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Product with ChangeNotifier {
  final  id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });
  void _seTFavValue(bool newValue){
 isFavorite=newValue;    
      notifyListeners();   
  }

 Future<void> toggleFavoriteStatus() async {
    final oldStatus=isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
     final url = Uri.https('shoppapp-b9567-default-rtdb.firebaseio.com', '/products/$id.json');
    try{
 final response=await http.patch(url,body:json.encode({
      'isFavorite':isFavorite,
    }));
    if(response.statusCode>=400){
    _seTFavValue(oldStatus); 
    }
    }catch(error){
      _seTFavValue(oldStatus); 
    }
   
  }
}