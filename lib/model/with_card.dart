import 'package:equatable/equatable.dart';

class WithCard extends Equatable {
  final int id;
  final String title;
  final String name;
  final String imageUrl;
  final String logoUrl;

  const WithCard({this.id, this.title, this.name, this.imageUrl, this.logoUrl});

  @override
  List<Object> get props => [id, title, name, imageUrl, logoUrl];

  @override
  String toString() => 'WithCard { id: $id }';
}
