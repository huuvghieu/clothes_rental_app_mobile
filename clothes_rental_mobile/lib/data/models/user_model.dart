import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class UserModel extends Equatable {
  String? id;
  String? name;
  String? role;
  String? accessToken;
  UserModel({this.id, this.accessToken, this.name, this.role});
  

 UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    role = json['role'];
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['role'] = role;
    data['accessToken'] = accessToken;
    return data;
  }
  @override
  List<Object?> get props => [id, accessToken, name, role];
}
