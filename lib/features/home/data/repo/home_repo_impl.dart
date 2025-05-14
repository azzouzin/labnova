
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failliers.dart';
import '../../../../core/utils/api_service.dart';
import '../model/book_model.dart';
import 'home_repo.dart';
// import 'package:bookly/core/errors/failures.dart';
// import 'package:bookly/features/home/data/datasources/home_local_data_source.dart';
// import 'package:bookly/features/home/data/datasources/home_remote_data_source.dart';
// import 'package:bookly/features/home/domain/entities/book_entity.dart';
// import 'package:bookly/features/home/domain/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  // final HomeRemoteDataSource homeRemoteDataSource;
  // final HomeLocalDataSource homeLocalDataSource;

  ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Faillier, List<BookModel>>> fetchBannerBooks() async {
    try {
      var data = await apiService.get(
          endPoint: '/volumes?q=computer&filtering=free-ebooks&Sorting=newest');
      List<BookModel> books = [];

      for (var element in data.data['items']) {
        books.add(BookModel.fromJson(element));
      }
      return Right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFaillier.fromDioError(e));
      } else {
        return Left(ServerFaillier(e.toString()));
      }
    }
  }

  @override
  Future<Either<Faillier, List<BookModel>>> fetchNewSellerBooks() async {
    try {
      var data =
          await apiService.get(endPoint: '/volumes?q=flowers&orderBy=newest');
      List<BookModel> books = [];
      for (var element in data.data['items']) {
        books.add(BookModel.fromJson(element));
      }
      return Right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFaillier.fromDioError(e));
      } else {
        return Left(ServerFaillier(e.toString()));
      }
    }
  }

  @override
  Future<Either<Faillier, List<BookModel>>> fetchSimmilairBooks(
      String category) async {
    try {
      var data = await apiService.get(
          endPoint: '/volumes?q=$category&sorting=relevance&orderBy=newest');
      List<BookModel> books = [];
      for (var element in data.data['items']) {
        books.add(BookModel.fromJson(element));
      }
      return Right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFaillier.fromDioError(e));
      } else {
        return Left(ServerFaillier(e.toString()));
      }
    }
  }
}
