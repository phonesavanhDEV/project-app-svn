// class UserModel {
//   // final String id;
//   // final String name;
//   // final String avatar;
//   // final DateTime createdAt;
//   final String barcode_code;
//   final String product_bill_name;
//   final String product_category_name;

//   // UserModel({
//   //   required this.id,
//   //   required this.name,
//   //   required this.avatar,
//   //   required this.createdAt,
//   // });

//   UserModel({
//     required this.barcode_code,
//     required this.product_bill_name,
//     required this.product_category_name,
//   });

//   // Map<String, dynamic> toJson() {
//   //   return {
//   //     'id': id,
//   //     'name': name,
//   //     'avatar': avatar,
//   //     'createdAt':
//   //         createdAt.toIso8601String(), // Convert DateTime to a string format
//   //   };
//   // }

//   Map<String, dynamic> toJson() {
//     return {
//       'barcode_code': barcode_code,
//       'product_bill_name': product_bill_name,
//       'product_category_name': product_category_name,
//     };
//   }

//   bool isEqual(UserModel other) {
//     return barcode_code == other.barcode_code &&
//         product_bill_name == other.product_bill_name &&
//         product_category_name == other.product_category_name;
//   }

//   static List<UserModel> fromJsonList(List<dynamic> data) {
//     return data.map<UserModel>((json) {
//       return UserModel(
//         barcode_code: json['barcode_code'],
//         product_bill_name: json['product_bill_name'],
//         product_category_name: json['product_category_name'],
//       );
//     }).toList();
//   }
// }

class UserModel {
  final String id;
  final String name;
  final String avatar;
  final String createdAt;

  UserModel({
    required this.id,
    required this.name,
    required this.avatar,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'avatar': avatar,
      'createdAt': createdAt,
    };
  }

  bool isEqual(UserModel other) {
    return id == other.id &&
        name == other.name &&
        avatar == other.avatar &&
        createdAt == other.createdAt;
  }

  static List<UserModel> fromJsonList(List<dynamic> data) {
    return data.map<UserModel>((json) {
      return UserModel(
        id: json['id'],
        name: json['name'],
        avatar: json['avatar'],
        createdAt: json['createdAt'],
      );
    }).toList();
  }
}
