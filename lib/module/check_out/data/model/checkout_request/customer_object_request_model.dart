class CustomerObjectRequestModel {
  String? email;

  String? name;
  String? phone;

  CustomerObjectRequestModel({this.email, this.name, this.phone});

  Map<String, dynamic> toJson() => <String, dynamic>{
    'email': email,
    'name': name,
    'phone': phone,
  };
}
