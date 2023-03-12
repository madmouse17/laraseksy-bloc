part of 'saveimagepointbloc_bloc.dart';

class SaveimagepointblocEvent extends Equatable {
  String imagePoint;
  SaveimagepointblocEvent({required this.imagePoint});
  @override
  List<Object> get props => [imagePoint];
}
