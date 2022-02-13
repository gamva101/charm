import 'dart:async';

import 'package:instagram_flutter/data/charm_model.dart';
import 'package:instagram_flutter/data/repository.dart';

class CharmBloc {
  final CharmRepository _charmRepository;
  final StreamController<List<CharmModel>> _charmController =
      StreamController<List<CharmModel>>.broadcast();

  get charmListStream => _charmController.stream;

  CharmBloc(this._charmRepository) {
    getCharmList();
  }

  void getCharmList() async {
    List<CharmModel> charmList = await _charmRepository.getCharmList();
    _charmController.sink.add(charmList);
  }

  void updateCharmList(List<CharmModel> charmList) async {
    await _charmRepository.updateCharmList(charmList);
    getCharmList();
  }
}
