import 'package:flutter/material.dart';

Widget customListTileDefault({String name, String genre, onTap}) {
  return Container(
    padding: EdgeInsets.all(8),
    child: Row(
      children: [
        Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              image: DecorationImage(
                  image: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/en/e/ed/Green_Day_-_American_Idiot_album_cover.png')),
            )),
        SizedBox(
          width: 10.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                genre,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.pink, fontSize: 16.0),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        )
      ],
    ),
  );
}
