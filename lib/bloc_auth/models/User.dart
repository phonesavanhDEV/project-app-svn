class User {
  // final int user_id;
  // final String username;
  // final String userpassword;
  final String employee_code;
  final String user_fullname;

  User({
    required this.employee_code,
    required this.user_fullname,
  });

  Map<String, dynamic> toJson() {
    return {
      'employee_code': employee_code,
      'user_fullname': user_fullname,
    };
  }
}
