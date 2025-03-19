// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'hotline_miami_mod.dart';

class HotlineMiamiModMapper extends ClassMapperBase<HotlineMiamiMod> {
  HotlineMiamiModMapper._();

  static HotlineMiamiModMapper? _instance;
  static HotlineMiamiModMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HotlineMiamiModMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'HotlineMiamiMod';

  static ModId _$id(HotlineMiamiMod v) => v.id;
  static const Field<HotlineMiamiMod, ModId> _f$id = Field('id', _$id);
  static ModName _$name(HotlineMiamiMod v) => v.name;
  static const Field<HotlineMiamiMod, ModName> _f$name = Field('name', _$name);
  static ModAuthor _$author(HotlineMiamiMod v) => v.author;
  static const Field<HotlineMiamiMod, ModAuthor> _f$author =
      Field('author', _$author);
  static ModCover? _$cover(HotlineMiamiMod v) => v.cover;
  static const Field<HotlineMiamiMod, ModCover> _f$cover =
      Field('cover', _$cover);
  static ModType _$type(HotlineMiamiMod v) => v.type;
  static const Field<HotlineMiamiMod, ModType> _f$type = Field('type', _$type);
  static ModDirectory _$directory(HotlineMiamiMod v) => v.directory;
  static const Field<HotlineMiamiMod, ModDirectory> _f$directory =
      Field('directory', _$directory);
  static AdditionalFilesDirectory _$additionalFilesDirectory(
          HotlineMiamiMod v) =>
      v.additionalFilesDirectory;
  static const Field<HotlineMiamiMod, AdditionalFilesDirectory>
      _f$additionalFilesDirectory =
      Field('additionalFilesDirectory', _$additionalFilesDirectory);
  static IList<ModFile> _$files(HotlineMiamiMod v) => v.files;
  static const Field<HotlineMiamiMod, IList<ModFile>> _f$files =
      Field('files', _$files, opt: true, def: const IList.empty());
  static ModMusic? _$music(HotlineMiamiMod v) => v.music;
  static const Field<HotlineMiamiMod, ModMusic> _f$music =
      Field('music', _$music, opt: true);

  @override
  final MappableFields<HotlineMiamiMod> fields = const {
    #id: _f$id,
    #name: _f$name,
    #author: _f$author,
    #cover: _f$cover,
    #type: _f$type,
    #directory: _f$directory,
    #additionalFilesDirectory: _f$additionalFilesDirectory,
    #files: _f$files,
    #music: _f$music,
  };

  static HotlineMiamiMod _instantiate(DecodingData data) {
    return HotlineMiamiMod(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        author: data.dec(_f$author),
        cover: data.dec(_f$cover),
        type: data.dec(_f$type),
        directory: data.dec(_f$directory),
        additionalFilesDirectory: data.dec(_f$additionalFilesDirectory),
        files: data.dec(_f$files),
        music: data.dec(_f$music));
  }

  @override
  final Function instantiate = _instantiate;
}

mixin HotlineMiamiModMappable {
  HotlineMiamiModCopyWith<HotlineMiamiMod, HotlineMiamiMod, HotlineMiamiMod>
      get copyWith => _HotlineMiamiModCopyWithImpl(
          this as HotlineMiamiMod, $identity, $identity);
  @override
  bool operator ==(Object other) {
    return HotlineMiamiModMapper.ensureInitialized()
        .equalsValue(this as HotlineMiamiMod, other);
  }

  @override
  int get hashCode {
    return HotlineMiamiModMapper.ensureInitialized()
        .hashValue(this as HotlineMiamiMod);
  }
}

extension HotlineMiamiModValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HotlineMiamiMod, $Out> {
  HotlineMiamiModCopyWith<$R, HotlineMiamiMod, $Out> get $asHotlineMiamiMod =>
      $base.as((v, t, t2) => _HotlineMiamiModCopyWithImpl(v, t, t2));
}

abstract class HotlineMiamiModCopyWith<$R, $In extends HotlineMiamiMod, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {ModId? id,
      ModName? name,
      ModAuthor? author,
      ModCover? cover,
      ModType? type,
      ModDirectory? directory,
      AdditionalFilesDirectory? additionalFilesDirectory,
      IList<ModFile>? files,
      ModMusic? music});
  HotlineMiamiModCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _HotlineMiamiModCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HotlineMiamiMod, $Out>
    implements HotlineMiamiModCopyWith<$R, HotlineMiamiMod, $Out> {
  _HotlineMiamiModCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HotlineMiamiMod> $mapper =
      HotlineMiamiModMapper.ensureInitialized();
  @override
  $R call(
          {ModId? id,
          ModName? name,
          ModAuthor? author,
          Object? cover = $none,
          ModType? type,
          ModDirectory? directory,
          AdditionalFilesDirectory? additionalFilesDirectory,
          IList<ModFile>? files,
          Object? music = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (author != null) #author: author,
        if (cover != $none) #cover: cover,
        if (type != null) #type: type,
        if (directory != null) #directory: directory,
        if (additionalFilesDirectory != null)
          #additionalFilesDirectory: additionalFilesDirectory,
        if (files != null) #files: files,
        if (music != $none) #music: music
      }));
  @override
  HotlineMiamiMod $make(CopyWithData data) => HotlineMiamiMod(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      author: data.get(#author, or: $value.author),
      cover: data.get(#cover, or: $value.cover),
      type: data.get(#type, or: $value.type),
      directory: data.get(#directory, or: $value.directory),
      additionalFilesDirectory: data.get(#additionalFilesDirectory,
          or: $value.additionalFilesDirectory),
      files: data.get(#files, or: $value.files),
      music: data.get(#music, or: $value.music));

  @override
  HotlineMiamiModCopyWith<$R2, HotlineMiamiMod, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _HotlineMiamiModCopyWithImpl($value, $cast, t);
}
