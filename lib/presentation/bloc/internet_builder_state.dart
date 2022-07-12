part of 'internet_builder_bloc.dart';

abstract class InternetBuilderState extends Equatable {
  const InternetBuilderState();

  @override
  List<Object> get props => [];
}

class CheckConnectionInitialState extends InternetBuilderState {
  const CheckConnectionInitialState();

  @override
  List<Object> get props => [];
}

class CheckConnectionErrorState extends InternetBuilderState {
  final String message;

  const CheckConnectionErrorState(this.message);

  @override
  List<Object> get props => [];
}

class ConnectionStreamRetrievedState extends InternetBuilderState {
  final Stream<InternetConnectionStatus> connectionStream;

  const ConnectionStreamRetrievedState(this.connectionStream);

  @override
  List<Object> get props => [];
}
