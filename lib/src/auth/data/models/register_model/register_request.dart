import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  final String fNamr, lName, gender, email, password;
  RegisterRequest(
      {required this.email,
      required this.password,
      required this.fNamr,
      required this.gender,
      required this.lName});
  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
