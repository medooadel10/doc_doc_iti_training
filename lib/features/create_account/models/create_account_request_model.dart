class CreateAccountRequestModel {
  final String name;
  final String email;
  final String phone;
  final int gender;
  final String password;
  final String passwordConfirmation;

  CreateAccountRequestModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.password,
    required this.passwordConfirmation,
  });

  Map<String, dynamic> toJson() => {
        'name': this.name,
        'email': this.email,
        'phone': this.phone,
        'gender': this.gender,
        'password': this.password,
        'password_confirmation': this.passwordConfirmation,
      };
}
