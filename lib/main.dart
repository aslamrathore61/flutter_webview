import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:webview_rnd/model/notes_model.dart';
import 'Network/ApiProvider.dart';
import 'Pages/BottomNaviBar.dart';
import 'Pages/SplashScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);

/*
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>('notes');
*/


  runApp(MaterialApp(
    home: RepositoryProvider(
      create: (context) => ApiProvider(),
      child: SplashScreen(),
    ),
    routes: {
      '/home': (context) => BottomNaviBar(),
    },
  ));
}
