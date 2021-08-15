import 'package:equatable/equatable.dart';

class RedisClientEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchRedisKeys extends RedisClientEvent {
  final String pattern;

  FetchRedisKeys({this.pattern = ""});

  @override
  List<Object> get props => [this.pattern];
}
