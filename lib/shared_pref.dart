import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static Future<List<Map<String, String>>> loadContacts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? storedContacts = prefs.getStringList('contacts');
    if (storedContacts != null) {
      return storedContacts
          .map((contact) => {
                'name': contact.split(',')[0],
                'number': contact.split(',')[1],
              })
          .toList();
    } else {
      return [];
    }
  }
}
