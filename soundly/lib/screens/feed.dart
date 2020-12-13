import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:soundly/integrations/firebaseStorage.dart';
import 'package:soundly/models/song.dart';
import 'package:soundly/screens/profile.dart';

import 'package:soundly/widgets/audioPost.dart';

class Feed extends StatefulWidget {
  String authToken;
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  String authToken;
  bool addButtonHover = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.authToken = widget.authToken;
  }

  AudioPlayer audioPlayer = AudioPlayer();
  String currentUrl =
      "https://firebasestorage.googleapis.com/v0/b/soundly-c63fd.appspot.com/o/Pink%20Floyd%20-%20Comfortably%20numb.mp3?alt=media&token=6568635d-5ebf-490c-b14d-486cc81d0e65";
  bool playing = false;
  bool started = false;
  dynamic addAudioFormKey = GlobalKey<FormState>();
  Song newSong = Song();
  void playAudioFromURL() async {
    setState(() {
      playing = true;
    });
    if (!started) {
      setState(() {
        started = true;
      });
    }
    try {
      int result = await audioPlayer.play(currentUrl, isLocal: false);
      print(result);
    } catch (e) {}
  }

  void resumeAudio() async {
    setState(() {
      playing = true;
    });
    try {
      int result = await audioPlayer.resume();
    } catch (e) {
      print(e);
    }
  }

  void pauseAudio() async {
    setState(() {
      playing = false;
    });
    int result = await audioPlayer.pause();
  }

  void controlAudio() {
    if (!started) {
      playAudioFromURL();
    } else if (playing) {
      pauseAudio();
    } else {
      resumeAudio();
    }
  }

  void pickFile() async {
    try {
      FilePickerResult result = await FilePicker.platform.pickFiles();

      if (result != null) {
        File file = File(result.files.single.path);
        newSong.songFile = file;
      } else {
        // User canceled the picker
      }
    } catch (e) {
      print(e);
    }
// show a dialog to open a file
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.black,
        title: Text(
          "Feed",
          textAlign: TextAlign.center,
          textScaleFactor: 1.5,
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 50),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => ProfilePage()));
              },
              child: CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),
          )
        ],
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        child: InkWell(
          child: Icon(Icons.add),
          onHover: (bool) {
            setState(() {
              addButtonHover = true;
            });
          },
          onTap: () {
            newSong = Song();
            showCupertinoDialog(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  return AlertDialog(
                      backgroundColor: Colors.white,
                      title: Text("Add an Audio File"),
                      content: Container(
                          height: MediaQuery.of(context).size.height / 2,
                          width: MediaQuery.of(context).size.width / 2,
                          child: Form(
                            key: addAudioFormKey,
                            child: Column(
                              children: [
                                Container(
                                    padding: EdgeInsets.all(10),
                                    child: TextField(
                                      autocorrect: true,
                                      onChanged: (str) {
                                        newSong.title = str;
                                      },
                                    )),
                                FloatingActionButton(
                                  child: Icon(Icons.add),
                                  onPressed: () async {
                                    try {
                                      pickFile();
                                    } catch (e) {
                                      print(e);
                                    }
                                  },
                                ),
                                InkWell(
                                  onTap: () async {
                                    if (addAudioFormKey.currentState
                                        .validate()) {
                                      uploadAudioFile(
                                          "1", newSong.title, newSong.songFile);
                                    }
                                  },
                                  child: Container(
                                      child: Card(
                                    child: Text("Submit"),
                                  )),
                                )
                              ],
                            ),
                          )));
                });
          },
        ),
        onPressed: () {},
      ),
      bottomNavigationBar: Container(
          height: 100,
          color: Colors.grey[900],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
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
                          padding:
                              EdgeInsets.only(top: 10, bottom: 10, right: 185),
                          child: InkWell(
                            onTap: () async {
                              //play pause audio
                              controlAudio();
                            },
                            child: CircleAvatar(
                                child: Icon(
                              playing ? Icons.pause : Icons.play_arrow,
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
              return AudioPost(
                onAuioPostTap: () {
                  setState(() {
                    started = false;
                  });
                  playAudioFromURL();
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
