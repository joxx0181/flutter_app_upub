import 'package:flutter/material.dart';
import 'package:flutter_app_upub/palette/palette.dart';

// Create a layout widget with eight parameters
Widget postFeed(
    String userImageUrl,
    String userName,
    String postDate,
    String posts,
    String postImages,
    String userLikes,
    String userLoves,
    String userComments) {
  return Container(
    margin: const EdgeInsets.only(bottom: 20.0),
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.0),
      color: Upalette.upGrey,
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 27.0,
                backgroundColor: Upalette.upRed,
                child: CircleAvatar(
                  radius: 25.0,
                  backgroundImage: AssetImage(userImageUrl),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      postDate,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          if (posts != "")
            Text(
              posts,
              textAlign: TextAlign.justify,
              style: const TextStyle(color: Colors.black87, fontSize: 16.0),
            ),
          const SizedBox(
            height: 10.0,
          ),
          if (postImages != "")
            Image.network(
              postImages,
            ),
          const SizedBox(
            height: 10.0,
          ),
          const Divider(
            thickness: 1.5,
            color: Upalette.upRed,
          ),
          Row(
            children: [
              actionButton(
                  Icons.thumb_up, userLikes, "Like it", Upalette.upRed),
              actionButton(
                  Icons.favorite_border, userLoves, "Love it", Upalette.upRed),
              actionButton(
                  Icons.comment, userComments, "Comments", Upalette.upRed),
            ],
          ),
        ],
      ),
    ),
  );
}

// Create a layout widget with four parameters
Widget actionButton(
    IconData icon, String actionResult, String actionValue, Color iconColor) {
  return Expanded(
    child: TextButton.icon(
      onPressed: () {},
      icon: Icon(
        icon,
        color: iconColor,
      ),
      label: Column(
        children: [
          Text(
            actionResult,
            style: const TextStyle(
              color: Upalette.upRed,
            ),
          ),
          Text(
            actionValue,
            style: const TextStyle(
              color: Upalette.upRed,
            ),
          ),
        ],
      ),
    ),
  );
}
