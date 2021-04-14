import 'package:flutter/material.dart';
import 'package:ombre_search/widgets/custom_list_tile.dart';
import 'package:ombre_search/widgets/bottom_nav_bar.dart';

final artists = [
  {"name": "Phillip Gem", "genre": "Blues | Soul"},
  {"name": "Khalid Nurani", "genre": "Rock | RnB"},
  {"name": "Metallica", "genre": "Metal | 2000s"},
  {"name": "Linkin Park", "genre": "Rock"},
  {"name": "Chainsmokers", "genre": "Electronic | New"},
  {"name": "Dynasty", "genre": "Dance | Soul"},
  {"name": "Airbenders", "genre": "Rock | Punk"},
];

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Search"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(context: context, delegate: ArtistSearch());
                })
          ],
        ),
        bottomNavigationBar: BottomNavBar(),
        body: Container(
          color: Colors.white,
          child: Scrollbar(
            child: ListView.builder(
              itemBuilder: (context, index) => customListTile(
                  name: artists[index]["name"],
                  genre: artists[index]["genre"],
                  onTap: () {
                    print("Icon pressed!");
                  }),
              itemCount: 7,
            ),
          ),
        ),
      ),
    );
  }
}

class ArtistSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
          close(context, null);
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return Container(width: 0.0, height: 0.0);
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestedArtists = query.isEmpty
        ? artists
        : artists.where((q) => q["name"].startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => customListTile(
          name: suggestedArtists[index]["name"],
          genre: suggestedArtists[index]["genre"],
          onTap: () {
            print("Icon pressed!");
          }),
      itemCount: suggestedArtists.length,
    );
  }
}
