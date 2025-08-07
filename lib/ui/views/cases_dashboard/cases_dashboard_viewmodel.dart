import 'package:stacked/stacked.dart';

class CaseDetail {
  final String odrId;
  final String courtCase;
  final String caseTitle;
  final String natureOfDispute;
  final String initiatingParty;
  final String respondingParty;
  final String nextAction;
  final String referralDate;
  final String closingDate;
  final String referredBy;
  final String mediator;
  final String status;

  CaseDetail({
    required this.odrId,
    required this.courtCase,
    required this.caseTitle,
    required this.natureOfDispute,
    required this.initiatingParty,
    required this.respondingParty,
    required this.nextAction,
    required this.referralDate,
    required this.closingDate,
    required this.referredBy,
    required this.mediator,
    required this.status,
  });
}


class CasesDashboardViewModel extends BaseViewModel {
  final List<CaseDetail> caseDetails = [
    CaseDetail(
      odrId: 'ODR001',
      courtCase: 'CC001',
      caseTitle: 'Ahmed vs. Khan',
      natureOfDispute: 'Business Partnership Dispute',
      initiatingParty: 'Muhammad Ahmed',
      respondingParty: 'Zubair Khan',
      nextAction: 'Mediation',
      referralDate: '2025-07-01',
      closingDate: '2025-07-15',
      referredBy: 'Judge Abdul Basit',
      mediator: 'Fatima Siddiqui',
      status: 'Ongoing',
    ),
    CaseDetail(
      odrId: 'ODR002',
      courtCase: 'CC002',
      caseTitle: 'Rehman vs. Ali',
      natureOfDispute: 'Land Ownership Dispute',
      initiatingParty: 'Noman Rehman',
      respondingParty: 'Imran Ali',
      nextAction: 'Hearing',
      referralDate: '2025-07-05',
      closingDate: '2025-07-18',
      referredBy: 'Judge Ayesha Farooq',
      mediator: 'Hassan Qureshi',
      status: 'Pending',
    ),
    CaseDetail(
      odrId: 'ODR003',
      courtCase: 'CC003',
      caseTitle: 'Fatima vs. Tariq',
      natureOfDispute: 'Family Inheritance Dispute',
      initiatingParty: 'Fatima Bano',
      respondingParty: 'Tariq Mahmood',
      nextAction: 'Settlement',
      referralDate: '2025-07-10',
      closingDate: '2025-07-20',
      referredBy: 'Judge Bilal Aslam',
      mediator: 'Zara Hussain',
      status: 'Closed',
    ),
  ];
}
