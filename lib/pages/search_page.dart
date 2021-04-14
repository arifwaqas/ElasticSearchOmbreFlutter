import 'package:flutter/material.dart';
import 'package:ombre_search/widgets/custom_list_tile.dart';
import 'package:ombre_search/widgets/bottom_nav_bar.dart';
import 'package:ombre_search/widgets/custom_list_tile_def.dart';

//Any list of data in JSON format or Using Firestore
//I have avoided usage of firestore and directly hardcoded some sample data
//But this data can be parsed from JSON too, it will behave in same way
final artists = [
  {"name": "Phillip Gem", "genre": "Blues | Soul"},
  {"name": "Khalid Nurani", "genre": "Rock | RnB"},
  {"name": "Metallica", "genre": "Metal | 2000s"},
  {"name": "Linkin Park", "genre": "Rock"},
  {"name": "Chainsmokers", "genre": "Electronic | New"},
  {"name": "Dynasty", "genre": "Dance | Soul"},
  {"name": "Airbenders", "genre": "Rock | Punk"},
  {"name": "Foo Fighters", "genre": "Rock | 2002"},
  {"name": "Fall Out Boys", "genre": "Rock | Alt"},
  {"name": "Fearsome Foursome", "genre": "Groovy | Punk"},
];
//End of sample data

class SearchPage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
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
            isAlwaysShown: true,
            controller: _scrollController,
            child: ListView.builder(
              controller: _scrollController,
              itemBuilder: (context, index) => customListTileDefault(
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
          queryLength: query.length,
          onTap: () {
            print("Icon pressed!");
          }),
      itemCount: suggestedArtists.length,
    );
  }
}
