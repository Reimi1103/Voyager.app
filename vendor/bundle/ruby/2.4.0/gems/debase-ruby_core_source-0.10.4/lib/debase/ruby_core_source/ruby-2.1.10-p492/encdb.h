ENC_DEFINE("ASCII-8BIT");
ENC_DEFINE("UTF-8");
ENC_DEFINE("US-ASCII");
ENC_DEFINE("Big5");
ENC_DEFINE("Big5-HKSCS");
ENC_DEFINE("Big5-UAO");
ENC_DEFINE("CP949");
ENC_DEFINE("Emacs-Mule");
ENC_DEFINE("EUC-JP");
ENC_DEFINE("EUC-KR");
ENC_DEFINE("EUC-TW");
ENC_DEFINE("GB2312");
ENC_DEFINE("GB18030");
ENC_DEFINE("GBK");
ENC_DEFINE("ISO-8859-1");
ENC_DEFINE("ISO-8859-2");
ENC_DEFINE("ISO-8859-3");
ENC_DEFINE("ISO-8859-4");
ENC_DEFINE("ISO-8859-5");
ENC_DEFINE("ISO-8859-6");
ENC_DEFINE("ISO-8859-7");
ENC_DEFINE("ISO-8859-8");
ENC_DEFINE("ISO-8859-9");
ENC_DEFINE("ISO-8859-10");
ENC_DEFINE("ISO-8859-11");
ENC_DEFINE("ISO-8859-13");
ENC_DEFINE("ISO-8859-14");
ENC_DEFINE("ISO-8859-15");
ENC_DEFINE("ISO-8859-16");
ENC_DEFINE("KOI8-R");
ENC_DEFINE("KOI8-U");
ENC_DEFINE("Shift_JIS");
ENC_DEFINE("UTF-16BE");
ENC_DEFINE("UTF-16LE");
ENC_DEFINE("UTF-32BE");
ENC_DEFINE("UTF-32LE");
ENC_DEFINE("Windows-31J");
ENC_DEFINE("Windows-1250");
ENC_DEFINE("Windows-1251");
ENC_DEFINE("Windows-1252");
ENC_ALIAS("BINARY", "ASCII-8BIT");
ENC_REPLICATE("IBM437", "ASCII-8BIT");
ENC_ALIAS("CP437", "IBM437");
ENC_REPLICATE("IBM737", "ASCII-8BIT");
ENC_ALIAS("CP737", "IBM737");
ENC_REPLICATE("IBM775", "ASCII-8BIT");
ENC_ALIAS("CP775", "IBM775");
ENC_REPLICATE("CP850", "ASCII-8BIT");
ENC_ALIAS("IBM850", "CP850");
ENC_REPLICATE("IBM852", "ASCII-8BIT");
ENC_REPLICATE("CP852", "IBM852");
ENC_REPLICATE("IBM855", "ASCII-8BIT");
ENC_REPLICATE("CP855", "IBM855");
ENC_REPLICATE("IBM857", "ASCII-8BIT");
ENC_ALIAS("CP857", "IBM857");
ENC_REPLICATE("IBM860", "ASCII-8BIT");
ENC_ALIAS("CP860", "IBM860");
ENC_REPLICATE("IBM861", "ASCII-8BIT");
ENC_ALIAS("CP861", "IBM861");
ENC_REPLICATE("IBM862", "ASCII-8BIT");
ENC_ALIAS("CP862", "IBM862");
ENC_REPLICATE("IBM863", "ASCII-8BIT");
ENC_ALIAS("CP863", "IBM863");
ENC_REPLICATE("IBM864", "ASCII-8BIT");
ENC_ALIAS("CP864", "IBM864");
ENC_REPLICATE("IBM865", "ASCII-8BIT");
ENC_ALIAS("CP865", "IBM865");
ENC_REPLICATE("IBM866", "ASCII-8BIT");
ENC_ALIAS("CP866", "IBM866");
ENC_REPLICATE("IBM869", "ASCII-8BIT");
ENC_ALIAS("CP869", "IBM869");
ENC_REPLICATE("Windows-1258", "ASCII-8BIT");
ENC_ALIAS("CP1258", "Windows-1258");
ENC_REPLICATE("GB1988", "ASCII-8BIT");
ENC_REPLICATE("macCentEuro", "ASCII-8BIT");
ENC_REPLICATE("macCroatian", "ASCII-8BIT");
ENC_REPLICATE("macCyrillic", "ASCII-8BIT");
ENC_REPLICATE("macGreek", "ASCII-8BIT");
ENC_REPLICATE("macIceland", "ASCII-8BIT");
ENC_REPLICATE("macRoman", "ASCII-8BIT");
ENC_REPLICATE("macRomania", "ASCII-8BIT");
ENC_REPLICATE("macThai", "ASCII-8BIT");
ENC_REPLICATE("macTurkish", "ASCII-8BIT");
ENC_REPLICATE("macUkraine", "ASCII-8BIT");
ENC_REPLICATE("CP950", "Big5");
ENC_SET_BASE("Big5-HKSCS", "Big5");
ENC_ALIAS("Big5-HKSCS:2008", "Big5-HKSCS");
ENC_REPLICATE("CP951", "Big5-HKSCS");
ENC_SET_BASE("Big5-UAO", "Big5");
ENC_REPLICATE("stateless-ISO-2022-JP", "Emacs-Mule");
ENC_ALIAS("eucJP", "EUC-JP") /* UI-OSF Application Platform Profile for Japanese Environment Version 1.1 */;
ENC_REPLICATE("eucJP-ms", "EUC-JP") /* TOG/JVC CDE/Motif Technical WG */;
ENC_ALIAS("euc-jp-ms", "eucJP-ms");
ENC_REPLICATE("CP51932", "EUC-JP");
ENC_REPLICATE("EUC-JIS-2004", "EUC-JP") /* defined at JIS X 0213:2004 */;
ENC_ALIAS("EUC-JISX0213", "EUC-JIS-2004") /* defined at JIS X 0213:2000, and obsolete at JIS X 0213:2004 */;
ENC_ALIAS("eucKR", "EUC-KR");
ENC_ALIAS("eucTW", "EUC-TW");
ENC_ALIAS("EUC-CN", "GB2312");
ENC_ALIAS("eucCN", "GB2312");
ENC_REPLICATE("GB12345", "GB2312");
ENC_ALIAS("CP936", "GBK");
ENC_DUMMY("ISO-2022-JP");
ENC_ALIAS("ISO2022-JP", "ISO-2022-JP");
ENC_REPLICATE("ISO-2022-JP-2", "ISO-2022-JP");
ENC_ALIAS("ISO2022-JP2", "ISO-2022-JP-2");
ENC_REPLICATE("CP50220", "ISO-2022-JP");
ENC_REPLICATE("CP50221", "ISO-2022-JP");
ENC_ALIAS("ISO8859-1", "ISO-8859-1");
ENC_ALIAS("ISO8859-2", "ISO-8859-2");
ENC_ALIAS("ISO8859-3", "ISO-8859-3");
ENC_ALIAS("ISO8859-4", "ISO-8859-4");
ENC_ALIAS("ISO8859-5", "ISO-8859-5");
ENC_ALIAS("ISO8859-6", "ISO-8859-6");
ENC_REPLICATE("Windows-1256", "ISO-8859-6");
ENC_ALIAS("CP1256", "Windows-1256");
ENC_ALIAS("ISO8859-7", "ISO-8859-7");
ENC_REPLICATE("Windows-1253", "ISO-8859-7");
ENC_ALIAS("CP1253", "Windows-1253");
ENC_ALIAS("ISO8859-8", "ISO-8859-8");
ENC_REPLICATE("Windows-1255", "ISO-8859-8");
ENC_ALIAS("CP1255", "Windows-1255");
ENC_ALIAS("ISO8859-9", "ISO-8859-9");
ENC_REPLICATE("Windows-1254", "ISO-8859-9");
ENC_ALIAS("CP1254", "Windows-1254");
ENC_ALIAS("ISO8859-10", "ISO-8859-10");
ENC_ALIAS("ISO8859-11", "ISO-8859-11");
ENC_REPLICATE("TIS-620", "ISO-8859-11");
ENC_REPLICATE("Windows-874", "ISO-8859-11");
ENC_ALIAS("CP874", "Windows-874");
ENC_ALIAS("ISO8859-13", "ISO-8859-13");
ENC_REPLICATE("Windows-1257", "ISO-8859-13");
ENC_ALIAS("CP1257", "Windows-1257");
ENC_ALIAS("ISO8859-14", "ISO-8859-14");
ENC_ALIAS("ISO8859-15", "ISO-8859-15");
ENC_ALIAS("ISO8859-16", "ISO-8859-16");
ENC_ALIAS("CP878", "KOI8-R");
ENC_REPLICATE("MacJapanese", "Shift_JIS");
ENC_ALIAS("MacJapan", "MacJapanese");
ENC_ALIAS("ASCII", "US-ASCII");
ENC_ALIAS("ANSI_X3.4-1968", "US-ASCII");
ENC_ALIAS("646", "US-ASCII");
ENC_DUMMY("UTF-7");
ENC_ALIAS("CP65000", "UTF-7");
ENC_ALIAS("CP65001", "UTF-8");
ENC_REPLICATE("UTF8-MAC", "UTF-8");
ENC_ALIAS("UTF-8-MAC", "UTF8-MAC");
ENC_ALIAS("UTF-8-HFS", "UTF8-MAC") /* Emacs 23.2 */;
ENC_DUMMY_UNICODE("UTF-16");
ENC_DUMMY_UNICODE("UTF-32");
ENC_ALIAS("UCS-2BE", "UTF-16BE");
ENC_ALIAS("UCS-4BE", "UTF-32BE");
ENC_ALIAS("UCS-4LE", "UTF-32LE");
ENC_ALIAS("CP932", "Windows-31J");
ENC_ALIAS("csWindows31J", "Windows-31J") /* IANA.  IE6 don't accept Windows-31J but csWindows31J. */;
ENC_ALIAS("SJIS", "Windows-31J");
ENC_ALIAS("PCK", "Windows-31J");
ENC_ALIAS("CP1250", "Windows-1250");
ENC_ALIAS("CP1251", "Windows-1251");
ENC_ALIAS("CP1252", "Windows-1252");
ENC_REPLICATE("UTF8-DoCoMo", "UTF-8");
ENC_REPLICATE("SJIS-DoCoMo", "Windows-31J");
ENC_REPLICATE("UTF8-KDDI", "UTF-8");
ENC_REPLICATE("SJIS-KDDI", "Windows-31J");
ENC_REPLICATE("ISO-2022-JP-KDDI", "ISO-2022-JP");
ENC_REPLICATE("stateless-ISO-2022-JP-KDDI", "stateless-ISO-2022-JP");
ENC_REPLICATE("UTF8-SoftBank", "UTF-8");
ENC_REPLICATE("SJIS-SoftBank", "Windows-31J");

#define ENCODING_COUNT 100
