import 'package:equatable/equatable.dart';

class GetStringValueResponse extends Equatable {
  final String value;

  GetStringValueResponse(this.value);

  @override
  List<Object> get props => [this.value];

  GetStringValueResponse.fromJson(Map<String, dynamic> json)
      : this.value = json['value'];
}
