import 'package:cloud_firestore/cloud_firestore.dart';

class InvestorService {
  late FirebaseFirestore firestore;
  initialise() {
    firestore = FirebaseFirestore.instance;
  }

  //get all farmer data
  Future<Map> getDataByEmail(String email) async {
    QuerySnapshot querySnapshot;
    Map docs = {};
    try {
      querySnapshot = await firestore.collection("investor-details").get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          if (email == doc['email']) {
            Map temp = {
              "id": doc.id,
              "fullname": doc['fullname'],
              "username": doc['username'],
              "location": doc['location'],
              "businessname": doc['businessname'],
              "email": doc['email'],
              "gender": doc['gender'],
              "mobile": doc['mobile'],
              "cultivations": doc['cultivations'],
            };
            docs = temp;
          }
        }
        return docs;
      }
    } catch (e) {
      print(e);
    }
    return docs;
  }

  Future<List> getDataByLocation(String location) async {
    QuerySnapshot querySnapshot;
    List<Map> docs = [];
    try {
      querySnapshot = await firestore.collection("investor-details").get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          if (location == doc['location']) {
            Map temp = {
              "id": doc.id,
              "fullname": doc['fullname'],
              "username": doc['username'],
              "location": doc['location'],
              "businessname": doc['businessname'],
              "email": doc['email'],
              "gender": doc['gender'],
              "mobile": doc['mobile'],
              "cultivations": doc['cultivations'],
            };
            docs.add(temp);
          }
        }
        return docs;
      }
    } catch (e) {
      print(e);
    }
    return docs;
  }

  // //add data
  // Future<void> insertData(String? imageUrl, String name, String description,
  //     String diseases) async {
  //   try {
  //     await firestore.collection("body-hands").add({
  //       'imageUrl': imageUrl,
  //       'name': name,
  //       'description': description,
  //       'diseases': diseases
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  //update data
  Future<void> updateCultivation(String id, String name) async {
    QuerySnapshot querySnapshot;
    List docs = [];
    
    try {
      querySnapshot = await firestore.collection("farmer-details").get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          if (id == doc.id) {
            docs =  doc['cultivations'];
          }
        }
        docs.add({
          'name': name
        });
      }
      await firestore.collection("farmer-details").doc(id).update({
        'cultivations': docs
      });
    } catch (e) {
      print(e);
    }

    
  }

  // //delete data
  // Future<void> delete(String id) async {
  //   try {
  //     await firestore.collection("body-hands").doc(id).delete();
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
