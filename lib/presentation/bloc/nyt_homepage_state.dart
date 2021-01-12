import 'package:equatable/equatable.dart';
import 'package:nyt_client_bloc_moor/data/moor/moor_database.dart';

abstract class NYTLoadHomePageState extends Equatable {
  const NYTLoadHomePageState();

  @override
  List<Object> get props => [];
}

class NYTLoadHomePageStateLoading extends NYTLoadHomePageState {}

class NYTLoadHomePageStateSuccess extends NYTLoadHomePageState {
  final List<NYTMainPageTableData> items;

  const NYTLoadHomePageStateSuccess(this.items);

  @override
  List<Object> get props => [items];

  @override
  String toString() => 'NYTLoadHomePageStateSuccess { items: ${items.length} }';
}

class NYTLoadHomePageStateError extends NYTLoadHomePageState {
  final String error;

  const NYTLoadHomePageStateError(this.error);

  @override
  List<Object> get props => [error];
}
