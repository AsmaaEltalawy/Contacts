import 'package:contacts/data/models/database_model.dart';
import 'package:contacts/provider.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'Pages/home.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ContactsModelAdapter());
  await Hive.openBox<ContactsModel>('contactsBox');
  runApp(ChangeNotifierProvider(
    create: (context) => DataProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home()
    );
  }
}
