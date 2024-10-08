import 'package:contacts/data/models/database_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ContactsDataBase{
   final box = Hive.box<ContactsModel>('contactsBox');

List<ContactsModel> loadContacts(){
  return box.values.toList();
}
void addContact(ContactsModel contact){
  box.add(contact);
}
   void updateContact(int index, ContactsModel updatedContact) {
     box.putAt(index, updatedContact);
   }
   void delete(int index){
  box.deleteAt(index);
   }
}