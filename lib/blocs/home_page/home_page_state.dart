part of 'home_page_bloc.dart';

@immutable
abstract class HomePageState {}

class HomePageLoading extends HomePageState {}

class HomePageInitial extends HomePageState {}

class HomePageShowData extends HomePageState {
  final List<MyTileData> data;
  HomePageShowData(this.data);
}

class HomePageError extends HomePageState {
  final Object error;
  HomePageError(this.error);
}
