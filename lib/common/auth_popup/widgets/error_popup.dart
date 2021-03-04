import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onehub/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:onehub/common/animations/size_expanded_widget.dart';

class ErrorPopup extends StatelessWidget {
  final String error;
  ErrorPopup(this.error);
  @override
  Widget build(BuildContext context) {
    return SizeExpandedSection(
      animationCurve: Curves.easeOutCirc,
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
                BlocProvider.of<AuthenticationBloc>(context).add(ResetStates());
              },
              child: Text(
                'Retry',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
