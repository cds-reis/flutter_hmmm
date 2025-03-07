import 'package:dart_mappable/dart_mappable.dart';
import 'package:fpdart/fpdart.dart';

import '../use_cases/parse_existing_directory.dart';
import 'project_configuration_custom_serde.dart';

part 'project_configuration.mapper.dart';

@MappableClass(
  generateMethods:
      GenerateMethods.decode |
      GenerateMethods.encode |
      GenerateMethods.stringify |
      GenerateMethods.equals,
)
class ProjectConfiguration with ProjectConfigurationMappable {
  const ProjectConfiguration({
    required this.gamePath,
    required this.additionalModsPath,
    required this.customModsFolder,
  });

  @MappableField(hook: ExistingDirectoryHook())
  final GamePath gamePath;

  @MappableField(hook: ExistingDirectoryHook())
  final AdditionalModsPath additionalModsPath;

  @MappableField(hook: ExistingDirectoryHook())
  final CustomModsFolder customModsFolder;

  static Either<DirectoryDoesNotExistException, ProjectConfiguration> create({
    required String gamePath,
    required String additionalModsPath,
    required String customModsFolder,
  }) {
    return Either.Do(($) {
      final existingGamePath = $(GamePath.parse(gamePath));

      final existingAdditionalModsPath = $(
        AdditionalModsPath.parse(additionalModsPath),
      );

      final existingCustomModsFolder = $(
        CustomModsFolder.parse(customModsFolder),
      );

      return ProjectConfiguration(
        gamePath: existingGamePath,
        additionalModsPath: existingAdditionalModsPath,
        customModsFolder: existingCustomModsFolder,
      );
    });
  }
}

extension type const GamePath(ExistingDirectory _)
    implements ExistingDirectory {
  static Either<DirectoryDoesNotExistException, GamePath> parse(String path) {
    return parseExistingDirectory(path).map(GamePath.new);
  }
}

extension type const AdditionalModsPath(ExistingDirectory _)
    implements ExistingDirectory {
  static Either<DirectoryDoesNotExistException, AdditionalModsPath> parse(
    String path,
  ) {
    return parseExistingDirectory(path).map(AdditionalModsPath.new);
  }
}

extension type const CustomModsFolder(ExistingDirectory _)
    implements ExistingDirectory {
  static Either<DirectoryDoesNotExistException, CustomModsFolder> parse(
    String path,
  ) {
    return parseExistingDirectory(path).map(CustomModsFolder.new);
  }
}
