import 'package:equatable/equatable.dart';

abstract class RandomUserEvent extends Equatable {}

class FetchRandomuserEvent extends RandomUserEvent {
  @override
  List<Object> get props => null;
}
