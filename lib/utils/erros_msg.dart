import 'dart:io';
import 'package:dio/dio.dart';

extension RequestErrorMsg on DioException {
  String get resolveErrorMsg {
    switch (type) {
      case DioExceptionType.connectionTimeout:
        return 'A conexão demorou muito para responder. Por favor, verifique sua internet e tente novamente.';
      case DioExceptionType.receiveTimeout:
        return 'O servidor demorou muito para responder. Por favor, tente novamente mais tarde.';
      case DioExceptionType.badResponse:
        return 'Recebemos uma resposta inválida do servidor. Por favor, tente novamente.';
      case DioExceptionType.sendTimeout:
        return 'O envio dos dados demorou muito. Por favor, verifique sua internet e tente novamente.';
      case DioExceptionType.cancel:
        return 'A requisição foi cancelada. Por favor, tente novamente.';
      case DioExceptionType.connectionError:
        return 'Erro de conexão. Por favor, verifique sua internet e tente novamente.';
      case DioExceptionType.unknown:
        return 'Ocorreu um erro desconhecido. Por favor, tente novamente mais tarde.';
      default:
        if (error is SocketException) {
          return 'Não foi possível conectar ao servidor. Por favor, verifique sua internet e tente novamente.';
        } else {
          return 'Ocorreu um erro desconhecido. Por favor, tente novamente mais tarde.';
        }
    }
  }
}
