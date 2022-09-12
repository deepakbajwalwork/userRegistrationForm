import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:registerform/model/user_model.dart';

import 'package:registerform/view/register_user.dart';
import 'package:registerform/view/user_details.dart';
import 'package:registerform/view_model/user_vm.dart';
import 'package:registerform/widgets/common_button.dart';
import 'package:registerform/widgets/common_scaffold.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final personInfo = Provider.of<UserViewModel>(context, listen: false);
    personInfo.getUsersFromDb();

    _showDataAlert(int index) {
      showDialog(
        context: context,
        builder: (context) {
          return Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
            child: UserDetails(
              userDatas: personInfo.getUserList[index],
            ),
          );
        },
      );
    }

    Widget _bodydata() {
      return Consumer(
        builder: (BuildContext context, UserViewModel personalInfo, w) {
          List<UsersModel> userList = personalInfo.getUserList;
          if (userList.isEmpty) {
            return const Center(
              child: Text('No data found'),
            );
          }
          return ListView.separated(
            itemCount: personalInfo.getUserList.length,
            separatorBuilder: (context, index) => Divider(
              height: 10.0,
              color: Colors.grey.shade400,
            ),
            padding: const EdgeInsets.only(bottom: 90),
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: userList[index].picture != null
                      ? MemoryImage(userList[index].picture!)
                      : null,
                ),
                title: Text(
                    "${userList[index].firstName.toString()} ${userList[index].lastName.toString()} "),
                subtitle: const Text('Adhere east west'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  _showDataAlert(index);
                },
              );
            },
          );
        },
      );
    }

    return CommonScaffold(
      appTitle: "Users",
      body: _bodydata(),
      floatingActionButton: CommonButton(
        isborder: false,
        buttonText: 'Register',
        width: MediaQuery.of(context).size.width,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RegisterUser(),
            ),
          );
        },
      ),
    );
  }
}
