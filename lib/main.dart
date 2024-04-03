import 'package:flutter/material.dart';
import 'Network/ApiProvider.dart';
import 'Pages/BottomNaviBar.dart';
import 'Pages/SplashScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

Future<void> main() async {

/*  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(NativeItemAdapter());

  await Hive.openBox('SaveMaxBox');*/
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


/*
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  await Hive.openBox('myBox');
  runApp(MyApp());
}
*/

