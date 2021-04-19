import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_problem_statement/models/employee_model.dart';

class EmployeesListViewModel extends ChangeNotifier {
  List<EmployeeModel> _remoteEmployees;
  List<EmployeeModel> employees = [];
  bool canLoadMore = true;
  static const int perPage = 50;
  int page = 0;

  loadJsonFromAssets(BuildContext context) async {
    //import json data
    String data = await DefaultAssetBundle.of(context).loadString("assets/employees.json");

    //parsing json string
    var parsedJson = json.decode(data);

    //json string to dart object list
    List<EmployeeModel> _list = List<EmployeeModel>.from(parsedJson.map((employee) => EmployeeModel.fromJson(employee)));
    //sorting list

    //took 0:00:00.013601 for 1000 elements on Redmi Note 3
    _list.sort((a, b) => a.firstName.compareTo(b.firstName));

    _remoteEmployees = _list;
  }

  getEmployees(BuildContext context) async {
    //check if list is filled
    if (_remoteEmployees == null) await loadJsonFromAssets(context);
    //pagination
    Iterable<EmployeeModel> _temp;
    try {
      _temp = _remoteEmployees.getRange(page * perPage, perPage * (page + 1));
    } catch (e) {
      debugPrint("Error: $e");
    }

    if (_temp == null) {
      canLoadMore = false;
      notifyListeners();
      return;
    }

    if (_temp.length < perPage) {
      canLoadMore = false;
      notifyListeners();
    }

    employees.addAll(_remoteEmployees.getRange(page * perPage, perPage * (page + 1)));
    if (employees.length == _remoteEmployees.length) {
      notifyListeners();
      page = 0;
      return;
    }
    page++;
    notifyListeners();
    print("List length: ${employees.length}");
  }
}
