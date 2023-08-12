import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:greenpath_20/models/http_exception.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userEmail;
  var responsedata;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  // initialise() {
  //   firestore = FirebaseFirestore.instance;
  // }

  bool get isAuth {
    return _token != null;
  }

  String get userEmail {
    return _userEmail!;
  }

  Future<void> signup(String email, String password) async {
    try {
      const url =
          'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDJTJmc8H3GLUHdPVn8LTSJkS5scYkeQdA';

      final response = await http.post(
        Uri.parse(url),
        body: json.encode(
          {'email': email, 'password': password, 'returnSecureToken': true},
        ),
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
    } catch (error) {
      throw error;
    }
  }

  Future<void> signupInvestor(String email, String password) async {
    try {
      const url =
          'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDJTJmc8H3GLUHdPVn8LTSJkS5scYkeQdA';

      final response = await http.post(
        Uri.parse(url),
        body: json.encode(
          {'email': email, 'password': password, 'returnSecureToken': true},
        ),
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
    } catch (error) {
      throw error;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      const url =
          'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDJTJmc8H3GLUHdPVn8LTSJkS5scYkeQdA';

      final response = await http.post(
        Uri.parse(url),
        body: json.encode(
          {'email': email, 'password': password, 'returnSecureToken': true},
        ),
      );

      final responseData = json.decode(response.body);

      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _userEmail = responseData['email'];
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> insertRegisterData(
      String fullname,
      String username,
      String email,
      String district,
      Map cultivationsMap,
      String gender,
      String mobile) async {
    try {
      List cultivations = [cultivationsMap];
      await firestore.collection("farmer-details").add({
        'fullname': fullname,
        'username': username,
        'email': email,
        'district': district,
        'cultivations': cultivations,
        'gender': gender,
        'mobile': mobile
      });
    } catch (e) {
      print(e);
    }
  }

  Future<String> insertRegisterDataInvestor(
      String fullname,
      String username,
      String businessname,
      String email,
      String location,
      String gender,
      String mobile) async {
    String data = "";
    try {
      await firestore.collection("investor-details").add({
        'fullname': fullname,
        'username': username,
        'businessname': businessname,
        'email': email,
        'location': location,
        'gender': gender,
        'mobile': mobile,
        'cultivations': []
      }).then((value) => {
        data = value.id.toString()
      });
      return data;
    } catch (e) {
      print(e);
    }
    return data;
  }

  Future<void> insertCultivationsInvestor(String id, List cultivations) async {
    QuerySnapshot querySnapshot;

    try {
      querySnapshot = await firestore.collection("investor-details").get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          if (id == doc.id) {
            await firestore
                .collection("investor-details")
                .doc(id)
                .update({'cultivations': cultivations});
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> sendResetCode(String email) async {
    try {
      const url =
          'https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key=AIzaSyDJTJmc8H3GLUHdPVn8LTSJkS5scYkeQdA';

      final response = await http.post(
        Uri.parse(url),
        body: json.encode(
          {'email': email, 'requestType': 'PASSWORD_RESET'},
        ),
      );
      final responseData = json.decode(response.body);
      print(responseData);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
    } catch (error) {
      throw error;
    }
  }
}
