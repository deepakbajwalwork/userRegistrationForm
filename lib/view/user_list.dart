import 'package:flutter/material.dart';
import 'package:registerform/view/register_user.dart';
import 'package:registerform/view/user_details.dart';
import 'package:registerform/widgets/common_button.dart';
import 'package:registerform/widgets/common_scaffold.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _showDataAlert() {
      showDialog(
        context: context,
        builder: (context) {
          return const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
            child: UserDetails(),
          );
        },
      );
    }

    Widget _bodydata() {
      return ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => Divider(
          height: 10.0,
          color: Colors.grey.shade400,
        ),
        padding: const EdgeInsets.only(bottom: 90),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://i.dailymail.co.uk/i/pix/2011/04/24/article-1380052-0AE74590000005DC-241_1024x615_large.jpg',
              ),
            ),
            title: const Text('John smit'),
            subtitle: const Text('Adhere east west'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              _showDataAlert();
            },
          );
        },
      );
    }

    return CommonScaffold(
      appTitle: "Users",
      body: _bodydata(),
      floatingActionButton: CommonButton(
        buttonText: 'Register',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RegisterUser()),
          );
        },
      ),
    );
  }
}
