import 'package:provider/provider.dart';

import 'authentication_state.dart';
import 'my_app_state.dart';

class AppProvider {

  static List<ChangeNotifierProvider> getAppStates() {
    List<ChangeNotifierProvider> provider = [];

    provider.add(
      ChangeNotifierProvider<MyAppState>(create: (_) => MyAppState())
    );
    provider.add(
      ChangeNotifierProvider<AuthenticationState>(create: (_) => AuthenticationState())
    );


    return provider;
  }
}
