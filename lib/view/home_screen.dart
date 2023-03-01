import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view_model/view_model_user.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserViewModel>(builder: (userViewModel) {
      return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('MVVM GetX Example'),
          ),
          body: userViewModel.userList.isEmpty
              ? const Center(
            child: CircularProgressIndicator(),) :
          Column(
            verticalDirection: VerticalDirection.down,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: userViewModel.userList.length,
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(0),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: const Icon(
                    Icons.supervised_user_circle_outlined,
                    size: 50,
                    color: Colors.indigo,
                  ),
                  title: Text(
                    "${userViewModel.userList[index].name} ${userViewModel.userList[index].surname}",
                  ),
                  subtitle: Text(userViewModel.userList[index].id.toString()),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {

                  },
                );
              },
            ),
              IconButton(iconSize: 72,color: Colors.indigo, onPressed: () {userViewModel.addUser();}, icon: const Icon(Icons.add_circle),),
            ],
          )

      );
    });
  }

}