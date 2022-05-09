import 'package:flutter/material.dart';

import '../../domain/models/list/list_config.dart';
import '../../domain/ui/pages/detail/detail.dart';
import '../../domain/ui/pages/list/list.dart';
import '../driven_adapter/list/list_api.dart';

class Handlers {
  /// Todas las rutas de la app
  Map<String, WidgetBuilder> getRoutes(BuildContext context) => {
        ListPage.routeName: (BuildContext context) => ListPage(
              config: ListConfigModel(homeApi: ListViewApi()),
            ),
        DetailPage.routeName: (BuildContext context) => const DetailPage(),
      };

  /// Ruta inicial de la app
  String getInitialRoute() => ListPage.routeName;
}
