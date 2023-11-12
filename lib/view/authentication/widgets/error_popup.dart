import 'package:diohub/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:diohub/common/animations/scale_expanded_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorPopup extends StatelessWidget {
  const ErrorPopup(this.error, {super.key});
  final String error;
  @override
  Widget build(final BuildContext context) => ScaleExpandedSection(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Divider(
              height: 32,
            ),
            Text(
              'Error'.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const Divider(
              height: 32,
            ),
            Text(
              error,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Divider(
              height: 32,
            ),
            Center(
              child: MaterialButton(
                onPressed: () {
                  BlocProvider.of<AuthenticationBloc>(context)
                      .add(ResetStates());
                },
                child: const Text(
                  'Retry',
                  style: TextStyle(
                      // color: Provider.of<PaletteSettings>(context)
                      //     .currentSetting
                      //     .baseElements,
                      ),
                ),
              ),
            ),
          ],
        ),
      );
}
