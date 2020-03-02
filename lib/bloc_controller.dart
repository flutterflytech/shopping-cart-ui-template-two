import 'dart:async';

import 'package:shopping_ui/future_api.dart';

import 'bloc.dart';

class ControllerBloc implements Bloc {
  final StreamController _jsonListController = StreamController();

  Stream get dataList => _jsonListController.stream;

  getData() async {
    Repository repository = Repository();
    List data = await repository.fetchData();
    _jsonListController.sink.add(data);
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
