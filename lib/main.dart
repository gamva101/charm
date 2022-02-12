import 'package:flutter/material.dart';
import 'package:instagram_flutter/data/charm_data_provider.dart';
import 'package:instagram_flutter/data/charm_model.dart';
import 'package:instagram_flutter/data/repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Test app demo',
        theme: ThemeData.dark(),
        home: HomeWidget());
  }
}

class HomeWidget extends StatefulWidget {
  final List<String> list = List.generate(20, (index) => "Text to $index");

  @override
  HomeWidgetState createState() => HomeWidgetState();
}

class HomeWidgetState extends State<HomeWidget> {
  static final CharmDataProvider _charmDataProvider = CharmDataProvider();
  final CharmRepository _charmRepository = CharmRepository(_charmDataProvider);

  @override
  Widget build(BuildContext context) {
    CharmRepository _charmRepository = CharmRepository(_charmDataProvider);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('AppBar'),
        ),
        body: FutureBuilder(
            future: _fetch(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return _createCharmList(snapshot.data);
              } else {
                return Container();
              }
            }));
  }

  Widget _createCharmList(List<CharmModel> charmList) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              title: Text(charmList[index].getName()),
              leading: Image.asset(charmList[index].getImagePath()),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SecondRoute(charmModel: charmList[index]))));
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            thickness: 8.0,
            height: 8.0,
            color: Colors.transparent,
          );
        },
        itemCount: charmList.length);
  }

  Future<List<CharmModel>> _fetch() async {
    return await _charmRepository.getCharmList();
  }
}

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
              Image.asset(charmModel.getImagePath())
            ],
          ),
        ));
  }
}
