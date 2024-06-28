// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$reminderHash() => r'f10b91b3cea1d9aa001a1a13d5fda6b66acfa79f';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$Reminder
    extends BuildlessAutoDisposeAsyncNotifier<ReminderEntity> {
  late final String id;

  FutureOr<ReminderEntity> build({
    required String id,
  });
}

/// See also [Reminder].
@ProviderFor(Reminder)
const reminderProvider = ReminderFamily();

/// See also [Reminder].
class ReminderFamily extends Family<AsyncValue<ReminderEntity>> {
  /// See also [Reminder].
  const ReminderFamily();

  /// See also [Reminder].
  ReminderProvider call({
    required String id,
  }) {
    return ReminderProvider(
      id: id,
    );
  }

  @override
  ReminderProvider getProviderOverride(
    covariant ReminderProvider provider,
  ) {
    return call(
      id: provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'reminderProvider';
}

/// See also [Reminder].
class ReminderProvider
    extends AutoDisposeAsyncNotifierProviderImpl<Reminder, ReminderEntity> {
  /// See also [Reminder].
  ReminderProvider({
    required String id,
  }) : this._internal(
          () => Reminder()..id = id,
          from: reminderProvider,
          name: r'reminderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$reminderHash,
          dependencies: ReminderFamily._dependencies,
          allTransitiveDependencies: ReminderFamily._allTransitiveDependencies,
          id: id,
        );

  ReminderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  FutureOr<ReminderEntity> runNotifierBuild(
    covariant Reminder notifier,
  ) {
    return notifier.build(
      id: id,
    );
  }

  @override
  Override overrideWith(Reminder Function() create) {
    return ProviderOverride(
      origin: this,
      override: ReminderProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<Reminder, ReminderEntity>
      createElement() {
    return _ReminderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ReminderProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ReminderRef on AutoDisposeAsyncNotifierProviderRef<ReminderEntity> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ReminderProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<Reminder, ReminderEntity>
    with ReminderRef {
  _ReminderProviderElement(super.provider);

  @override
  String get id => (origin as ReminderProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
