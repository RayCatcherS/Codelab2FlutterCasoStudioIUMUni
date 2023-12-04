import 'package:provider/provider.dart';

import 'my_app_state.dart';

class AppProvider {

  static List<ChangeNotifierProvider> getAppStates() {
    List<ChangeNotifierProvider> provider = [];

    provider.add(
      ChangeNotifierProvider<MyAppState>(create: (_) => MyAppState())
    );


    return provider;
  }
}
