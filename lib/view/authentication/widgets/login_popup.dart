import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:dio_hub/common/animations/scale_expanded_widget.dart';
import 'package:dio_hub/common/misc/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class LoginPopup extends StatelessWidget {
  const LoginPopup({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScaleExpandedSection(
      child: StringButton(
        title: 'Login with GitHub',
        leadingIcon: Icon(
          Octicons.mark_github,
          color:
              Provider.of<PaletteSettings>(context).currentSetting.baseElements,
        ),
        color:
            Provider.of<PaletteSettings>(context).currentSetting.onBackground,
        onTap: () async {
          BlocProvider.of<AuthenticationBloc>(context).add(RequestDeviceCode());
        },
      ),
    );
  }
}
