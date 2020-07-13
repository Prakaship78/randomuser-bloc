import 'package:equatable/equatable.dart';
import 'package:randomuserbloc/data/models/api_result_model.dart';
import 'package:meta/meta.dart';

abstract class RandomUserState extends Equatable {}

class RandomUserInitialState extends RandomUserState {
  @override
  List<Object> get props => [];
}

class RandomUserLoadingState extends RandomUserState {
  @override
  List<Object> get props => [];
}

class RandomUserLoadedlState extends RandomUserState {
  List results;
  RandomUserLoadedlState({@required this.results});
  @override
  List<Object> get props => throw UnimplementedError();
}

class RandomUserErrorState extends RandomUserState {
  String message;
  RandomUserErrorState({@required this.message});
  @override
  List<Object> get props => throw UnimplementedError();
}
