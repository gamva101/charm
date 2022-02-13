import 'package:flutter/material.dart';
import 'package:instagram_flutter/data/charm_bloc.dart';
import 'package:instagram_flutter/data/charm_data_provider.dart';
import 'package:instagram_flutter/data/repository.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:instagram_flutter/ui/banner/charm_list/charm_list.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Admob.initialize();
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
        theme: ThemeData.light(),
        home: HomeWidget());
  }
}

class HomeWidget extends StatefulWidget {
  @override
  HomeWidgetState createState() => HomeWidgetState();
}

class HomeWidgetState extends State<HomeWidget> {
  final CharmBloc _charmBloc = CharmBloc(CharmRepository(CharmDataProvider()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Charm List'),
        ),
        body: CharmList());
  }
}
