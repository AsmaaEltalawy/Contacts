
import 'package:contacts/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class AddContact extends StatelessWidget {
  const AddContact({super.key});

//
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DataProvider>(context);

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
              controller: provider.controller1,
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
              controller: provider.controller3,
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
              controller: provider.controller2,
              cursorColor: Colors.teal,
              decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.teal.shade900),
                  focusedBorder: label,
                  enabledBorder: label),
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          ElevatedButton(
              onPressed: provider.saveContact,

              child: const Text('Save Contact'),

          ),
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
