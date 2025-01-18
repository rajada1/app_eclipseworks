import 'package:app_eclipseworks/domain/models/apod_model.dart';
import 'package:app_eclipseworks/utils/result.dart';
import 'package:flutter/material.dart';

abstract interface class ApodApi {
  Future<Result<List<ApodModel>>> getApod(DateTimeRange? date);
}
