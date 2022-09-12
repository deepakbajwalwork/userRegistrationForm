import 'package:flutter/cupertino.dart';
import 'package:registerform/db/database_provider.dart';
import 'package:registerform/model/user_model.dart';

class UserViewModel extends ChangeNotifier {
  List<UsersModel> _userList = [];
  List<UsersModel> get getUserList => _userList;
  set setUserList(List<UsersModel> datas) {
    _userList = datas;
    notifyListeners();
  }

  UsersModel _userFormData = UsersModel();
  UsersModel get getUserFormData => _userFormData;
  set setuserFormData(UsersModel datas) {
    _userFormData = datas;
    notifyListeners();
  }

  void getUsersFromDb() async {
    try {
      List<UsersModel> datas = await DatabaseHelper.instance.getUser();
      setUserList = datas;
    } catch (e) {
      print(e);
    }
  }

  Future<bool> saveUsersToDb() async {
    try {
      await DatabaseHelper.instance.saveUser(getUserFormData);
      getUsersFromDb();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
