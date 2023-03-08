part of 'cekimagepoint_bloc.dart';

abstract class CekimagepointState extends Equatable {
  @override
  List<Object> get props => [];
}

class CekimagepointInitial extends CekimagepointState {}

class LoadedImagePoint extends CekimagepointInitial {}

class LoadingImagePoint extends CekimagepointInitial {}

class ErrorImagePoint extends CekimagepointInitial {}
