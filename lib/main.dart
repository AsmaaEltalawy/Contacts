import 'package:contacts/Pages/addcontact.dart';
import 'package:contacts/data/models/database_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'Pages/home.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(ContactsModelAdapter());
  await Hive.openBox<ContactsModel>('contactsBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
     home: const Home(),
      routes: {
      '/AddContact' : (context) => AddContact(),}
    );
  }
}
