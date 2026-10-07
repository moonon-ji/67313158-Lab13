enum TransactionType {income , expense}

class MyTransaction{
  final int? id;
  final String title;
  final double amount;
  final DateTime date;
  final TransactionType type;

  MyTransaction({
    this.id,
    required this.title, //มีrequired เพื่อบังคับให้ต้องใส่ค่า 
    required this.amount,
    required this.date,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      if (id != null)
      'id': id,
      'title': title,
      'amount': amount,
      'date': date.toIso8601String(), //แปลงวันที่ให้กลายเป็น ข้อความมาตรฐาน (ISO-8601 String)
      'type': type.index, //ใช้ index เพื่อเก็บค่า enum เป็น int
    };
  }
  factory MyTransaction.fromMap(Map<String, dynamic> map) { //factory มักใช้สำหรับการแปลงข้อมูล หรือควบคุมการสร้างออบเจ็กต์
    return MyTransaction(
      id: map['id'],
      title: map['title'],
      amount: map['amount'],
      date: DateTime.parse(map['date']), //DateTime.parse() แปลงข้อความกลับเป็นวันที่
      type: TransactionType.values[map['type']], //TransactionType.values[...] เพื่อเอาตัวเลขนั้นไปชี้หาค่า Enum ตัวเดิมกลับมาใช้งาน
    );
  }

}