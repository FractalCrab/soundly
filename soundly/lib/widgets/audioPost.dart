import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AudioPost extends StatefulWidget {
  AudioPost({
    Key key,
    this.onAuioPostTap,
  }) : super(key: key);

  VoidCallback onAuioPostTap;

  @override
  _AudioPostState createState() => _AudioPostState();
}

class _AudioPostState extends State<AudioPost> {
  bool onHover = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onHover: (bool) {
          setState(() {
            this.onHover = bool;
          });
        },
        onTap: () {
          //play audio
          widget.onAuioPostTap();
        },
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://seeklogo.com/images/P/pink-floyd-logo-CE6D13EDCA-seeklogo.com.png",
                    ),
                  ),
                  onHover
                      ? Center(
                          child: Card(
                            elevation: 100,
                            color: Colors.white38,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "Tap to Play",
                                
                                style: TextStyle(color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        )
                      : Container()
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Title",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Artist",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "4:30",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
