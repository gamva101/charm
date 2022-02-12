import 'package:flutter/services.dart';
import 'dart:convert';
import 'charm_model.dart';

class CharmDataProvider {
  String? _jsonData;

  Future<String> fetchData() async {
    //get data json and image from path
    if (_jsonData == null) {
      return _jsonData = await rootBundle.loadString('json/charm_data.json');
    } else {
      return _jsonData!;
    }
  }

  Future<List<CharmModel>> getCharmList() async {
    String jsonData = await fetchData();
    Iterable charmList = jsonDecode(jsonData);
    List<CharmModel> models = List<CharmModel>.from(
        charmList.map((model) => CharmModel.fromJSon(model)));
    return models;
  }
}
