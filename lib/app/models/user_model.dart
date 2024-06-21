class UserModel {
  final int id;
  final String name;
  final bool isActive;

  const UserModel(
      {required this.id, required this.name, required this.isActive});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      isActive: json['isActive'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isActive': isActive,
    };
  }
}
