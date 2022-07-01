import 'package:flutter/material.dart';
import 'package:flutter_app_upub/palette/palette.dart';

// Create a layout widget with three parameters
Widget allStories(
  String userImageUrl,
  String stories,
  String userName,
) {
  return Container(
    margin: const EdgeInsets.only(right: 20.0),
    height: 240.0,
    width: 150.0,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        image: DecorationImage(
          image: AssetImage(stories),
          fit: BoxFit.cover,
        )),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 19.0,
            backgroundColor: Upalette.upRed,
            child: CircleAvatar(
              radius: 17.0,
              backgroundImage: AssetImage(userImageUrl),
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Text(
            userName,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontSize: 15.0,
            ),
          )
        ],
      ),
    ),
  );
}
