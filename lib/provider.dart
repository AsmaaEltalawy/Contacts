import 'package:contacts/data/contactsdatabase.dart';
import 'package:contacts/data/models/database_model.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

class DataProvider with ChangeNotifier {
  var contactsDatabase = ContactsDataBase();

  final box = Hive.box<ContactsModel>('contactsBox');
  List<ContactsModel> contactsList = [];
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller3 = TextEditingController();

  void saveContact() {
    var newContact = ContactsModel(
        name: controller1.text,
        email: controller2.text,
        number: controller3.text);
    contactsList.add(newContact);
    contactsDatabase.addContact(newContact);
    controller1.clear();
    controller2.clear();
    controller3.clear();
    notifyListeners();
  }
}
