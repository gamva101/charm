import 'package:flutter/services.dart';
import 'dart:convert';
import 'charm_model.dart';

class CharmDataProvider {
  List<CharmModel>? _charmList;

  Future<List<CharmModel>> getCharmList() async {
    if (_charmList == null) {
      String jsonData = await rootBundle.loadString('json/charm_data.json');
      Iterable charmList = jsonDecode(jsonData);
      List<CharmModel> models = List<CharmModel>.from(
          charmList.map((model) => CharmModel.fromJSon(model)));
      _charmList = models;
      return _charmList!;
    } else {
      return _charmList!;
    }
  }

  Future<int> updateCharmList(List<CharmModel> charmList) async {
    _charmList = charmList;
    return 0;
  }
}
