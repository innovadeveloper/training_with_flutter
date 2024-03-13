import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:training_with_flutter/routes/routes.dart';

class PageMenuSelector extends StatelessWidget {
  const PageMenuSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text('Training Pages Selector'),
        ),
      body: Center(
        child: _pageList(context, AppRoutes().routes().entries.map((e) => e.key).toList() ),
      ),
    );
  }

  Widget _pageList(BuildContext context, List<String> pageList){
    return ListView(
      children: pageList.map((e) => ListTile(
        leading: Icon(Icons.abc),
        title: Text(e),
        onTap: () {
          Navigator.pushNamed(context, e);
        },
      )).toList()
    );
  }

  // Widget _buttonPage(BuildContext context, int pageNumber){
  //   return OutlinedButton(onPressed: () {
  //     // print("presionò el botòn");
  //   }, child: Text("Button"));
  // }


  

  // column > button, sizebox, button, size box
}