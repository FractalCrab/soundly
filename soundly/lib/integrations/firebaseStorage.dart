import 'dart:html';


import 'package:firebase/firebase.dart';


Future<void> uploadAudioFile(String uid, String title, dynamic file) async {
  try {
    StorageReference reference = storage().ref().child("/$uid/$title.mp3");
    UploadTask uploadTask =
        reference.put(file, UploadMetadata(contentType: "audio/mpeg"));
  
    uploadTask.future.then((snap) {
      print(snap.totalBytes);
    });
  } on FirebaseError catch (e) {
    print(e);
  } catch (e) {
    print(e);
  }
}
