import 'package:contacts/data/contactsdatabase.dart';
import 'package:contacts/data/models/database_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {

final box = Hive.box<ContactsModel>('contactsBox');
  var contactsDatabase = ContactsDataBase();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  List<ContactsModel> contactsList = [];

  void saveContact() {
    setState(() {
      var newContact = ContactsModel(
          name: controller1.text,
          email: controller2.text,
          number: controller3.text);
      contactsList.add(newContact);
      contactsDatabase.addContact(newContact);


     });
    Navigator.pop(context);
    print(box.values.toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            '(Add Or Edit) Contact',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.teal.shade700,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.5),
            child: TextFormField(
              controller: controller1,
              cursorColor: Colors.teal,
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(color: Colors.teal.shade900),
                focusedBorder: label,
                enabledBorder: label,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.5),
            child: TextFormField(
              controller: controller3,
              cursorColor: Colors.teal,
              decoration: InputDecoration(
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(color: Colors.teal.shade900),
                  focusedBorder: label,
                  enabledBorder: label),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.5),
            child: TextFormField(
              controller: controller2,
              cursorColor: Colors.teal,
              decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.teal.shade900),
                  focusedBorder: label,
                  enabledBorder: label),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: saveContact, child: const Text('Save Contact')),
          // ),
        ],
      ),
    );
  }
}

var label = OutlineInputBorder(
  borderRadius: BorderRadius.circular(15),
  borderSide: const BorderSide(width: 2),
);
