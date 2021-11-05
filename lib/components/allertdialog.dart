import 'package:flutter/material.dart';

showAlertDialog({BuildContext? context, Function? continuef, String? title}) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.pop(context!);
    },
  );
  Widget continueButton = TextButton(
    child: Text("Continue"),
    onPressed: () {
      continuef!();
      Navigator.pop(context!);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title ?? "Delete"),
    content: Text("are you sure?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context as BuildContext,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
