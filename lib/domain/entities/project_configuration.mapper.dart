// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'project_configuration.dart';

class ProjectConfigurationMapper extends ClassMapperBase<ProjectConfiguration> {
  ProjectConfigurationMapper._();

  static ProjectConfigurationMapper? _instance;
  static ProjectConfigurationMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProjectConfigurationMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProjectConfiguration';

  static GamePath _$gamePath(ProjectConfiguration v) => v.gamePath;
  static const Field<ProjectConfiguration, GamePath> _f$gamePath =
      Field('gamePath', _$gamePath, hook: ExistingDirectoryHook());
  static AdditionalModsPath _$additionalModsPath(ProjectConfiguration v) =>
      v.additionalModsPath;
  static const Field<ProjectConfiguration, AdditionalModsPath>
      _f$additionalModsPath = Field('additionalModsPath', _$additionalModsPath,
          hook: ExistingDirectoryHook());

  @override
  final MappableFields<ProjectConfiguration> fields = const {
    #gamePath: _f$gamePath,
    #additionalModsPath: _f$additionalModsPath,
  };

  static ProjectConfiguration _instantiate(DecodingData data) {
    return ProjectConfiguration(
        gamePath: data.dec(_f$gamePath),
        additionalModsPath: data.dec(_f$additionalModsPath));
  }

  @override
  final Function instantiate = _instantiate;

  static ProjectConfiguration fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProjectConfiguration>(map);
  }

  static ProjectConfiguration fromJson(String json) {
    return ensureInitialized().decodeJson<ProjectConfiguration>(json);
  }
}

mixin ProjectConfigurationMappable {
  String toJson() {
    return ProjectConfigurationMapper.ensureInitialized()
        .encodeJson<ProjectConfiguration>(this as ProjectConfiguration);
  }

  Map<String, dynamic> toMap() {
    return ProjectConfigurationMapper.ensureInitialized()
        .encodeMap<ProjectConfiguration>(this as ProjectConfiguration);
  }

  @override
  String toString() {
    return ProjectConfigurationMapper.ensureInitialized()
        .stringifyValue(this as ProjectConfiguration);
  }

  @override
  bool operator ==(Object other) {
    return ProjectConfigurationMapper.ensureInitialized()
        .equalsValue(this as ProjectConfiguration, other);
  }

  @override
  int get hashCode {
    return ProjectConfigurationMapper.ensureInitialized()
        .hashValue(this as ProjectConfiguration);
  }
}
