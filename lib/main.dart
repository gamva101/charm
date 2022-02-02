import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Test app demo', theme: ThemeData.dark(), home: HomeWidget());
  }
}

class HomeWidget extends StatefulWidget {
  final List<String> list = List.generate(20, (index) => "Text to $index");

  @override
  HomeWidgetState createState() => HomeWidgetState();
}

class HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('AppBar'),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: Search(widget.list));
              },
              icon: const Icon(Icons.search),
            )
          ],
        ),
        body: ListView.builder(
          itemCount: widget.list.length,
          itemBuilder: (context, index) => ListTile(
              title: Text(widget.list[index]),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SecondRoute(
                            name: widget.list[index],
                          )))),
        ));
  }
}

class SecondRoute extends StatelessWidget {
  final String name;
  SecondRoute({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Second route $name'),
        ),
        body: Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Go back'))));
  }
}

class Search extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    String searchedResult = '';
    return Container(
      child: Center(child: Text(searchedResult)),
    );
  }

  final List<String> listExample;
  Search(this.listExample);
  List<String> recentList = ["Text 4", "Text 5"];

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = [];
    query.isEmpty
        ? suggestionList = recentList
        : suggestionList
            .addAll(listExample.where((element) => element.contains(query)));

    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(suggestionList[index]));
        });
  }
}

class GridViewWidget extends StatefulWidget {
  const GridViewWidget({Key? key}) : super(key: key);

  @override
  GridViewWidgetState createState() => GridViewWidgetState();
}

class GridViewWidgetState extends State<GridViewWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 3 / 4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10),
      itemBuilder: (context, index) {
        return Container(
          color: Colors.lightGreen,
          child: Text(' Item : $index'),
        );
      },
    );
  }
}
