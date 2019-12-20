import 'package:flutter/material.dart';
import 'package:footprint_calculator/menu/bloc/main_navigation_bloc.dart';

class AgresteAppBar extends StatelessWidget implements PreferredSizeWidget {

  final MainNavigationBloc bloc;

  AgresteAppBar({Key key, this.bloc});

  @override
  Widget build(BuildContext context) {
    return AppBar();
  }

  @override
  Size get preferredSize => Size.fromHeight(70);
}
