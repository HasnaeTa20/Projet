import 'package:get/get.dart';
import 'package:projet_pfe/user/user.dart';
import 'package:projet_pfe/user/userpreferences.dart';

class CurrentUser extends GetxController{
  User currentUser = User(1, '', '', '', '', '','');
  User get user => currentUser;
  getUserInfo()async{
    User? getUserInfoFromLocalStorage = await RememeberUserPrefs.readUserInfo();
    currentUser =    getUserInfoFromLocalStorage!;
 }
}