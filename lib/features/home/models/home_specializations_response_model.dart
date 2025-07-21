class HomeSpecializationsResponseModel {
  final String message;
  final bool status;
  final List<SpecializationModel> specializations;

  HomeSpecializationsResponseModel(
      this.message, this.status, this.specializations);

  factory HomeSpecializationsResponseModel.fromJson(
          Map<String, dynamic> json) =>
      HomeSpecializationsResponseModel(
        json['message'],
        json['status'],
        (json['data'] as List<dynamic>)
            .map((e) => SpecializationModel.fromJson(e))
            .toList(),
      );
}

class SpecializationModel {
  final int id;
  final String name;

  SpecializationModel(this.id, this.name);

  factory SpecializationModel.fromJson(Map<String, dynamic> json) =>
      SpecializationModel(json['id'], json['name']);
}
