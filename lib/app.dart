import 'package:flutter/material.dart';
import 'package:getflutter/components/search_bar/gf_search_bar.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // List of items to be searched
  List list = [
    "Flutter",
    "React",
    "Ionic",
    "Xamarin",
  ];

  String _selectedItemText = "Our Selection Item";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "SearchBar App",
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _selectedItemText,
              ),
              GFSearchBar(
                searchList: list,
                searchQueryBuilder: (query, list) {
                  return list
                      .where((item) =>
                          item.toLowerCase().contains(query.toLowerCase()))
                      .toList();
                },
                overlaySearchListItemBuilder: (item) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      item,
                      style: const TextStyle(fontSize: 18),
                    ),
                  );
                },
                onItemSelected: (item) {
                  setState(() {
                    _selectedItemText = item;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
