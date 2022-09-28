import 'package:equatable/equatable.dart';

class ProfileInfo extends Equatable {
  final String mobile;
  final String name;

  const ProfileInfo({required this.mobile, required this.name});

  @override
  List<Object?> get props => [mobile, name];
}

 
/**{
    "mobile": "05987654321",
    "name": "Khalifa"
} */