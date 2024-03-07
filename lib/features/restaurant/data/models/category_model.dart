import 'package:hackathon_msa_clean_architecture_bloc/features/restaurant/domain/entities/category_entity.dart';

class Category extends CategoryEntity {
  Category({required super.alias, required super.title});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      alias: json['alias'] ?? '',
      title: json['title'] ?? '',
    );
  }
}
