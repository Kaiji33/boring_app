import 'package:boring/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseService {
  
  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference boringCollection = Firestore.instance.collection('BoringApp');

  Future<void> initUserData(String name, String photoUrl) async {
    bool exists = false;
    try {
      await Firestore.instance.document("BoringApp/$uid").get().then((doc) {
        if (doc.exists)
          exists = true;
        else
          exists = false;
      });
      if(!exists){
        return await boringCollection.document(uid).setData({
          'count': 0,
          'name':name,
          'photo':photoUrl,
        });}
    } catch (error) {
      print(error.toString());
      return null;
    }
  }


  Future<void> updateUserData(int count, String name, String photo) async {
    return await boringCollection.document(uid).setData({
      'count': count ,
      'name':name,
      'photo':photo,
    });
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      count: snapshot.data['count'],
      name: snapshot.data['name'],
      photo: snapshot.data['photo']
    );
  }

/*
  List<RankData> _RankDataListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      //print(doc.data);
      return RankData(
        count: doc.data['count'] ?? 0
      );
    }).toList();
  }
*/

  // get user doc stream
  Stream<UserData> get userData {
    return boringCollection.document(uid).snapshots()
      .map(_userDataFromSnapshot);
  }
}
