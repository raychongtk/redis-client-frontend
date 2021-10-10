import 'package:equatable/equatable.dart';
import 'package:redis_client/common/redis_key_type.dart';

class RedisClientState extends Equatable {
  @override
  List<Object> get props => [];
}

class Uninitialized extends RedisClientState {}

class RedisConnected extends RedisClientState {}

class RedisKeysFetched extends RedisClientState {
  final List<String> keys;

  RedisKeysFetched(this.keys);

  @override
  List<Object> get props => [this.keys];
}

class RedisKeyTypeFetched extends RedisClientState {
  final String key;
  final RedisDataType dataType;

  RedisKeyTypeFetched(this.key, this.dataType);

  @override
  List<Object> get props => [this.key, this.dataType];
}

class RedisStringFetched extends RedisClientState {
  final String value;

  RedisStringFetched(this.value);

  @override
  List<Object> get props => [this.value];
}
