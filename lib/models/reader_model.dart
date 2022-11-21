class ReaderModel {
  final String readerName;
  final int tabNo;
  final int? investigations;
  final int? penalties;
  final int? phoneNo;
  final String? joinDate;
  final String? leaveDate;
  final String? leaveReason;
  final String? id1;
  final String? id2;
  final bool currentlyWorking;
  const ReaderModel(
      {required this.readerName,
      required this.tabNo,
      required this.currentlyWorking,
      this.investigations,
      this.leaveReason,
      this.penalties,
      this.phoneNo,
      this.joinDate,
      this.leaveDate,
      this.id1,
      this.id2});

  static ReaderModel fromJson(Map<String, dynamic> json) => ReaderModel(
        readerName: json['readerName'] as String,
        tabNo: json['tabNo'] as int,
        investigations: json['investigations'] as int?,
        penalties: json['penalties'] as int?,
        phoneNo: json['phoneNo'] as int?,
        id1: json['id1'] as String?,
        id2: json['id2'] as String?,
        leaveReason: json['leaveReason'] as String?,
        joinDate: json['joinDate'] as String?,
        leaveDate: json['leaveDate'] as String?,
        currentlyWorking: json['currentlyWorking'] as bool,
      );

// THIS IS ONLY FOR REFERENCE OF HOW TO POST DATA FROM MODEL
  Map<String, dynamic> toJson() => {
        'readerName': readerName,
        'tabNo': tabNo,
        'investigations': investigations,
        'leaveReason': leaveReason,
        'penalties': penalties,
        'phoneNo': phoneNo,
        'id1': id1,
        'id2': id2,
        'joinDate': joinDate,
        'leaveDate': leaveDate,
        'currentlyWorking': currentlyWorking,
      };
}
