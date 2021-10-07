import 'package:equatable/equatable.dart';

class GetRedisKeysResponse extends Equatable {
  final List<String> keys;

  GetRedisKeysResponse(this.keys);

  @override
  List<Object> get props => [this.keys];

  GetRedisKeysResponse.fromJson(Map<String, dynamic> json)
      : this.keys = ((json['keys'] as List<String>)).map((q) => q).toList();
}

class ConnectRedisResponse extends Equatable {
  final bool success;

  ConnectRedisResponse(this.success);

  @override
  List<Object> get props => [this.success];

  ConnectRedisResponse.fromJson(Map<String, dynamic> json)
      : this.success = json['success'] as bool;
}
