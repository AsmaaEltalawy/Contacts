import 'package:contacts/Components/contact_info.dart';
import 'package:contacts/data/contactsdatabase.dart';
import 'package:contacts/data/models/database_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ContactsModel> contactsList = [];
  final box = Hive.box<ContactsModel>('contactsBox');
  var contactsDatabase = ContactsDataBase();

  void initState() {
    super.initState();
    if (box.isNotEmpty) {
      contactsList = contactsDatabase.loadContacts();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade700,
        title: const Center(
          child: Text(
            'Contacts',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
      ),
      body: ListView.builder(
          itemCount: contactsList.length,
          itemBuilder: (context, index) {
            return ContactInformation(
              name: contactsList[index].name,
              number: contactsList[index].number,
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/AddContact');

        },
        backgroundColor: Colors.teal,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}