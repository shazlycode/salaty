import 'package:flutter/foundation.dart';

class Zekr {
  final int? id;
  final String? body;
  final int? noOfRead;
  int count;

  Zekr({this.id, this.body, this.noOfRead, this.count = 0});
}

class ZekrProvider with ChangeNotifier {
  final List<Zekr> _azkarSabah = [
    Zekr(
        id: 1,
        body:
            ' أعوذ بالله من الشيطان الرجيم { اللّهُ لاَ إِلَـهَ إِلاَّ هُوَ الْحَيُّ الْقَيُّومُ لاَ تَأْخُذُهُ سِنَةٌ وَلاَ نَوْمٌ لَّهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الأَرْضِ مَن ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلاَّ بِإِذْنِهِ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ وَلاَ يُحِيطُونَ بِشَيْءٍ مِّنْ عِلْمِهِ إِلاَّ بِمَا شَاء وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالأَرْضَ وَلاَ يَؤُودُهُ حِفْظُهُمَا وَهُوَ الْعَلِيُّ الْعَظِيمُ }',
        noOfRead: 1,
        count: 0),
    Zekr(
        id: 2,
        body:
            'بسم الله الرحمن الرحيم{ قُلْ هُوَ اللَّهُ أَحَدٌ*اللَّهُ الصَّمَدُ*لَمْ يَلِدْ وَلَمْ يُولَدْ * وَلَمْ يَكُن لَّهُ كُفُواً أَحَدٌ}',
        noOfRead: 3,
        count: 0),
    Zekr(
        id: 3,
        body:
            ' بسم الله الرحمن الرحيم {قُلْ أَعُوذُ بِرَبِّ الْفَلَقِ * مِن شَرِّ مَا خَلَقَ *وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ * وَمِن شَرِّ النَّفَّاثَاتِ فِي الْعُقَدِ * وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ }',
        noOfRead: 3,
        count: 0),
    Zekr(
        id: 4,
        body:
            'بسم الله الرحمن الرحيم{ قُلْ أَعُوذُ بِرَبِّ النَّاسِ * مَلِكِ النَّاسِ * إِلَهِ النَّاسِ *مِن شَرِّ الْوَسْوَاسِ الْخَنَّاسِ * الَّذِي يُوَسْوِسُ فِي صُدُورِ النَّاسِ * مِنَ الْجِنَّةِ وَالنَّاسِ }',
        noOfRead: 3,
        count: 0),
    Zekr(
        id: 5,
        body:
            'أصبحنا وأصبح الملك لله[4]، والحمد لله، لا إله إلا الله وحده لا شريك له، له الملك وله الحمد وهو على كل شيء قدير، ربِّ أسألك خير ما في هذا اليوم وخير ما بعده[5] وأعوذ بك من شر ما في هذا اليوم وشر ما بعده ربِّ أعوذ بك من الكسل وسوء الكبر، ربَّ أعوذ بك من عذابٍ في النار وعذاب في القبر',
        count: 0,
        noOfRead: 1),
    Zekr(
        id: 6,
        body: 'اللهم بك أصبحنا وبك أمسينا[7] وبك نحيا وبك نموت وإليك النشور',
        count: 0,
        noOfRead: 1),
    Zekr(
        id: 7,
        body:
            'اللهم أنت ربي لا إله إلا أنت خَلَقتني وأنا عَبْدُك وأنا على عهدك ووعدك ما استطعت أعوذ بك من شر ما صنعت أبوء[9] لك بنعمتك علي وأبوء بذنبي فاغفر لي فإنه لا يغفر الذنوب إلا أنت',
        count: 0,
        noOfRead: 1),
    Zekr(
        id: 8,
        body:
            'اللهم إني أصبحت [11] أشهدك وأشهد حملة عرشك ، وملائكتك وجميع خلقك ، أنك أنت الله لا إله إلا أنت وحدك لا شريك لك ، وأن محمداً عبدك ورسولك',
        count: 0,
        noOfRead: 4),
    Zekr(
        id: 9,
        body:
            'اللهم ما أصبح بي [13]من نعمة أو بأحد من خلقك فمنك وحدك لا شريك لك ، فلك الحمد ولك الشكر',
        count: 0,
        noOfRead: 1),
    Zekr(
        id: 10,
        body:
            'اللهم عافني في بَدَني، اللهم عافني في سمعي، اللهم عافني في بصري، لا إله إلا أنت .اللهم إني أعوذ بك من الكفر، والفقر، اللهم إني أعوذ بك من عذاب القبر لا إله إلا أنت',
        count: 0,
        noOfRead: 3),
    Zekr(
        id: 11,
        body: 'حسبي الله لا إله إلا هو عليه توكلت وهو رب العرش العظيم',
        count: 0,
        noOfRead: 7),
    Zekr(
        id: 12,
        body:
            'اللهم إني أسألك العفو والعافية في الدنيا والآخرة، اللهم إني أسألك العفو والعافية في ديني ودنياي وأهلي ومالي،اللهم استر عوراتي وآمن روعاتي، اللهم احفظني من بين يديَّ ومن خلفي وعن يميني وعن شمالي ومن فوقي وأعوذ بعظمتك أن أغتال من تحتي',
        count: 0,
        noOfRead: 1),
    Zekr(
        id: 13,
        body:
            'اللهم عَالِمَ الغيب والشَّهادة، فاطر السموات والأرض، رب كل شيء ومليكه، أشهد أن لا إله إلا أنت أعوذ بك من شر نفسي ومن شر الشيطان وشركه وأن اقترف على نفسي سوءًا أو أجُره إلى مسلم',
        count: 0,
        noOfRead: 1),
    Zekr(
        id: 14,
        body:
            'بسم الله الذي لا يضرُّ مع اسمه شيء في الأرض ولا في السماء وهو السميع العليم',
        count: 0,
        noOfRead: 3),
    Zekr(
        id: 15,
        body:
            ' رضيت بالله رباً ، وبالإسلام ديناً وبمحمد صلى الله عليه وسلم نبياً',
        count: 0,
        noOfRead: 3),
    Zekr(
        id: 16,
        body:
            ' يا حي يا قيوم برحمتك أستغيث أصلح لي شأني كُله ولا تَكِلْني إلى نفسي طرفة عين',
        count: 0,
        noOfRead: 1),
    Zekr(
        id: 17,
        body:
            '  أصبحنا وأصبح الملك لله رب العالمين[22] ، اللهم إني أسألك خير هذا اليوم : فتحه، ونصره ،ونوره ،وبركته، وهداه، وأعوذ بك من شر ما فيه وشر ما بعده',
        count: 0,
        noOfRead: 1),
    Zekr(
        id: 18,
        body:
            'أصبحنا على فطرة الإسلام[25] وعلى كلمة الإخلاص، وعلى دين نبيَّنا محمد صلى الله عليه وسلم وعلى ملَّة أبينا إبراهيم حنيفاً مسلماً وما كان من المشركين',
        count: 0,
        noOfRead: 1),
    Zekr(id: 19, body: 'سبحان الله وبحمده', count: 0, noOfRead: 100),
    Zekr(
        id: 20,
        body:
            'لا إله إلا الله وحده لا شريك له ،له الملك وله الحمد وهو على كل شيء قدير',
        count: 0,
        noOfRead: 10),
    Zekr(
        id: 21,
        body:
            'لا إله إلا الله وحده لا شريك له ،له الملك وله الحمد وهو على كل شيء قدير',
        count: 0,
        noOfRead: 100),
    Zekr(
        id: 22,
        body:
            'سبحان الله وبحمده عدد خلقهِ ورِضَا نفسِهِ وزِنُة عَرشِهِ ومِداد كلماته',
        count: 0,
        noOfRead: 3),
    Zekr(
        id: 23,
        body: 'اللهم إني أسألك علماً نافعاً ، ورزقاً طيباً ، وعملاً متقبلاً',
        count: 0,
        noOfRead: 3),
    Zekr(id: 24, body: 'أستغفر الله وأتوب إليه', count: 0, noOfRead: 100),
    Zekr(id: 25, body: 'اللهم صل وسلم على نبينا محمد', count: 0, noOfRead: 10),
  ];

