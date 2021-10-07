import 'package:equatable/equatable.dart';

class RedisClientEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ConnectRedis extends RedisClientEvent {
  final String hostname;
  final String port;

  ConnectRedis(this.hostname, this.port);

  @override
  List<Object> get props => [this.hostname, this.port];
}

class FetchRedisKeys extends RedisClientEvent {
  final String pattern;

  FetchRedisKeys({this.pattern = ""});

  @override
  List<Object> get props => [this.pattern];
}
