import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/book_model.dart';
import '../../../data/repo/home_repo_impl.dart';

part 'simmilair_books_state.dart';

class HomeCubit extends Cubit<SimmilairBooksState> {
  HomeRepoImpl homeRepoImpl;

  HomeCubit(this.homeRepoImpl) : super(SimmilairBooksInitial());
  Future<void> fetchSamilarBooks(String category) async {
    emit(SimmailairBooksLoading());
    var result = await homeRepoImpl.fetchSimmilairBooks(category);
    result.fold((failure) {
      emit(SimmailairBooksFailure(failure.message));
    }, (books) {
      emit(SimmailairBooksSuccess(books));
    });
  }
}
