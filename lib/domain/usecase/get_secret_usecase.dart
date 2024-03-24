import 'package:smart_pay_app/domain/repository/repository.dart';

import '../../data/models/dashboard_response.dart';

class GetDashboardSecretUseCase {
  final Repository repository;

  GetDashboardSecretUseCase(this.repository);

  Future<DashBoardResponse> execute() async {
    return await repository.getDashboardSecret();
  }
}
