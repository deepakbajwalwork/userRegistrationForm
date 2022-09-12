import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:registerform/utls/navigation_service.dart';
import 'package:registerform/view/user_list.dart';
import 'db/database_provider.dart';
import 'utls/provider_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initilizeLocalDB();
  runApp(MultiProvider(
    providers: providers,
    child: const MyApp(),
  ));
}

initilizeLocalDB() async {
  DatabaseHelper databaseHelper = DatabaseHelper.internal();
  await databaseHelper.initDb();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: NavigationService.navigatorKey,
      home: const UserList(),
    );
  }
}
