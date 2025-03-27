class CustomerObjectResponseModel {
  String? id;

  String? email;

  String? name;
  String? phone;

  CustomerObjectResponseModel({this.email, this.name, this.phone});

  CustomerObjectResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    email = json['email'];
    name = json['name'];
    phone = json['phone'];
  }
}
