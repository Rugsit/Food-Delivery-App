import 'package:ecommerce_project/core/error/failures.dart';
import 'package:ecommerce_project/features/home/data/models/category.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@injectable
class HomeRemoteDataSource {
  HomeRemoteDataSource(this.supabase);
  final SupabaseClient supabase;

  Future<Either<Failure, List<CategoryModel>>> fetchCategories() async {
    try {
      final response = await supabase.from("category_food").select("*");
      if (response.isEmpty) {
        return Either.left(
          FetchFailure(errorMessage: 'No categories found in the database'),
        );
      } else {
        final List<CategoryModel> categories =
            response.map((item) {
              return CategoryModel.fromJson(item);
            }).toList();
        return Either.right(categories);
      }
    } on PostgrestException catch (e) {
      return Either.left(FetchFailure(errorMessage: e.message));
    } on Exception catch (e) {
      return Either.left(FetchFailure(errorMessage: e.toString()));
    }
  }

}
