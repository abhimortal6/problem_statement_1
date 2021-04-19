import 'package:flutter/material.dart';
import 'package:flutter_problem_statement/models/employee_model.dart';
import 'package:flutter_problem_statement/view_models/employees_list_view_model.dart';
import 'package:flutter_problem_statement/views/employee_details_view.dart';
import 'package:flutter_problem_statement/views/employees_list_view.dart';
import 'package:provider/provider.dart';

class NavigationHelper {
  static getEmployeesListViewWithProvider() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => EmployeesListViewModel(),
        )
      ],
      child: EmployeesListView(),
    );
  }

  static gotoEmployeeDetailView(BuildContext context, EmployeeModel employee) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeDetailsView(employee)));
  }

  static moveToEmployeeListView(BuildContext context) async {
    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => getEmployeesListViewWithProvider()));
  }
}
