import 'package:flutter/material.dart';
import 'package:flutter_app_upub/palette/palette.dart';

// Create a class represents another screen than main  -  in this case the EnvironmentPage
class EnvironmentPage extends StatelessWidget {
  const EnvironmentPage({super.key});

  // Build method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Upalette.upWhite,
      // Appbar consists of a toolbar
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const Text.rich(
          TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: "uPUB  ",
                style: TextStyle(
                  color: Upalette.upRed,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.2,
                ),
              ),
              TextSpan(
                  text: "plant a tree",
                  style: TextStyle(
                    color: Upalette.upRed,
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                  )),
            ],
          ),
        ),
        // Leading button
        leading: IconButton(
          onPressed: () {
            // navigate back to the first route - in this case back to main screen
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Upalette.upRed,
        ),
      ),
      // Using singlechildscroolview to make scroll enable
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // Using mainAxisAlignment property to determine position vertically
            // Using crossAxisAlignmen property to determine position horizontal
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Upalette.upWhite,
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              environmentFeed("assets/images/environment.jpg"),
            ],
          ),
        ),
      ),
    );
  }
}

// Create a layout widget with one parameter
Widget environmentFeed(String environmentImage) {
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
        // Using mainAxisAlignment property to determine position vertically
        // Using crossAxisAlignmen property to determine position horizontal
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10.0,
          ),
          if (environmentImage != "")
            Image.network(
              environmentImage,
            ),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    ),
  );
}
