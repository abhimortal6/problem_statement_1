import 'package:flutter/material.dart';
import 'package:flutter_problem_statement/models/employee_model.dart';
import 'package:flutter_problem_statement/widgets/employee_info_tile.dart';

class EmployeeDetailsView extends StatelessWidget {
  EmployeeDetailsView(this._employee);

  final EmployeeModel _employee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _employee.firstName + " " + _employee.lastName,
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 14.0, bottom: 10),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(_employee.imageUrl),
                  ),
                ),
              ),
              EmployeeInfoTile(
                title: "First Name",
                value: _employee.firstName,
              ),
              EmployeeInfoTile(
                title: "Last Name",
                value: _employee.lastName,
              ),
              EmployeeInfoTile(
                title: "Email",
                value: _employee.email,
              ),
              EmployeeInfoTile(
                title: "DOB",
                value: _employee.dob,
              ),
              EmployeeInfoTile(
                title: "Age",
                value: _employee.age.toString(),
              ),
              EmployeeInfoTile(
                title: "Contact",
                value: _employee.contactNumber,
              ),
              EmployeeInfoTile(
                title: "Salary",
                value: "₹ " + _employee.salary.toString(),
              ),
              EmployeeInfoTile(
                title: "Address",
                value: _employee.address,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
