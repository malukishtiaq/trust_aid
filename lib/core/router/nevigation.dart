import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import 'routing.dart';

abstract class INavigationService {
  void register(BuildContext context);
  void forgotPassword(BuildContext context);
  void home(BuildContext context);
}

@Injectable(as: INavigationService)
class NavigationService implements INavigationService {
  @override
  void forgotPassword(BuildContext context) {
    context.push('/${AppRoutes.forgotPassword}');
  }

  @override
  void register(BuildContext context) {
    context.push('/${AppRoutes.register}');
  }

  @override
  void home(BuildContext context) {
    context.push('/${AppRoutes.home}');
  }
}

extension NavigationContext on BuildContext {
  INavigationService get navigate => GetIt.instance<INavigationService>();
}
