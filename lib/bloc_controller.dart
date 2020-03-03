import 'dart:async';

import 'package:shopping_ui/future_api.dart';

import 'bloc.dart';
import 'data_json.dart';
import 'home_page.dart';

class ControllerBloc implements Bloc {
  final StreamController _jsonListController = StreamController();
  final StreamController _itemCountController = StreamController();
  final StreamController _cartItemController = StreamController();

  Stream get dataList => _jsonListController.stream;
  Stream get itemCountControl => _itemCountController.stream;
  Stream get cartItemControl => _cartItemController.stream;

  getData() async {
    Repository repository = Repository();
    List data = await repository.fetchData();
    _jsonListController.sink.add(data);
  }





  addCartItem(cartData) async{
    _cartItemController.sink.add(cartData);
  }


  removeCartItem(cartData) async{
    _cartItemController.sink.add(cartData);
  }








  int counter = 1;


  incrementCounter() {
    counter++;
    _itemCountController.sink.add(counter);
  }

  decrementCounter() {
    if(counter>1)
      counter--;
    _itemCountController.sink.add(counter);

  }










  @override
  void dispose() async {
 await _jsonListController.close();
 await _itemCountController.close();
 await _cartItemController.close();
  }
}
