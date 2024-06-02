import 'package:flutter/material.dart';

TextStyle univaBold24Dark(BuildContext context) =>
    Theme.of(context).textTheme.titleLarge!;

TextStyle univaBold18Dark(BuildContext context) =>
    Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18);

TextStyle univaRegular12Dark(BuildContext context) =>
    Theme.of(context).textTheme.headlineLarge!;

TextStyle poppinsRegular12Dark(BuildContext context) =>
    Theme.of(context).textTheme.headlineMedium!;

TextStyle poppinsMedium14Dark(BuildContext context) =>
    Theme.of(context).textTheme.headlineSmall!;

TextStyle s14W400Dark(BuildContext context) =>
    Theme.of(context).textTheme.bodyLarge!;

TextStyle s14W700Dark(BuildContext context) =>
    Theme.of(context).textTheme.bodyMedium!;
