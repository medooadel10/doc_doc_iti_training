class AuthResponseModel {
  final String message;
  final bool status;
  final AuthDataModel data;

  AuthResponseModel(this.message, this.status, this.data);

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      AuthResponseModel(
        json['message'],
        json['status'],
        AuthDataModel.fromJson(json['data']),
      );
}

class AuthDataModel {
  final String token;

  AuthDataModel(this.token);

  factory AuthDataModel.fromJson(Map<String, dynamic> json) =>
      AuthDataModel(json['token']);
}
