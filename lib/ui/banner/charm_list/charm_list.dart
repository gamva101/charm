import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:instagram_flutter/data/charm_bloc.dart';
import 'package:instagram_flutter/data/charm_data_provider.dart';
import 'package:instagram_flutter/data/charm_model.dart';
import 'package:instagram_flutter/data/repository.dart';
import 'package:instagram_flutter/ui/banner/second/second.dart';

class CharmList extends StatefulWidget {
  CharmList();

  @override
  State<StatefulWidget> createState() => _CharmListState();
}

class _CharmListState extends State<CharmList> {
  final CharmBloc _charmBloc = CharmBloc(CharmRepository(CharmDataProvider()));

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return _createCharmList(snapshot.data);
        },
        stream: _charmBloc.charmListStream);
  }

  Widget _createCharmList(List<CharmModel> _charmList) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          CharmModel charmModel = _charmList[index];
          bool isFavorite = charmModel.getIsFavorite();
          if (isFavorite) {}
          return ListTile(
              title: Text(charmModel.getName()),
              leading: Image.asset(charmModel.getImagePath()),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SecondRoute(charmModel: _charmList[index]))),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {
                        //change
                        charmModel.setIsFavorite(!charmModel.getIsFavorite());
                        print('onPressed ' +
                            charmModel.getIsFavorite().toString());
                        _charmBloc.updateCharmList(_charmList);
                      },
                      icon: Icon(Icons.favorite,
                          color: charmModel.getIsFavorite()
                              ? Colors.red
                              : Colors.grey)),
                ],
              ));
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            thickness: 8.0,
            height: 8.0,
            color: Colors.transparent,
          );
        },
        itemCount: _charmList.length);
  }
}
