import 'package:news_times/core/constants/constants.dart';
import 'package:news_times/core/errors/exception.dart';
import 'package:news_times/core/params/params.dart';
import 'package:news_times/features/template/data/models/template_model.dart';
import 'package:dio/dio.dart';

abstract class TemplateRemoteDataSource {
  Future<TemplateModel> getTemplate({required TemplateParams templateParams});
  //Future<List<TemplateModel>> getAllTemplate();
}

class TemplateRemoteDataSourceImpl implements TemplateRemoteDataSource {
  final Dio dio;

  const TemplateRemoteDataSourceImpl({required this.dio});

  @override
  Future<TemplateModel> getTemplate(
      {required TemplateParams templateParams}) async {
    final response = await dio.get(
      API_BASE_URL,
      queryParameters: {'api_key': 'if_needed'},
    );
    if (response.statusCode == 200) {
      return TemplateModel.fromJson(json: response.data);
    } else {
      throw ServerException();
    }
  }
}
