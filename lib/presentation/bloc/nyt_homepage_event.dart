import 'package:equatable/equatable.dart';

abstract class NYTLoadHomePageEvent  extends Equatable{
  const NYTLoadHomePageEvent();
  @override
  List<Object> get props => [];
}

class LoadNYTMainPage extends NYTLoadHomePageEvent {}

class UpdateNYTMainPage extends NYTLoadHomePageEvent {}
