import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomNavigationBarWidget extends HookConsumerWidget {
  final StatefulNavigationShell navigationShell;

  const BottomNavigationBarWidget({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueChanged<int> handleDestinationSelected =
        useCallback((int index) {
      navigationShell.goBranch(
        index,
        initialLocation: index == navigationShell.currentIndex,
      );
    }, []);

    return NavigationBar(
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline),
          label: 'Account',
        ),
      ],
      selectedIndex: navigationShell.currentIndex,
      onDestinationSelected: handleDestinationSelected,
    );
  }
}
