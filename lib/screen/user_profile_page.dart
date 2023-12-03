import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/my_app_state.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    MyAppState appState = context.watch<MyAppState>();
    
    final theme = Theme.of(context); 
    /// textStyle usato per il titolo pagina
    final TextStyle textStyle = theme.textTheme.headlineSmall!.copyWith(
      color: theme.colorScheme.secondary,
    );
    
    return Container(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("User Profile Page", style: textStyle),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    appState.signoutFirebase();
                  }, 
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.logout_outlined),
                      SizedBox(width: 10),
                      Text("Logout User")
                    ],
                  )
                ),
                ElevatedButton(
                  onPressed: () {

                  }, 
                  child: Text("Debug")
                ),
                Spacer()
              ],
            ),
          ),
        ),
      );
  }
}