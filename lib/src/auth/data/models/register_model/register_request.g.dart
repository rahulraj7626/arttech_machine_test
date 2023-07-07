// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    RegisterRequest(
      email: json['email'] as String,
      password: json['password'] as String,
      fNamr: json['fNamr'] as String,
      gender: json['gender'] as String,
      lName: json['lName'] as String,
    );

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'fNamr': instance.fNamr,
      'lName': instance.lName,
      'gender': instance.gender,
      'email': instance.email,
      'password': instance.password,
    };
