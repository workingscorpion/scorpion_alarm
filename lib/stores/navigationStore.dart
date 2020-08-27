import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:scorpion_alarm_app/utils/lazy.dart';

part 'navigationStore.g.dart';

class NavigationStore extends NavigationStoreBase with _$NavigationStore {
  static final Lazy<NavigationStore> _lazy =
      Lazy<NavigationStore>(() => NavigationStore._());
  static NavigationStore get instance => _lazy.instance;

  NavigationStore._();
}

abstract class NavigationStoreBase with Store {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @observable
  String currentRouteName;

  @action
  reset(
    String routeName, {
    RoutePredicate predicate,
    Object arguments,
  }) {
    navigatorKey.currentState.pushNamedAndRemoveUntil(
      routeName,
      predicate ?? (_) => false,
      arguments: arguments,
    );

    currentRouteName = routeName;
  }

  @action
  push(String routeName, {Object arguments}) {
    navigatorKey.currentState.pushNamed(routeName, arguments: arguments);
    currentRouteName = routeName;
  }

  @action
  pushNamedAndRemoveUntil(String routeName,
          {RoutePredicate predicate, Object arguments}) =>
      navigatorKey.currentState.pushNamedAndRemoveUntil(
          routeName, predicate ?? (_) => false,
          arguments: arguments);

  @action
  pushNamed(String routeName, {Object arguments}) =>
      navigatorKey.currentState.pushNamed(routeName, arguments: arguments);

  @action
  pop() => navigatorKey.currentState.pop();
}
