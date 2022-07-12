import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../bloc/internet_builder_bloc.dart';

class InternetBuilderWidget extends StatefulWidget {
  final Widget showWhenDisconnected;
  final Widget showWhenConnected;

  const InternetBuilderWidget(
      {Key? key,
      required this.showWhenConnected,
      required this.showWhenDisconnected})
      : super(key: key);

  @override
  State<InternetBuilderWidget> createState() => _InternetFailureWidgetState();
}

class _InternetFailureWidgetState extends State<InternetBuilderWidget> {
  final InternetBuilderBloc internetBuilderBloc = InternetBuilderBloc();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocListener(
        bloc: internetBuilderBloc..add(const GetConnectionStream()),
        listener: (context, state) {
          if (state is CheckConnectionErrorState) {
            if (kDebugMode) {
              print(
                "Connection Check Package Error: ${state.message}",
              );
            }
          }
        },
        child: BlocBuilder<InternetBuilderBloc, InternetBuilderState>(
          bloc: internetBuilderBloc,
          builder: (context, state) {
            if (state is ConnectionStreamRetrievedState) {
              return StreamBuilder(
                stream: state.connectionStream,
                builder: (context,
                    AsyncSnapshot<InternetConnectionStatus> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data ==
                        InternetConnectionStatus.disconnected) {
                      return widget.showWhenDisconnected;
                    }
                  }

                  return widget.showWhenConnected;
                },
              );
            }

            return widget.showWhenConnected;
          },
        ),
      ),
    );
  }
}
