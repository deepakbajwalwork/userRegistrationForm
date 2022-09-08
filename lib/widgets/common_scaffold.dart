import 'package:flutter/material.dart';

class CommonScaffold extends StatelessWidget {
  final Widget? body;
  final String? appTitle;
  final Widget? floatingActionButton;
  final EdgeInsets? padding;
  const CommonScaffold({
    Key? key,
    this.body = const SizedBox(),
    this.appTitle = '',
    this.floatingActionButton,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        toolbarTextStyle: const TextStyle(
          decorationColor: Colors.black,
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          appTitle!,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
      ),
      body: Padding(
        padding: padding!,
        child: body,
      ),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}
