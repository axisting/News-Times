import 'package:dartz/dartz.dart';

import 'package:news_times/core/errors/failure.dart';
import 'package:news_times/core/params/params.dart';
import 'package:news_times/features/template/business/entities/template_entity.dart';

abstract class TemplateRepository {
  Future<Either<Failure, TemplateEntity>> getTemplate(
      {required TemplateParams templateParams});
}
