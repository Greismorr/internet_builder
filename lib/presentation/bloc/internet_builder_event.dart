part of 'internet_builder_bloc.dart';

abstract class InternetBuilderEvent extends Equatable {
  const InternetBuilderEvent();
}

class GetConnectionStream extends InternetBuilderEvent {
  const GetConnectionStream();

  @override
  List<Object?> get props => [];
}
