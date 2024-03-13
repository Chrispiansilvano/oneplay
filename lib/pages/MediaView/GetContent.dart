import 'package:firebase_storage/firebase_storage.dart';

Future<String> getMovieDownloadUrl() async {
    final storageRef =
        FirebaseStorage.instance.ref().child('movies/chanda.mp4');
    final snapshot = await storageRef.getDownloadURL();
    return snapshot;
  }