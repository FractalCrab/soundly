import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  String authToken;
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  String authToken;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.authToken = widget.authToken;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Feed",
          textAlign: TextAlign.center,
          textScaleFactor: 1.5,
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      bottomNavigationBar: Container(
          height: 100,
          color: Colors.grey[900],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 5,bottom: 5),
                child: CachedNetworkImage(
                  height: 100,
                  width: 200,
                  imageUrl:
                      "https://seeklogo.com/images/P/pink-floyd-logo-CE6D13EDCA-seeklogo.com.png",
                ),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          padding: EdgeInsets.only(top:10,bottom: 10,right: 185),
                          child: InkWell(
                            child: CircleAvatar(
                                child: Icon(
                              Icons.play_arrow,
                              size: 10,
                            )),
                          ),
                        ),
                      ),
                      Container(
                        width: 600,
                       padding: EdgeInsets.only(right: 180),
                        child: LinearProgressIndicator(
                          
                          backgroundColor: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 3,
          child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return Center(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: CachedNetworkImage(
                            imageUrl:
                                "https://seeklogo.com/images/P/pink-floyd-logo-CE6D13EDCA-seeklogo.com.png",
                          ),
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
            },
          ),
        ),
      ),
    );
  }
}
