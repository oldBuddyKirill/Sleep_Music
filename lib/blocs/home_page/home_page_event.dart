part of 'home_page_bloc.dart';

@immutable
abstract class HomePageEvent {}

class OnRefreshTap extends HomePageEvent{}

class StartedApplication extends HomePageEvent{}
