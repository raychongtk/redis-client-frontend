import 'package:equatable/equatable.dart';

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
