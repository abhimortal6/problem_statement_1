class EmployeeModel {
  int id;
  String imageUrl;
  String firstName;
  String lastName;
  String email;
  String contactNumber;
  int age;
  String dob;
  double salary;
  String address;

  EmployeeModel(
      {this.id,
      this.imageUrl,
      this.firstName,
      this.lastName,
      this.email,
      this.contactNumber,
      this.age,
      this.dob,
      this.salary,
      this.address});

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      imageUrl: json['imageUrl'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      contactNumber: json['contactNumber'],
      age: json['age'],
      dob: json['dob'],
      salary: json['salary'],
      address: json['address'],
      email: json['email'],
    );
  }
}

//     Original reference for employee data model
//     "id": 1001,
//     "imageUrl": "https://hub.dummyapis.com/Image?text=DR&height=120&width=120",
//     "firstName": "Danny",
//     "lastName": "Rogahn",
//     "email": "Danny.Rogahn@dummyapis.com",
//     "contactNumber": "4823191604",
//     "age": 90,
//     "dob": "06/08/1931",
//     "salary": 1.0,
//     "address": "Address1"
