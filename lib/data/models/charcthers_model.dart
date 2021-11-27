import 'dart:convert';
import 'package:flutter/foundation.dart';

class CharcthersModel {
  int? charId;
  String? name;
  String? birthday;
  List<String>? occupation;
  String? img;
  String? status;
  String? nickname;
  List<int>? appearance;
  String? portrayed;
  String? category;
  List<dynamic>? betterCallSaulAppearance;

  CharcthersModel({
    this.charId,
    this.name,
    this.birthday,
    this.occupation,
    this.img,
    this.status,
    this.nickname,
    this.appearance,
    this.portrayed,
    this.category,
    this.betterCallSaulAppearance,
  });

  factory CharcthersModel.fromMap(Map<String, dynamic> data) => CharcthersModel(
        charId: data['char_id'] as int?,
        name: data['name'] as String?,
        birthday: data['birthday'] as String?,
        occupation: data['occupation'] as List<String>?,
        img: data['img'] as String?,
        status: data['status'] as String?,
        nickname: data['nickname'] as String?,
        appearance: data['appearance'] as List<int>?,
        portrayed: data['portrayed'] as String?,
        category: data['category'] as String?,
        betterCallSaulAppearance:
            data['better_call_saul_appearance'] as List<dynamic>?,
      );

  Map<String, dynamic> toMap() => {
        'char_id': charId,
        'name': name,
        'birthday': birthday,
        'occupation': occupation,
        'img': img,
        'status': status,
        'nickname': nickname,
        'appearance': appearance,
        'portrayed': portrayed,
        'category': category,
        'better_call_saul_appearance': betterCallSaulAppearance,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CharcthersModel].
  factory CharcthersModel.fromJson(String data) {
    return CharcthersModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CharcthersModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! CharcthersModel) return false;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      charId.hashCode ^
      name.hashCode ^
      birthday.hashCode ^
      occupation.hashCode ^
      img.hashCode ^
      status.hashCode ^
      nickname.hashCode ^
      appearance.hashCode ^
      portrayed.hashCode ^
      category.hashCode ^
      betterCallSaulAppearance.hashCode;
}
