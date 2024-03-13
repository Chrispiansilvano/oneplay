import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Storage {
  final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  // fetching thumbnail
  Future<String> downloadURL(String content) async{
    String downloadURL = await storage.ref('Home/Trending/Trending Now/$content').getDownloadURL();

    return downloadURL;
  }
  
}
