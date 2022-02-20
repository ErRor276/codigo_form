import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/interfaces/cubit_form_state_interface.dart';

class CubitFormBuilder<C extends Cubit<S>, S extends CubitFormState>
    extends StatelessWidget {
  const CubitFormBuilder({
    Key? key,
    required this.formKey,
    required this.cubit,
    required this.builder,
    required this.onSuccess,
    this.loadingWidget,
  }) : super(key: key);

  final C cubit;

  /// this method will run when [AuthCubit] receive valid response from api
  final void Function(S state) onSuccess;
  final Widget Function(C cubit, S state) builder;
  final Widget? loadingWidget;
  final GlobalKey formKey;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<C, S>(
        listener: (context, state) {
          if (state.status == FormStatus.success) onSuccess(state);
        },
        builder: (context, state) {
          final cubit = context.read<C>();

          return Stack(
            children: [
              SafeArea(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: builder(cubit, state),
                  ),
                ),
              ),
              if (state.status == FormStatus.loading)
                loadingWidget ??
                    Container(
                      color: Colors.black.withOpacity(.2),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }
}
