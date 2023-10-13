import 'package:dio_hub/common/animations/scale_expanded_widget.dart';
import 'package:dio_hub/view/authentication/widgets/base_auth_dialog.dart';
import 'package:flutter/material.dart';

class SuccessPopup extends StatelessWidget {
  const SuccessPopup({super.key});
  @override
  Widget build(final BuildContext context) => ScaleExpandedSection(
        child: BaseAuthDialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Successful.',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const Divider(
                height: 32,
              ),
              Text(
                'Authentication completed successfully.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Divider(
                height: 32,
              ),
              Center(
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Tap here to close',
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
        ),
      );
}
