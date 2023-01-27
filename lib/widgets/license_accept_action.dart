// /*
//     Gravity Bridge is a UI for interacting with the gravity chain.
//     Copyright (C) 2023  blockscape Finance AG, Switzerland
//
//     This program is free software: you can redistribute it and/or modify
//     it under the terms of the GNU General Public License as published by
//     the Free Software Foundation, either version 3 of the License, or
//     (at your option) any later version.
//
//     This program is distributed in the hope that it will be useful,
//     but WITHOUT ANY WARRANTY; without even the implied warranty of
//     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//     GNU General Public License for more details.
//
//     You should have received a copy of the GNU General Public License
//     along with this program.  If not, see <https://www.gnu.org/licenses/>.
// */

import 'package:flutter/material.dart';
import 'package:gravity_bridge_flutter/widgets/buttons/alert_dialog_outlined_button.dart';

class LicenceAcceptAction extends StatefulWidget {
  final String checkBoxText;
  final String acceptButtonText;
  final void Function() onAccept;

  const LicenceAcceptAction({
    Key? key,
    required this.checkBoxText,
    required this.acceptButtonText,
    required this.onAccept,
  }) : super(key: key);

  @override
  _LicenceAcceptActionState createState() => _LicenceAcceptActionState();
}

class _LicenceAcceptActionState extends State<LicenceAcceptAction> {
  late bool _accepted;

  @override
  void initState() {
    super.initState();
    _accepted = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(8.0),
            child: Row(
              children: [
                Checkbox(
                    activeColor: Theme.of(context).colorScheme.primary,
                    splashRadius: 0,
                    value: _accepted,
                    onChanged: (val) {
                      setState(() {
                        _accepted = val == true;
                      });
                    }),
                Expanded(
                  child: Text(
                    widget.checkBoxText,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                )
              ],
            ),
            onTap: () {
              setState(() {
                _accepted = !_accepted;
              });
            },
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: AlertDialogOutlinedButton(
            disabled: !_accepted,
            child: Text(
              widget.acceptButtonText,
              style: Theme.of(context).textTheme.button,
            ),
            onPressed: () {
              if (_accepted) widget.onAccept();
            },
          ),
        ),
      ],
    );
  }
}
