import 'package:equatable/equatable.dart';

class Onboarding extends Equatable {
  final String title;
  final String asset;
  final String description;

   const Onboarding({
    required this.title,
    required this.asset,
    required this.description,
  });

  @override
  List<Object?> get props => [title,description,asset];
}
