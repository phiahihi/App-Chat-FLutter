import 'dart:convert';
import 'dart:io';

import 'package:app_chat/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class chatController extends ChangeNotifier {
  List<User> userList = [];

  Future<List<User>> fetchData() async {
    userList = await callApi();
    return userList;
  }


  Future<List<User>> filterSearch(String text) async {
    return text.isNotEmpty
        ? userList.where((e) {
      var userLower = e.firstName!.toLowerCase() + ' '+ e.lastName!.toLowerCase();
      var searchLower = text.toLowerCase();
      return userLower.contains(searchLower);
    }).toList()
        : [];
  }
}

Future<List<User>> callApi() async {
  List<User> listUser = [];
  var response = await http.get(Uri.parse('https://dummyjson.com/users'));
  if(response.statusCode == 200) {
    Map<String, dynamic> dataJson = json.decode(response.body);
    List data = dataJson['users'];
    listUser = data.map((e) => User.fromJson(e)).toList();
  } else {
    throw Exception('Fail !');
  }
  return listUser;
}