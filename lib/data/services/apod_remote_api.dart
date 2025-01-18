import 'package:app_eclipseworks/data/custom_dio.dart';
import 'package:app_eclipseworks/data/services/apod_api.dart';
import 'package:app_eclipseworks/utils/erros_msg.dart';
import 'package:app_eclipseworks/utils/helpers.dart';
import 'package:app_eclipseworks/utils/result.dart';
import 'package:app_eclipseworks/domain/models/apod_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApodApiImpl implements ApodApi {
  final CustomDio customDio;

  ApodApiImpl({required this.customDio});
  @override
  Future<Result<List<ApodModel>>> getApod(DateTimeRange? date) async {
    try {
      final result = await customDio.dio.get('/apod', queryParameters: {
        'thumbs': true,
        'start_date': date?.start.formatDate,
        'end_date': date?.end.formatDate
      });
      final List resultList =
          result.data.map((e) => ApodModel.fromJson(e)).toList();
      return Result.ok(resultList.cast<ApodModel>());
    } on DioException catch (dioError) {
      return Result.error(
          Exception(dioError.toString()), dioError.resolveErrorMsg);
    } catch (e) {
      return Result.error(Exception(e.toString()), 'Erro desconhecido');
    }
  }
}
