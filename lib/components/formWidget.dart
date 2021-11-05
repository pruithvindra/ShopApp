import 'package:flutter/material.dart';

import '../style.dart';

class FormWIdget extends StatelessWidget {
  FormWIdget(
      {this.focusnode,
      this.width,
      required this.hintText,
      this.initialvalue,
      this.onsaved,
      this.onvaliadte,
      // required this.onvalidate,
      this.prefixicon,
      // this.maxlines,
      this.obscuretext,
      this.keyboardtype,
      this.onchanged,
      this.onTap,
      this.maxlines,
      this.sufixicon});

  String? initialvalue, hintText;
  FocusNode? focusnode;
  // int? maxlines = 1;
  bool? obscuretext = false;
  Function? onsaved;
  Function? onvaliadte;
  Function? onchanged;
  Function? onTap;
  double? width;
// Function onvalidate;
  Icon? prefixicon;
  Widget? sufixicon;
  TextInputType? keyboardtype = TextInputType.name;
  int? maxlines = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: width! * 0.9,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Style.kBlueGrey.withOpacity(0.3),
              offset: Offset(0, 1),
              blurRadius: 1.0,
              spreadRadius: 1.0)
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: TextFormField(
        onTap: () => onTap!(),
        obscureText: false,
        // maxLines: maxlines,
        initialValue:
            // value['route'] == 3 ? initial_value['selfattestment' ] :
            initialvalue,
        style: TextStyle(color: Colors.black),
        cursorColor: Colors.black,
        decoration: InputDecoration(
          suffixIcon: sufixicon,
          labelStyle: TextStyle(color: Colors.black),
          prefixIcon: prefixicon,
          hintText: hintText,
          filled: true,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: Colors.grey.shade500),
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.transparent, width: 0)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 0),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 0),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        focusNode: focusnode,
        // textInputAction: TextInputAction.done,
        onFieldSubmitted: (_) {},
        keyboardType: keyboardtype,
        validator: (value) => onvaliadte!(value),
        onSaved: (newValue) => onsaved!(newValue),
        onChanged: (newValue) => onchanged!(newValue),
      ),
    );
  }
}
