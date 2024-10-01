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

/////////////////////////////////////////////////////////////////////////////////////////////

  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  TextEditingController controller6 = TextEditingController();

  void saveContact() {
    var newContact = ContactsModel(
        name: controller1.text,
        email: controller2.text,
        number: controller3.text);
    contactsList.add(newContact);
    contactsDatabase.addContact(newContact);

    clearControllers();
    notifyListeners();
  }

  void updateContact(ContactsModel oldContact, int index) {
    var updatedContact = ContactsModel(
        name: controller4.text,
        number: controller5.text,
        email: controller6.text);
    contactsList[index] = updatedContact;
    contactsDatabase.updateContact(index, updatedContact);

    clearControllers();
    notifyListeners();
  }

  void clearControllers() {
    controller1.clear();
    controller2.clear();
    controller3.clear();
  }
}
