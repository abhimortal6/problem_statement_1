import 'package:flutter/material.dart';

class EmployeeInfoTile extends StatelessWidget {
  final String title;
  final String value;

  EmployeeInfoTile({this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("$title:"),
          Text(value),
        ],
      ),
    );
  }
}
