import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shopapp/providers/repo.dart';
import 'package:shopapp/providers/themeprovider.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final provider = Provider.of<ThemeProvider>(context, listen: false);
    return GestureDetector(
      onTap: () {
        print('object');
        provider.toggleTheme(!themeProvider.isDarkMode);
      },
      child: CircleAvatar(
          backgroundColor:
              themeProvider.isDarkMode ? Colors.white : Colors.black,
          child: themeProvider.isDarkMode
              ? Icon(
                  Icons.brightness_4_outlined,
                  color: Colors.orange,
                )
              : Icon(
                  Icons.brightness_2_outlined,
                  color: Colors.white,
                )),
    );

    // return Switch.adaptive(
    //   value: themeProvider.isDarkMode,
    //   onChanged: (value) {
    //     final provider = Provider.of<ThemeProvider>(context, listen: false);
    //     provider.toggleTheme(value);
    //   },
    // );
  }
}
