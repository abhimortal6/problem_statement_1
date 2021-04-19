import 'package:flutter/material.dart';
import 'package:flutter_problem_statement/models/employee_model.dart';
import 'package:flutter_problem_statement/utils/navigation_helper.dart';

class EmployeesListTile extends StatelessWidget {
  final EmployeeModel employee;

  EmployeesListTile(this.employee);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: GestureDetector(
        onTap: () {
          NavigationHelper.gotoEmployeeDetailView(context, employee);
        },
        child: Card(
          margin: EdgeInsets.only(top: 8.0),
          child: Container(
            width: double.infinity,
            height: 55,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 4.0, right: 8.0, left: 8.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(employee.imageUrl),
                  ),
                ),
                Text(
                  employee.firstName + " " + employee.lastName,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
