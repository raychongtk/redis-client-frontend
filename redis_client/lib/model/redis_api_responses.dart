import 'package:enum_to_string/enum_to_string.dart';
import 'package:equatable/equatable.dart';
import 'package:redis_client/common/redis_key_type.dart';

class GetRedisKeysResponse extends Equatable {
  final List<String> keys;

  GetRedisKeysResponse(this.keys);

  @override
  List<Object> get props => [this.keys];

  GetRedisKeysResponse.fromJson(Map<String, dynamic> json)
      : this.keys = (json['keys'] as List).map((q) => q as String).toList();
}

class GetKeyTypeResponse extends Equatable {
  final RedisDataType dataType;

  GetKeyTypeResponse(this.dataType);

  @override
  List<Object> get props => [this.dataType];

  GetKeyTypeResponse.fromJson(Map<String, dynamic> json)
      : this.dataType =
            EnumToString.fromString(RedisDataType.values, json['type'])
                as RedisDataType;
}

class ConnectRedisResponse extends Equatable {
  final bool success;

  ConnectRedisResponse(this.success);

  @override
  List<Object> get props => [this.success];

  ConnectRedisResponse.fromJson(Map<String, dynamic> json)
      : this.success = json['success'] as bool;
}
