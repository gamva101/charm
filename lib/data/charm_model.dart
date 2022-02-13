class CharmModel {
  String _name;
  String _imagePath;
  bool _isFavorite = false;

  CharmModel(this._name, this._imagePath, this._isFavorite);

  String getName() => _name;
  String getImagePath() => _imagePath;
  bool getIsFavorite() => _isFavorite;
  void setIsFavorite(bool value) {
    _isFavorite = value;
  }

  CharmModel.fromJSon(Map<String, dynamic> json)
      : _name = json['name'],
        _imagePath = json['imagePath'],
        _isFavorite = json['isFavorite'];

  Map<String, dynamic> toJson() =>
      {'name': _name, 'imagePath': _imagePath, 'isFavorite': _isFavorite};
}
