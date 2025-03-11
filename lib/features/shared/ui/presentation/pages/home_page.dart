import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_example/config/routes/route_names.dart';
import 'package:flutter_firebase_example/features/shared/ui/presentation/bloc/ui_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<UiBloc, UiState>(
        listener: (BuildContext context, UiState state) {
          debugPrint('UiBloc BlockListener - OUTSIDE');
          if (state.isUserAuthenticated) {
            // Do something - NEXT
            debugPrint('UiBloc BlockListener - INSIDE 1');
          } else {
            // Logout
            debugPrint('UiBloc BlockListener - INSIDE 2');
            context.goNamed(RouteNames.login);
          }
        },
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('User was authenticated successfully'),
                SizedBox(height: 25),
                IconButton(
                  onPressed: () {
                    BlocProvider.of<UiBloc>(
                      context,
                      listen: false,
                    ).add(UserLogoutEvent());
                  },
                  icon: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Logout User'),
                      SizedBox(width: 25),
                      Icon(Icons.logout),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
