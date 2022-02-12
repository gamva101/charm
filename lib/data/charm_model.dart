class CharmModel {
  String _name;
  String _imagePath;

  CharmModel(this._name, this._imagePath);

  String getName() => _name;
  String getImagePath() => _imagePath;

  CharmModel.fromJSon(Map<String, dynamic> json)
      : _name = json['name'],
        _imagePath = json['imagePath'];

  Map<String, dynamic> toJson() => {'name': _name, 'imagePath': _imagePath};
}
