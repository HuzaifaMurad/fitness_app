class GymUser {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? password;
  String? imgUrl;

  GymUser(
      {this.email, this.id, this.name, this.phone, this.password, this.imgUrl});
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'email': email,
      'phone': phone,
      'password': password,
      'imgUrl': imgUrl,
    };
  }
}
