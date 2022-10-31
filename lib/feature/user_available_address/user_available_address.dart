import 'package:json_annotation/json_annotation.dart';

import 'result_available_address.dart';

part 'user_available_address.g.dart';

@JsonSerializable()
class UserAvailableAddress {
  String? status;
  ResultAvaliableAddress? result;

  UserAvailableAddress({this.status, this.result});

  factory UserAvailableAddress.fromJson(Map<String, dynamic> json) {
    return _$UserAvailableAddressFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserAvailableAddressToJson(this);
}
