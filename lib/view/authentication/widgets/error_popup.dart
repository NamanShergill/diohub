import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:dio_hub/common/animations/scale_expanded_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ErrorPopup extends StatelessWidget {
  final String error;
  const ErrorPopup(this.error, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScaleExpandedSection(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Divider(
            height: 32,
          ),
          Text(
            'Error'.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const Divider(
            height: 32,
          ),
          Text(
            error,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const Divider(
            height: 32,
          ),
          Center(
            child: MaterialButton(
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context).add(ResetStates());
              },
              child: Text(
                'Retry',
                style: TextStyle(
                    color: Provider.of<PaletteSettings>(context)
                        .currentSetting
                        .baseElements),
              ),
            ),
          )
        ],
      ),
    );
  }
}
