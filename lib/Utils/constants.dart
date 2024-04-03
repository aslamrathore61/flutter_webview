import 'dart:convert';
import 'dart:ffi';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';

import '../model/NativeItem.dart';

const greyColor = Color(0xFFF3F4F8);
const darkGreyColor = Color(0xFFF8F9FA);

const String BaseUrl = 'https://savemax.com';

void showToast(String message, Color color, Icon icon) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

Future<NativeItem> readJson() async {
  final String response = await rootBundle.loadString('assets/jsonFile/menu_file.json');
  final Map<String, dynamic> jsonData = json.decode(response);

  // Print the JSON data
  print('JSONdata: $jsonData');

  return NativeItem.fromJson(jsonData);
}