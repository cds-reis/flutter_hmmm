// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mod_files_drop_target.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addModFilesHash() => r'f0efe3ed178343dd7fd82b6361e2ba52ed9de5ae';

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

/// See also [addModFiles].
@ProviderFor(addModFiles)
const addModFilesProvider = AddModFilesFamily();

/// See also [addModFiles].
class AddModFilesFamily extends Family<AsyncValue<void>> {
  /// See also [addModFiles].
  const AddModFilesFamily();

  /// See also [addModFiles].
  AddModFilesProvider call(HotlineMiamiMod mod, IList<XFile> files) {
    return AddModFilesProvider(mod, files);
  }

  @override
  AddModFilesProvider getProviderOverride(
    covariant AddModFilesProvider provider,
  ) {
    return call(provider.mod, provider.files);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'addModFilesProvider';
}

/// See also [addModFiles].
class AddModFilesProvider extends AutoDisposeFutureProvider<void> {
  /// See also [addModFiles].
  AddModFilesProvider(HotlineMiamiMod mod, IList<XFile> files)
    : this._internal(
        (ref) => addModFiles(ref as AddModFilesRef, mod, files),
        from: addModFilesProvider,
        name: r'addModFilesProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$addModFilesHash,
        dependencies: AddModFilesFamily._dependencies,
        allTransitiveDependencies: AddModFilesFamily._allTransitiveDependencies,
        mod: mod,
        files: files,
      );

  AddModFilesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.mod,
    required this.files,
  }) : super.internal();

  final HotlineMiamiMod mod;
  final IList<XFile> files;

  @override
  Override overrideWith(
    FutureOr<void> Function(AddModFilesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddModFilesProvider._internal(
        (ref) => create(ref as AddModFilesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        mod: mod,
        files: files,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _AddModFilesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddModFilesProvider &&
        other.mod == mod &&
        other.files == files;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mod.hashCode);
    hash = _SystemHash.combine(hash, files.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AddModFilesRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `mod` of this provider.
  HotlineMiamiMod get mod;

  /// The parameter `files` of this provider.
  IList<XFile> get files;
}

class _AddModFilesProviderElement extends AutoDisposeFutureProviderElement<void>
    with AddModFilesRef {
  _AddModFilesProviderElement(super.provider);

  @override
  HotlineMiamiMod get mod => (origin as AddModFilesProvider).mod;
  @override
  IList<XFile> get files => (origin as AddModFilesProvider).files;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
