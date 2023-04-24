import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ToListProvider extends ChangeNotifier
{
  TextEditingController txtId = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtuserId = TextEditingController();
  TextEditingController txtuserPassword = TextEditingController();
  TextEditingController txtnameadd = TextEditingController();
  TextEditingController txtorderadd = TextEditingController();
  TextEditingController txtupdatedname = TextEditingController();
  TextEditingController txtupdatedorder = TextEditingController();
  List todotitle = [];
  List todotask = [];
  List done = [];
  bool doneCheck = true;
  void refresh()
  {
    notifyListeners();
  }
}