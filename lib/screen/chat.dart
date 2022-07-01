import 'package:flutter/material.dart';
import 'package:flutter_app_upub/data/blacklisted.dart';
import 'package:flutter_app_upub/palette/palette.dart';
import 'package:flutter_app_upub/data/userlist.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

// Create a class represents another screen than main  -  in this case the ChatPage
class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _WebSocketState();
}

class _WebSocketState extends State<ChatPage> {
  final TextEditingController ucontroller = TextEditingController();

  // Connect to a websocket server with encrypted WSS (WebSockets over SSL/TLS) - secure protocol like htpps
  final uchannel = WebSocketChannel.connect(
    Uri.parse('wss://echo.websocket.events'),
  );

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
                  text: "send a message",
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
      body: Padding(
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
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 27.0,
                          backgroundColor: Upalette.upRed,
                          child: CircleAvatar(
                            radius: 25.0,
                            backgroundImage: AssetImage(userImageUrl[0]),
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: TextField(
                            style: const TextStyle(
                              color: Colors.black26,
                            ),
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(left: 25.0),
                                hintText: "What's up ?",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                  borderSide: BorderSide.none,
                                )),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const Divider(
                      color: Upalette.upGrey,
                      thickness: 1.5,
                    ),
                  ],
                ),
              ),
            ),
            Form(
              child: TextFormField(
                controller: ucontroller,
                decoration: const InputDecoration(
                  labelText: 'Send a message',
                  labelStyle: TextStyle(color: Upalette.upRed),
                ),
                style: const TextStyle(color: Upalette.upRed),
              ),
            ),
            const SizedBox(height: 24),
            // Stream messages from websocket server
            StreamBuilder(
              stream: uchannel.stream,
              builder: (context, snapshot) {
                return Text(snapshot.hasData ? '${snapshot.data}' : '');
              },
            )
          ],
        ),
      ),
      // Using floatingactionbutton to promote a primary action
      floatingActionButton: FloatingActionButton.extended(
        onPressed: senduPUBMessage,
        backgroundColor: Upalette.upRed,
        icon: const Icon(Icons.send),
        label: const Text('Send message'),
      ),
    );
  }

  // Create sendupubmessage function to perform adding a message to server
  void senduPUBMessage() {
    if (ucontroller.text.isNotEmpty) {
      if (forbiddenWord
          .any((element) => ucontroller.text.toLowerCase().contains(element))) {
        // Using showdialog for display a popup alert if message contains any of the words from the blacklisted list
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('ALERT'),
            content: const Text('Talk nicely or don\'t talk at all'),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Upalette.upRed,
                  onPrimary: Upalette.upWhite,
                ),
                onPressed: () {
                  // navigate back to the first route - in this case back to message - it close the popup
                  Navigator.pop(context);
                },
                child: const Text('Go Back'),
              ),
            ],
          ),
        );
      } else {
        // Adding messages to websocket server with sink.add
        uchannel.sink.add(ucontroller.text);
      }
    }
  }

  @override
  void dispose() {
    // Close websocket connection with sink.close
    uchannel.sink.close();
    ucontroller.dispose();
    super.dispose();
  }
}
