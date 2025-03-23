// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mods_filter_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$modsFilterHash() => r'b1da97a58cbf3bdca6915b28b4d1d0a9e6a066fc';

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

/// See also [modsFilter].
@ProviderFor(modsFilter)
const modsFilterProvider = ModsFilterFamily();

/// See also [modsFilter].
class ModsFilterFamily extends Family<IList<HotlineMiamiMod>> {
  /// See also [modsFilter].
  const ModsFilterFamily();

  /// See also [modsFilter].
  ModsFilterProvider call(IList<HotlineMiamiMod> mods) {
    return ModsFilterProvider(mods);
  }

  @override
  ModsFilterProvider getProviderOverride(
    covariant ModsFilterProvider provider,
  ) {
    return call(provider.mods);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'modsFilterProvider';
}

/// See also [modsFilter].
class ModsFilterProvider extends AutoDisposeProvider<IList<HotlineMiamiMod>> {
  /// See also [modsFilter].
  ModsFilterProvider(IList<HotlineMiamiMod> mods)
    : this._internal(
        (ref) => modsFilter(ref as ModsFilterRef, mods),
        from: modsFilterProvider,
        name: r'modsFilterProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$modsFilterHash,
        dependencies: ModsFilterFamily._dependencies,
        allTransitiveDependencies: ModsFilterFamily._allTransitiveDependencies,
        mods: mods,
      );

  ModsFilterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.mods,
  }) : super.internal();

  final IList<HotlineMiamiMod> mods;

  @override
  Override overrideWith(
    IList<HotlineMiamiMod> Function(ModsFilterRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ModsFilterProvider._internal(
        (ref) => create(ref as ModsFilterRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        mods: mods,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<IList<HotlineMiamiMod>> createElement() {
    return _ModsFilterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ModsFilterProvider && other.mods == mods;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mods.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ModsFilterRef on AutoDisposeProviderRef<IList<HotlineMiamiMod>> {
  /// The parameter `mods` of this provider.
  IList<HotlineMiamiMod> get mods;
}

class _ModsFilterProviderElement
    extends AutoDisposeProviderElement<IList<HotlineMiamiMod>>
    with ModsFilterRef {
  _ModsFilterProviderElement(super.provider);

  @override
  IList<HotlineMiamiMod> get mods => (origin as ModsFilterProvider).mods;
}

String _$modNameFilterHash() => r'0e0f21079d4c3dd7e536a1e92e260b1d4686d9b7';

/// See also [ModNameFilter].
@ProviderFor(ModNameFilter)
final modNameFilterProvider =
    AutoDisposeNotifierProvider<ModNameFilter, ModName>.internal(
      ModNameFilter.new,
      name: r'modNameFilterProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$modNameFilterHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ModNameFilter = AutoDisposeNotifier<ModName>;
String _$modAuthorFilterHash() => r'351f364a07527c52733cee790cb28014e3539e7f';

/// See also [ModAuthorFilter].
@ProviderFor(ModAuthorFilter)
final modAuthorFilterProvider =
    AutoDisposeNotifierProvider<ModAuthorFilter, ModAuthor>.internal(
      ModAuthorFilter.new,
      name: r'modAuthorFilterProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$modAuthorFilterHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ModAuthorFilter = AutoDisposeNotifier<ModAuthor>;
String _$modTypeFilterHash() => r'5caccdbc55980b5e9dcab533956da9b813abfd0c';

/// See also [ModTypeFilter].
@ProviderFor(ModTypeFilter)
final modTypeFilterProvider =
    AutoDisposeNotifierProvider<ModTypeFilter, ModType?>.internal(
      ModTypeFilter.new,
      name: r'modTypeFilterProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$modTypeFilterHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ModTypeFilter = AutoDisposeNotifier<ModType?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
