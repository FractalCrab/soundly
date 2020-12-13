import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soundly/integrations/authAPI.dart';
import 'package:soundly/screens/feed.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  PageController pageController = PageController();
  String nextPage = "Register";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Column(
          children: [
            Text(
              "Welcome To Soundly",
              textAlign: TextAlign.center,
              textScaleFactor: 2,
            ),
            Text(
              "Swipe To $nextPage",
              textAlign: TextAlign.center,
            ),
          ],
        ),
        flexibleSpace: Text(
          "Welcome To Soundly",
          textAlign: TextAlign.center,
          textScaleFactor: 2,
        ),
        toolbarHeight: 100,
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: PageView(
          physics: AlwaysScrollableScrollPhysics(),
          onPageChanged: (id) {
            if (id == 0) {
              setState(() {
                nextPage = "Register";
              });
            } else {
              setState(() {
                nextPage = "Login";
              });
            }
          },
          controller: pageController,
          children: [Login(), Register()],
        ),
      ),
    );
  }
}

class Register extends StatefulWidget {
  VoidCallback onChangePage;
  Register({this.onChangePage});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  bool isUsernameUnique = true;
  String username, password;
  Future<bool> getIfUsernameUnique(String uname) async {
    setState(() {
      isUsernameUnique = false;
    });
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height - 150,
        width: MediaQuery.of(context).size.width / 3,
        child: Card(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Title(
                      color: Colors.white,
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontFamily: "Comforta",
                          color: Colors.white,
                        ),
                        textScaleFactor: 2,
                      )),
                ),
                Center(
                  child: Container(
                    child: Center(
                      child: Form(
                        key: formKey,
                        autovalidateMode: AutovalidateMode.always,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 4,
                                  padding: EdgeInsets.all(10),
                                  child: TextFormField(
                                    onChanged: (str) {
                                      username = str;
                                      getIfUsernameUnique(str);
                                    },
                                    validator: (str) {
                                      // if (str.length < 1) {
                                      //   return "username cannot be empty";
                                      // } else if (!isUsernameUnique) {
                                      //   return "username is not unique";
                                      // } else {
                                      //   return null;
                                      // }
                                    },
                                    style: TextStyle(color: Colors.white),
                                    cursorColor: Colors.white,
                                    decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        hintText: "u s e r n a m e",
                                        hintStyle:
                                            TextStyle(color: Colors.white)),
                                    autocorrect: true,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  width: MediaQuery.of(context).size.width / 4,
                                  child: TextFormField(
                                    onChanged: (str) {
                                      password = str;
                                    },
                                    validator: (str) {
                                      // if (str.length < 1) {
                                      //   return "password cannot be empty";
                                      // } else if (str.length < 8) {
                                      //   return "password should be 8 chars or more";
                                      // } else {
                                      //   return null;
                                      // }
                                    },
                                    style: TextStyle(color: Colors.white),
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        hintText: "p a s s w o r d",
                                        hintStyle:
                                            TextStyle(color: Colors.white)),
                                    autocorrect: true,
                                  ),
                                ),
                              ),
                               Flexible(
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 4,
                                  padding: EdgeInsets.all(10),
                                  child: TextFormField(
                                    onChanged: (str) {
                                      username = str;
                                      getIfUsernameUnique(str);
                                    },
                                    validator: (str) {
                                      // if (str.length < 1) {
                                      //   return "username cannot be empty";
                                      // } else if (!isUsernameUnique) {
                                      //   return "username is not unique";
                                      // } else {
                                      //   return null;
                                      // }
                                    },
                                    style: TextStyle(color: Colors.white),
                                    cursorColor: Colors.white,
                                    decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        hintText: "n a m e",
                                        hintStyle:
                                            TextStyle(color: Colors.white)),
                                    autocorrect: true,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  width: MediaQuery.of(context).size.width / 4,
                                  child: TextFormField(
                                    onChanged: (str) {
                                      password = str;
                                    },
                                    validator: (str) {
                                      // if (str.length < 1) {
                                      //   return "password cannot be empty";
                                      // } else if (str.length < 8) {
                                      //   return "password should be 8 chars or more";
                                      // } else {
                                      //   return null;
                                      // }
                                    },
                                    style: TextStyle(color: Colors.white),
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        hintText: "e m a i l",
                                        hintStyle:
                                            TextStyle(color: Colors.white)),
                                    autocorrect: true,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  child: FloatingActionButton(
                                    backgroundColor: Colors.greenAccent,
                                    onPressed: () async {
                                      dynamic loginSuccess =
                                          await loginAPI(username, password);
                                      //  dynamic loginSuccess=true;
                                      if (loginSuccess) {
                                        Navigator.pushReplacement(
                                            context,
                                            CupertinoPageRoute(
                                                builder: (context) => Feed()));
                                      }
                                    },
                                    child: Icon(Icons.arrow_forward_ios),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          color: Colors.grey[900],
        ),
      ),
    );
  }
}

class Login extends StatefulWidget {
  VoidCallback onChangePage;
  Login({this.onChangePage});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  bool isUsernameUnique = true;
  String username, password;
  Future<bool> getIfUsernameUnique(String uname) async {
    setState(() {
      isUsernameUnique = false;
    });
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      height: MediaQuery.of(context).size.height - 250,
      width: MediaQuery.of(context).size.width / 3,
      child: Card(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Title(
                    color: Colors.white,
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontFamily: "Comforta",
                        color: Colors.white,
                      ),
                      textScaleFactor: 2,
                    )),
              ),
              Center(
                child: Container(
                  child: Center(
                    child: Form(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.always,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Container(
                                width: MediaQuery.of(context).size.width / 4,
                                padding: EdgeInsets.all(10),
                                child: TextFormField(
                                  onChanged: (str) {
                                    username = str;
                                    getIfUsernameUnique(str);
                                  },
                                  validator: (str) {
                                    // if (str.length < 1) {
                                    //   return "username cannot be empty";
                                    // } else if (!isUsernameUnique) {
                                    //   return "username is not unique";
                                    // } else {
                                    //   return null;
                                    // }
                                  },
                                  style: TextStyle(color: Colors.white),
                                  cursorColor: Colors.white,
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      hintText: "u s e r n a m e",
                                      hintStyle:
                                          TextStyle(color: Colors.white)),
                                  autocorrect: true,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                width: MediaQuery.of(context).size.width / 4,
                                child: TextFormField(
                                  onChanged: (str) {
                                    password = str;
                                  },
                                  validator: (str) {
                                    // if (str.length < 1) {
                                    //   return "password cannot be empty";
                                    // } else if (str.length < 8) {
                                    //   return "password should be 8 chars or more";
                                    // } else {
                                    //   return null;
                                    // }
                                  },
                                  style: TextStyle(color: Colors.white),
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      hintText: "p a s s w o r d",
                                      hintStyle:
                                          TextStyle(color: Colors.white)),
                                  autocorrect: true,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                child: FloatingActionButton(
                                  backgroundColor: Colors.greenAccent,
                                  onPressed: () async {
                                    dynamic loginSuccess =
                                        await loginAPI(username, password);
                                    //  dynamic loginSuccess=true;
                                    if (loginSuccess) {
                                      Navigator.pushReplacement(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (context) => Feed()));
                                    }
                                  },
                                  child: Icon(Icons.arrow_forward_ios),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        color: Colors.grey[900],
      ),
    ));
  }
}
