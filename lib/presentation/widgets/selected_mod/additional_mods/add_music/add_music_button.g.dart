// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_music_button.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addMusicHash() => r'954a6d03bee2ff87ba95405452936f333ffeca9b';

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

/// See also [addMusic].
@ProviderFor(addMusic)
const addMusicProvider = AddMusicFamily();

/// See also [addMusic].
class AddMusicFamily extends Family<AsyncValue<void>> {
  /// See also [addMusic].
  const AddMusicFamily();

  /// See also [addMusic].
  AddMusicProvider call(HotlineMiamiMod mod, XFile music) {
    return AddMusicProvider(mod, music);
  }

  @override
  AddMusicProvider getProviderOverride(covariant AddMusicProvider provider) {
    return call(provider.mod, provider.music);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'addMusicProvider';
}

/// See also [addMusic].
class AddMusicProvider extends AutoDisposeFutureProvider<void> {
  /// See also [addMusic].
  AddMusicProvider(HotlineMiamiMod mod, XFile music)
    : this._internal(
        (ref) => addMusic(ref as AddMusicRef, mod, music),
        from: addMusicProvider,
        name: r'addMusicProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$addMusicHash,
        dependencies: AddMusicFamily._dependencies,
        allTransitiveDependencies: AddMusicFamily._allTransitiveDependencies,
        mod: mod,
        music: music,
      );

  AddMusicProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.mod,
    required this.music,
  }) : super.internal();

  final HotlineMiamiMod mod;
  final XFile music;

  @override
  Override overrideWith(FutureOr<void> Function(AddMusicRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: AddMusicProvider._internal(
        (ref) => create(ref as AddMusicRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        mod: mod,
        music: music,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _AddMusicProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddMusicProvider &&
        other.mod == mod &&
        other.music == music;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mod.hashCode);
    hash = _SystemHash.combine(hash, music.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AddMusicRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `mod` of this provider.
  HotlineMiamiMod get mod;

  /// The parameter `music` of this provider.
  XFile get music;
}

class _AddMusicProviderElement extends AutoDisposeFutureProviderElement<void>
    with AddMusicRef {
  _AddMusicProviderElement(super.provider);

  @override
  HotlineMiamiMod get mod => (origin as AddMusicProvider).mod;
  @override
  XFile get music => (origin as AddMusicProvider).music;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