  List<Zekr> get azkarSabah => _azkarSabah;

  Zekr getZekrSabahById(int id) {
    return _azkarSabah.firstWhere((element) => element.id == id);
  }

  increaseZekrSabahCount(int id) {
    final zekr = getZekrSabahById(id);
    zekr.count += 1;
    notifyListeners();
  }

// Azkar Almassaa

  final List<Zekr> _azkarMasaa = [
    Zekr(
        id: 1,
        body:
            ' أعوذ بالله من الشيطان الرجيم { اللّهُ لاَ إِلَـهَ إِلاَّ هُوَ الْحَيُّ الْقَيُّومُ لاَ تَأْخُذُهُ سِنَةٌ وَلاَ نَوْمٌ لَّهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الأَرْضِ مَن ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلاَّ بِإِذْنِهِ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ وَلاَ يُحِيطُونَ بِشَيْءٍ مِّنْ عِلْمِهِ إِلاَّ بِمَا شَاء وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالأَرْضَ وَلاَ يَؤُودُهُ حِفْظُهُمَا وَهُوَ الْعَلِيُّ الْعَظِيمُ }',
        noOfRead: 1,
        count: 0),
    Zekr(
        id: 2,
        body:
            'بسم الله الرحمن الرحيم{ قُلْ هُوَ اللَّهُ أَحَدٌ*اللَّهُ الصَّمَدُ*لَمْ يَلِدْ وَلَمْ يُولَدْ * وَلَمْ يَكُن لَّهُ كُفُواً أَحَدٌ}',
        noOfRead: 3,
        count: 0),
    Zekr(
        id: 3,
        body:
            ' بسم الله الرحمن الرحيم {قُلْ أَعُوذُ بِرَبِّ الْفَلَقِ * مِن شَرِّ مَا خَلَقَ *وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ * وَمِن شَرِّ النَّفَّاثَاتِ فِي الْعُقَدِ * وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ }',
        noOfRead: 3,
        count: 0),
    Zekr(
        id: 4,
        body:
            'بسم الله الرحمن الرحيم{ قُلْ أَعُوذُ بِرَبِّ النَّاسِ * مَلِكِ النَّاسِ * إِلَهِ النَّاسِ *مِن شَرِّ الْوَسْوَاسِ الْخَنَّاسِ * الَّذِي يُوَسْوِسُ فِي صُدُورِ النَّاسِ * مِنَ الْجِنَّةِ وَالنَّاسِ }',
        noOfRead: 3,
        count: 0),
    Zekr(
        id: 5,
        body: 'اللهم بك أمسينا، وبك أصبحنا، وبك نحيا وبك نموت، وإليك المصير',
        noOfRead: 3,
        count: 0),
    Zekr(
        id: 6,
        body:
            'اللهم أنت ربي لا إله إلا أنت خَلَقتني وأنا عَبْدُك وأنا على عهدك ووعدك ما استطعت أعوذ بك من شر ما صنعت أبوء لك بنعمتك علي وأبوء بذنبي فاغفر لي فإنه لا يغفر الذنوب إلا أنت',
        count: 0,
        noOfRead: 1),
    Zekr(
        id: 7,
        body:
            'اللهم إني أمسيت أشهدك وأشهد حملة عرشك ، وملائكتك وجميع خلقك ، أنك أنت الله لا إله إلا أنت وحدك لا شريك لك ، وأن محمداً عبدك ورسولك',
        count: 0,
        noOfRead: 4),
    Zekr(
        id: 8,
        body:
            'اللهم ما أمسى بي من نعمة أو بأحد من خلقك فمنك وحدك لا شريك لك ، فلك الحمد ولك الشكر',
        count: 0,
        noOfRead: 1),
    Zekr(
        id: 9,
        body:
            'اللهم عافني في بَدَني، اللهم عافني في سمعي، اللهم عافني في بصري، لا إله إلا أنت .اللهم إني أعوذ بك من الكفر، والفقر، اللهم إني أعوذ بك من عذاب القبر لا إله إلا أنت',
        count: 0,
        noOfRead: 3),
    Zekr(
        id: 10,
        body: 'حسبي الله لا إله إلا هو عليه توكلت وهو رب العرش العظيم',
        count: 0,
        noOfRead: 7),
    Zekr(
        id: 11,
        body:
            'اللهم إني أسألك العفو والعافية في الدنيا والآخرة، اللهم إني أسألك العفو والعافية في ديني ودنياي وأهلي ومالي،اللهم استر عوراتي وآمن روعاتي، اللهم احفظني من بين يديَّ ومن خلفي وعن يميني وعن شمالي ومن فوقي وأعوذ بعظمتك أن أغتال من تحتي',
        count: 0,
        noOfRead: 1),
    Zekr(
        id: 12,
        body:
            'اللهم عَالِمَ الغيب والشَّهادة، فاطر السموات والأرض، رب كل شيء ومليكه، أشهد أن لا إله إلا أنت أعوذ بك من شر نفسي ومن شر الشيطان وشركه وأن اقترف على نفسي سوءًا أو أجُره إلى مسلم',
        count: 0,
        noOfRead: 1),
    Zekr(
        id: 13,
        body:
            'بسم الله الذي لا يضرُّ مع اسمه شيء في الأرض ولا في السماء وهو السميع العليم',
        count: 0,
        noOfRead: 3),
    Zekr(
        id: 14,
        body:
            ' رضيت بالله رباً ، وبالإسلام ديناً وبمحمد صلى الله عليه وسلم نبياً',
        count: 0,
        noOfRead: 3),
    Zekr(
        id: 15,
        body:
            ' يا حي يا قيوم برحمتك أستغيث أصلح لي شأني كُله ولا تَكِلْني إلى نفسي طرفة عين',
        count: 0,
        noOfRead: 1),
    Zekr(
        id: 16,
        body:
            '  أمسينا وأمسى الملك لله رب العالمين ، اللهم إني أسألك خير هذه الليلة فتحها ونصرها ونورها وبركتها وهداها وأعوذ بك من شر ما فيها وشر ما بعدها',
        count: 0,
        noOfRead: 1),
    Zekr(
        id: 17,
        body:
            'أمسينا على فطرة الإسلام وعلى كلمة الإخلاص، وعلى دين نبيَّنا محمد صلى الله عليه وسلم وعلى ملَّة أبينا إبراهيم حنيفاً مسلماً وما كان من المشركين',
        count: 0,
        noOfRead: 1),
    Zekr(id: 18, body: 'سبحان الله وبحمده', count: 0, noOfRead: 100),
    Zekr(
        id: 19,
        body:
            'لا إله إلا الله وحده لا شريك له ،له الملك وله الحمد وهو على كل شيء قدير',
        count: 0,
        noOfRead: 10),
    Zekr(
        id: 20,
        body: 'أعوذ بكلمات الله التامات من شر ما خلق',
        count: 3,
        noOfRead: 100),
    Zekr(id: 21, body: 'اللهم صل وسلم على نبينا محمد', count: 0, noOfRead: 10),
  ];

  List<Zekr> get azkarMasaa => _azkarMasaa;

  Zekr getZekrMasaaById(int id) {
    return _azkarMasaa.firstWhere((element) => element.id == id);
  }

  increaseZekrMasaaCount(int id) {
    final zekr = getZekrMasaaById(id);
    zekr.count += 1;
    notifyListeners();
  }
}
