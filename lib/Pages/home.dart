import 'package:contacts/Components/contact_info.dart';
import 'package:contacts/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var brovider = Provider.of<DataProvider>(context);
    // void initState() {
    //   super.initState();
    //   if (brovider.box.isNotEmpty) {
    //     brovider.contactsList = brovider.contactsDatabase.loadContacts();
    //   }
    // }
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
          itemCount: brovider.contactsList.length,
          itemBuilder: (context, index) {
            return ContactInformation(
              name: brovider.contactsList[index].name,
              number: brovider.contactsList[index].number,
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
