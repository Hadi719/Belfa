import 'package:get/get.dart';

import '../repositories/group_repository.dart';
import '../repositories/installment_repository.dart';
import '../repositories/loan_repository.dart';
import '../repositories/member_repository.dart';

/// Initializes and registers dependencies for the application.
/// This function ensures that each dependency is registered only once,
/// preventing potential issues with re-initialization.
void initDependencies() {
  _registerRepository<MemberRepository>(() => MemberRepository().init());
  _registerRepository<GroupRepository>(() => GroupRepository().init());
  _registerRepository<InstallmentRepository>(
      () => InstallmentRepository().init());
  _registerRepository<LoanRepository>(() => LoanRepository().init());
}

/// Registers a repository if it hasn't been registered yet.
///
/// [initializer] is a function that creates and initializes a new instance
/// of the repository.
void _registerRepository<T extends Object>(T Function() initializer) {
  if (!Get.isRegistered<T>()) {
    Get.put<T>(initializer());
  }
}
