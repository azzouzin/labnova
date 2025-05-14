part of 'simmilair_books_cubit.dart';

sealed class SimmilairBooksState extends Equatable {
  const SimmilairBooksState();

  @override
  List<Object> get props => [];
}

final class SimmilairBooksInitial extends SimmilairBooksState {}

final class SimmailairBooksLoading extends SimmilairBooksState {}

final class SimmailairBooksSuccess extends SimmilairBooksState {
  final List<BookModel> books;
  const SimmailairBooksSuccess(this.books);
}

final class SimmailairBooksFailure extends SimmilairBooksState {
  final String errMessage;
  const SimmailairBooksFailure(this.errMessage);
}
