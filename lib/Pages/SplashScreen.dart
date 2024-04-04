import 'dart:async';
import 'dart:js_interop';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_rnd/model/notes_model.dart';
import '../bloc/native_item_bloc.dart';
import '../bloc/native_item_event.dart';
import '../bloc/native_item_state.dart';
import '../boxes/boxes.dart';
import '../model/NativeItem.dart';
import 'package:hive/hive.dart';

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

    nativeItemBloc.stream.listen((state) async {
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


void saveDataToDatabase(NativeItem nativeItem) async {


  final data  = NoteModel(title: 'aslmTitle', description: "aslamDescription");

  final box = Boxes.getData();
  box.add(data);
  data.save();

}