import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:onehub/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:onehub/common/animations/size_expanded_widget.dart';
import 'package:onehub/common/button.dart';
import 'package:onehub/style/colors.dart';

class LoginPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizeExpandedSection(
      animationCurve: Curves.easeOutCirc,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Login.',
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Divider(
            height: 32,
          ),
          Text(
            'You need to login using your GitHub account for the full experience.',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Divider(
            height: 32,
          ),
          StringButton(
            title: 'Login with GitHub',
            leadingIcon: Icon(
              Octicons.mark_github,
              color: Colors.white,
            ),
            color: AppColor.onBackground,
            onTap: () async {
              BlocProvider.of<AuthenticationBloc>(context)
                  .add(RequestDeviceCode());
            },
          ),
        ],
      ),
    );
  }
}
