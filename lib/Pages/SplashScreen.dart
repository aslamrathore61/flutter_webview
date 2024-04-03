import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../bloc/native_item_bloc.dart';
import '../bloc/native_item_event.dart';
import '../bloc/native_item_state.dart';
import 'package:hive/hive.dart';

import '../model/NativeItem.dart';

/*  readJson().then((nativeItem) {
      print('nativeItem ${nativeItem.toJson()}');
    });
*/

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NativeItemBloc nativeItemBloc = NativeItemBloc();

    BuildContext savedContext = context;

    nativeItemBloc.add(GetMenuDetailsEvents());

    nativeItemBloc.stream.listen((state) {
      if (state is NativeItemLoaded) {

        saveDataToDatabase(state.nativeItem);

        Timer(const Duration(seconds: 3), () {
          Navigator.of(savedContext).pushReplacementNamed('/home');
        });

      } else if (state is NativeItemError) {
        // Handle error state
        // For now, just print the error message
        print(state.message);
      }
    });

    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/icons/savemaxdoller.png',
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}


void saveDataToDatabase(NativeItem nativeItem) {
  // Implement your logic to save data to the database here
/*  print('Saving data to database: ${nativeItem.toJson()}');

  final myBox = Hive.box('SaveMaxBox');
  NativeItem nativeObj = NativeItem(id: nativeItem.id, record: nativeItem.record, metadata: nativeItem.metadata);
  myBox.put('NativeItem', nativeObj);*/


}