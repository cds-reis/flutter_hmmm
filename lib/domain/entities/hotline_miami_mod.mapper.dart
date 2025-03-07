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

  static HotlineMiamiModName _$name(HotlineMiamiMod v) => v.name;
  static const Field<HotlineMiamiMod, HotlineMiamiModName> _f$name =
      Field('name', _$name);
  static HotlineMiamiModPath _$path(HotlineMiamiMod v) => v.path;
  static const Field<HotlineMiamiMod, HotlineMiamiModPath> _f$path =
      Field('path', _$path);
  static CustomModMusic? _$music(HotlineMiamiMod v) => v.music;
  static const Field<HotlineMiamiMod, CustomModMusic> _f$music =
      Field('music', _$music);
  static List<AdditionalModFile> _$additionalFiles(HotlineMiamiMod v) =>
      v.additionalFiles;
  static const Field<HotlineMiamiMod, List<AdditionalModFile>>
      _f$additionalFiles = Field('additionalFiles', _$additionalFiles);

  @override
  final MappableFields<HotlineMiamiMod> fields = const {
    #name: _f$name,
    #path: _f$path,
    #music: _f$music,
    #additionalFiles: _f$additionalFiles,
  };

  static HotlineMiamiMod _instantiate(DecodingData data) {
    return HotlineMiamiMod(
        name: data.dec(_f$name),
        path: data.dec(_f$path),
        music: data.dec(_f$music),
        additionalFiles: data.dec(_f$additionalFiles));
  }

  @override
  final Function instantiate = _instantiate;

  static HotlineMiamiMod fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HotlineMiamiMod>(map);
  }

  static HotlineMiamiMod fromJson(String json) {
    return ensureInitialized().decodeJson<HotlineMiamiMod>(json);
  }
}

mixin HotlineMiamiModMappable {
  String toJson() {
    return HotlineMiamiModMapper.ensureInitialized()
        .encodeJson<HotlineMiamiMod>(this as HotlineMiamiMod);
  }

  Map<String, dynamic> toMap() {
    return HotlineMiamiModMapper.ensureInitialized()
        .encodeMap<HotlineMiamiMod>(this as HotlineMiamiMod);
  }

  HotlineMiamiModCopyWith<HotlineMiamiMod, HotlineMiamiMod, HotlineMiamiMod>
      get copyWith => _HotlineMiamiModCopyWithImpl(
          this as HotlineMiamiMod, $identity, $identity);
  @override
  String toString() {
    return HotlineMiamiModMapper.ensureInitialized()
        .stringifyValue(this as HotlineMiamiMod);
  }

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
  ListCopyWith<$R, AdditionalModFile,
          ObjectCopyWith<$R, AdditionalModFile, AdditionalModFile>>
      get additionalFiles;
  $R call(
      {HotlineMiamiModName? name,
      HotlineMiamiModPath? path,
      CustomModMusic? music,
      List<AdditionalModFile>? additionalFiles});
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
  ListCopyWith<$R, AdditionalModFile,
          ObjectCopyWith<$R, AdditionalModFile, AdditionalModFile>>
      get additionalFiles => ListCopyWith(
          $value.additionalFiles,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(additionalFiles: v));
  @override
  $R call(
          {HotlineMiamiModName? name,
          HotlineMiamiModPath? path,
          Object? music = $none,
          List<AdditionalModFile>? additionalFiles}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (path != null) #path: path,
        if (music != $none) #music: music,
        if (additionalFiles != null) #additionalFiles: additionalFiles
      }));
  @override
  HotlineMiamiMod $make(CopyWithData data) => HotlineMiamiMod(
      name: data.get(#name, or: $value.name),
      path: data.get(#path, or: $value.path),
      music: data.get(#music, or: $value.music),
      additionalFiles: data.get(#additionalFiles, or: $value.additionalFiles));

  @override
  HotlineMiamiModCopyWith<$R2, HotlineMiamiMod, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _HotlineMiamiModCopyWithImpl($value, $cast, t);
}
