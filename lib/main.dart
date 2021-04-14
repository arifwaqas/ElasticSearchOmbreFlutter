import 'package:flutter/material.dart';
import 'package:ombre_search/pages/search_page.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Search AppBar';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          colorScheme: ColorScheme.light(),
        ),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) => buildPages();

  Widget buildPages() {
    return SearchPage();
  }
}
