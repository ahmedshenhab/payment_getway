class EphemeralResponseModel {
  String? secret;

  EphemeralResponseModel({this.secret});

  factory EphemeralResponseModel.fromJson(Map<String, dynamic> json) {
    return EphemeralResponseModel(secret: json['secret'] as String?);
  }
}
