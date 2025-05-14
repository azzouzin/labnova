import 'package:dartz/dartz.dart';

import '../../../../core/errors/failliers.dart';
import '../model/book_model.dart';

abstract class HomeRepo {
  Future<Either<Faillier, List<BookModel>>> fetchNewSellerBooks();
  Future<Either<Faillier, List<BookModel>>> fetchBannerBooks();
  Future<Either<Faillier, List<BookModel>>> fetchSimmilairBooks(
      String catagory);
}
