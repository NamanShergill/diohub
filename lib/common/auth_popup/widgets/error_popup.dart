import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onehub/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:onehub/common/animations/scale_expanded_widget.dart';
import 'package:onehub/common/auth_popup/widgets/base_auth_dialog.dart';

class ErrorPopup extends StatelessWidget {
  final String error;
  ErrorPopup(this.error);
  @override
  Widget build(BuildContext context) {
    return ScaleExpandedSection(
      child: BaseAuthDialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Error.',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Divider(
              height: 32,
            ),
            Text(
              error,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Divider(
              height: 32,
            ),
            Center(
              child: MaterialButton(
                onPressed: () {
                  BlocProvider.of<AuthenticationBloc>(context)
                      .add(ResetStates());
                },
                child: Text(
                  'Retry',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
