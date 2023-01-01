part of 'date_bloc.dart';

abstract class DateState extends Equatable {
  DateTime now = DateTime.now();

  DateState({required this.now});
  @override
  List<Object> get props => [now];
}

class DateInitial extends DateState {
  DateInitial({required super.now});
}
