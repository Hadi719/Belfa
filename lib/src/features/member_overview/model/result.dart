import '../../../models/collections/member.dart';

class MemberOverviewResult {
  const MemberOverviewResult({this.members = const <Member>[]});
  final List<Member> members;
}
