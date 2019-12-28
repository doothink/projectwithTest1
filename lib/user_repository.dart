import 'dart:async';

import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    await Future.delayed(Duration(seconds: 1));
    return 'token';
  }

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("accessTokenWith");
//    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('accessTokenWith', token);
    return;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    final prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessTokenWith');
    if (accessToken != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<String> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessTokenWith');
    return accessToken;
  }

  Future<void> persistNotipicationToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('notipicationToken', token);
    return;
  }

  Future<String> getNotificationToken() async {
    final prefs = await SharedPreferences.getInstance();
    String notipicationToken = prefs.getString('notipicationToken');
    return notipicationToken;
  }

  Future<String> getAuthenticate() async {
    final prefs = await SharedPreferences.getInstance();
    String username = prefs.getString('usernameWith');
    return username;
  }

  Future<void> persistUsername(String username) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('usernameWith', username);
    return;
  }

  Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("accessTokenWith");
    prefs.remove('usernameWith');
  }

  Future<bool> isSignedIn() async {
    final prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessTokenWith');
    if (accessToken != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<String> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    String username = prefs.getString('usernameWith');
    return username;
  }
}
