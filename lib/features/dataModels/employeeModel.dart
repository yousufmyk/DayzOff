class EmployeeData {
  final String? department;
  final String? email;
  final String? employee;
  final String? fullName;
  final String? id;
  final String? phoneNumber;
  final String? preferredName;


  EmployeeData({
     this.preferredName,
     this.department,
     this.email,
     this.employee,
     this.fullName,
     this.id,
     this.phoneNumber,
  });

  factory EmployeeData.fromMap(Map<String, dynamic> data) {
    return EmployeeData(
      department: data['department'],
      email: data['email'],
      employee: data['employee'],
      fullName: data['fullname'],
      preferredName: data['preferredName'],
      id: data['id'],
      phoneNumber: data['phonenumber'],
    );
  }
}
