import 'package:flutter/material.dart';
import 'package:flutter_problem_statement/utils/constants/app_constants.dart';
import 'package:flutter_problem_statement/view_models/employees_list_view_model.dart';
import 'package:flutter_problem_statement/widgets/employees_list_tile.dart';
import 'package:incrementally_loading_listview/incrementally_loading_listview.dart';
import 'package:provider/provider.dart';

class EmployeesListView extends StatefulWidget {
  EmployeesListView({Key key}) : super(key: key);

  static const String TAG = "/EmployeesListView";

  @override
  _EmployeesListViewState createState() => _EmployeesListViewState();
}

class _EmployeesListViewState extends State<EmployeesListView> {
  EmployeesListViewModel _employeesListViewModel;

  initialise() async {
    if (_employeesListViewModel == null) {
      _employeesListViewModel = Provider.of<EmployeesListViewModel>(context);
      _employeesListViewModel.getEmployees(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    initialise();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppConstants.NAME),
      ),
      body: SafeArea(
        child: _employeesListViewModel == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: IncrementallyLoadingListView(
                      hasMore: () => _employeesListViewModel.canLoadMore,
                      itemCount: () => _employeesListViewModel.employees.length,
                      loadMore: () => _employeesListViewModel.getEmployees(context),
                      loadMoreOffsetFromBottom: 2,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return EmployeesListTile(_employeesListViewModel.employees[index]);
                      }),
                ),
              ),
      ),
    );
  }
}
