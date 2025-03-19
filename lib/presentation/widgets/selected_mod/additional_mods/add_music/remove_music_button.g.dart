// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remove_music_button.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$removeMusicHash() => r'b2494cff1b0e7f8e97e2324676ebb5ca9f8c7664';

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

/// See also [removeMusic].
@ProviderFor(removeMusic)
const removeMusicProvider = RemoveMusicFamily();

/// See also [removeMusic].
class RemoveMusicFamily extends Family<AsyncValue<void>> {
  /// See also [removeMusic].
  const RemoveMusicFamily();

  /// See also [removeMusic].
  RemoveMusicProvider call(HotlineMiamiMod mod) {
    return RemoveMusicProvider(mod);
  }

  @override
  RemoveMusicProvider getProviderOverride(
    covariant RemoveMusicProvider provider,
  ) {
    return call(provider.mod);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'removeMusicProvider';
}

/// See also [removeMusic].
class RemoveMusicProvider extends AutoDisposeFutureProvider<void> {
  /// See also [removeMusic].
  RemoveMusicProvider(HotlineMiamiMod mod)
    : this._internal(
        (ref) => removeMusic(ref as RemoveMusicRef, mod),
        from: removeMusicProvider,
        name: r'removeMusicProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$removeMusicHash,
        dependencies: RemoveMusicFamily._dependencies,
        allTransitiveDependencies: RemoveMusicFamily._allTransitiveDependencies,
        mod: mod,
      );

  RemoveMusicProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.mod,
  }) : super.internal();

  final HotlineMiamiMod mod;

  @override
  Override overrideWith(
    FutureOr<void> Function(RemoveMusicRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RemoveMusicProvider._internal(
        (ref) => create(ref as RemoveMusicRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        mod: mod,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _RemoveMusicProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RemoveMusicProvider && other.mod == mod;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mod.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RemoveMusicRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `mod` of this provider.
  HotlineMiamiMod get mod;
}

class _RemoveMusicProviderElement extends AutoDisposeFutureProviderElement<void>
    with RemoveMusicRef {
  _RemoveMusicProviderElement(super.provider);

  @override
  HotlineMiamiMod get mod => (origin as RemoveMusicProvider).mod;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
