import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:path/path.dart' as p;

import '../../domain/entities/hotline_miami_mod.dart';

class HotlineMiamiModModel extends HotlineMiamiMod {
  const HotlineMiamiModModel({
    required super.id,
    required super.name,
    required super.author,
    required super.cover,
    required super.screen,
    required super.type,
    required super.directory,
    required super.additionalFilesDirectory,
    super.files,
    super.music,
  });

  static Future<HotlineMiamiModModel> fromDirectory(Directory directory) async {
    final isLevel = await directory.list().any((entity) {
      final basename = p.basename(entity.path);
      return basename == 'level.hlm';
    });

    if (isLevel) {
      return HotlineMiamiModModel._parseLevel(directory);
    } else {
      return HotlineMiamiModModel._parseCampaign(directory);
    }
  }

  static Future<HotlineMiamiModModel> _parseCampaign(
    Directory directory,
  ) async {
    final campaign =
        await File(p.join(directory.path, 'campaign.cpg')).readAsLines();
    final [name, author] = campaign.take(2).toList();
    final cover = await _getCover(directory, 'campaign.png');
    final screen = await _getScreen(directory);

    return HotlineMiamiModModel(
      id: _getId(directory),
      name: ModName(name),
      author: ModAuthor(author),
      cover: cover,
      screen: screen,
      type: ModType.campaign,
      directory: ModDirectory(directory),
      additionalFilesDirectory: AdditionalFilesDirectory(Directory('')),
    );
  }

  static Future<HotlineMiamiModModel> _parseLevel(Directory directory) async {
    final level = File(p.join(directory.path, 'level.hlm'));
    final levelContent = await level.readAsLines();
    final [name, _, author] = levelContent.take(3).toList();
    final cover = await _getCover(directory, 'level.png');
    final screen = await _getScreen(directory);

    return HotlineMiamiModModel(
      id: _getId(directory),
      name: ModName(name),
      author: ModAuthor(author),
      cover: cover,
      screen: screen,
      type: ModType.level,
      directory: ModDirectory(directory),
      additionalFilesDirectory: AdditionalFilesDirectory(Directory('')),
    );
  }

  static ModId _getId(Directory directory) => ModId(p.basename(directory.path));

  static Future<ModCover?> _getCover(
    Directory directory,
    String fileName,
  ) async {
    return Option.fromPredicate(
      File(p.join(directory.path, fileName)),
      (file) => file.existsSync(),
    ).map((file) => file.readAsBytes().then(ModCover.new)).toNullable();
  }

  static Future<ModScreen?> _getScreen(Directory directory) async {
    return Option.fromPredicate(
      File(p.join(directory.path, 'screen.png')),
      (file) => file.existsSync(),
    ).map((file) => file.readAsBytes().then(ModScreen.new)).toNullable();
  }
}
