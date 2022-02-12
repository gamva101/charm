import 'package:instagram_flutter/data/charm_data_provider.dart';
import 'package:instagram_flutter/data/charm_model.dart';

class CharmRepository {
  final CharmDataProvider _charmDataProvider;

  CharmRepository(this._charmDataProvider);

  Future<List<CharmModel>> getCharmList() => _charmDataProvider.getCharmList();
}
