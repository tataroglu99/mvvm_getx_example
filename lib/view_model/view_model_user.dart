import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mvvm_getx_example/data/data_access.dart';
import 'package:mvvm_getx_example/model/user.dart';

class UserViewModel extends GetxController {
  List<UserModel> _userList = [];
  List<UserModel> get userList => _userList;

  @override
  void onInit() {
    super.onInit();
    getUserList();
  }

  getUserList() async {
    _userList = await DataAccess().initUserList();
    update();
  }

  addUser() async {

    UserModel model = UserModel();
    model.id = 100;
    model.name = "Name";
    model.surname = "Surname";

    _userList.add(model);
    update();
  }

  removeUser(UserModel userModel) async {
    _userList.remove(userModel);
    update();
  }
}