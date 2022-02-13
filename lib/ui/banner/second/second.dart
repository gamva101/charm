import 'package:flutter/material.dart';
import 'package:instagram_flutter/data/charm_model.dart';

class SecondRoute extends StatelessWidget {
  final CharmModel charmModel;
  SecondRoute({required this.charmModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Second route ' + charmModel.getName()),
        ),
        body: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              ListTile(
                  title: Text(charmModel.getName()),
                  subtitle: Text('charm description', style: TextStyle())),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                  style: TextStyle(),
                ),
              ),
              Image.asset(charmModel.getImagePath()),
            ],
          ),
        ));
  }
}
