import 'package:mvvm_getx_example/model/user.dart';

class DataAccess {
  Future<List<UserModel>> initUserList() async {
    List<UserModel> userList = <UserModel>[];
    await Future.delayed(const Duration(seconds: 5));
    for (int i = 0; i < 2; i++) {
      UserModel model = UserModel();
      model.id = i;
      model.name = "Name";
      model.surname = "Surname";

      userList.add(model);
    }

    return userList;
  }
}
