import 'dart:convert';

import 'package:news_times/core/errors/exception.dart';
import 'package:news_times/features/template/data/models/template_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class TemplateLocalDataSource {
  Future<void> cacheTemplate({required TemplateModel? templateToCache});
  Future<TemplateModel> getLastTemplate();
}

const cashedTemplate = 'CACHED_TEMPLATE';

class TemplateLocalDataSourceImpl implements TemplateLocalDataSource {
  final SharedPreferences sharedPreferences;

  const TemplateLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheTemplate({required TemplateModel? templateToCache}) async {
    if (templateToCache != null) {
      sharedPreferences.setString(
          cashedTemplate, json.encode(templateToCache.toJson()));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<TemplateModel> getLastTemplate() async {
    String? jsonString = sharedPreferences.getString(cashedTemplate);
    if (jsonString != null) {
      return Future.value(
          TemplateModel.fromJson(json: json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }
}
