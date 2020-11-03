import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height - 100,
          padding: EdgeInsets.all(10),
          child: Card(
            color: Colors.grey[900],
            child: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: CircleAvatar(
                    radius: 50,
                      child: Icon(Icons.person,size: 40,),
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    "Name",
                    textScaleFactor: 1.5,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    "Your Content",
                    textScaleFactor: 1.2,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top:10,right: 5,left:5),
                    child: ListView.builder(
                        
                        scrollDirection: Axis.vertical,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(10),
                            child: Card(
                              color: Colors.grey[900],
                              elevation: 40.0,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("Title",
                      style: TextStyle(color: Colors.white)),
                                    Text("Duration",
                      style: TextStyle(color: Colors.white)),
                                    Text("Uploaded On",
                      style: TextStyle(color: Colors.white))
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                  ),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
