import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../domain/usecases/check_connection_usecase.dart';

part 'internet_builder_event.dart';
part 'internet_builder_state.dart';

class InternetBuilderBloc
    extends Bloc<InternetBuilderEvent, InternetBuilderState> {
  InternetBuilderBloc()
      : super(
          (const CheckConnectionInitialState()),
        ) {
    on<GetConnectionStream>(
      (event, emit) async {
        CheckConnectionUseCase checkConnectionUseCase =
            Modular.get<CheckConnectionUseCase>();

        var checkConnectionUseCaseResult = await checkConnectionUseCase.call();

        checkConnectionUseCaseResult.fold(
          (error) => emit(
            CheckConnectionErrorState(error.message),
          ),
          (success) {
            emit(ConnectionStreamRetrievedState(success));
          },
        );
      },
    );
  }
}
