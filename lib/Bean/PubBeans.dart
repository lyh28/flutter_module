import '../Bean/PushLineBean.dart';
import '../Bean/PersonBean.dart';
import '../Bean/ButtonBean.dart';
import '../Bean/OfficialBean.dart';
import '../Requset/KuGouRequest.dart';
//存储类对象
class Beans {
  static List<PersonBean> personBeanList;
  static List<PushLineBean> pushLineList;
  static List<ButtonBean> buttonList;
  static List<OfficialBean> officialList;

  static int personindex = 0;

  static void clearCache() {
    personindex = 0;
//    personBeanList = null;
    pushLineList = null;
    buttonList = null;
//    officialList = null;
    print("清理 $personBeanList  $pushLineList  $buttonList  $officialList");
  }

  static Future initPushLine() async {
    print("请求initPushLine");
    Map map = await KuGouRequest.getJsonData(KuGouRequest.PUSH_URL);
    pushLineList = PushLineBean.getListFromJSON(map);
//    print("pushline:  $pushLineList");
  }

  static Future initPerson() async {
    print("请求initPerson");
    Map map = await KuGouRequest.getJsonData(KuGouRequest.PERSON_URL);
    personBeanList = PersonBean.getListFromJSON(map);
//    print("pushline:  $pushLineList");
  }

  static Future initButton() async {
    print("请求initButton");
    Map map = await KuGouRequest.getJsonData(KuGouRequest.BUTTON_URL);
    buttonList = ButtonBean.getListFromJSON(map);
//    print("buttonList:  $buttonList");
  }

  static Future initOfficial() async {
    print("请求initOfficial");
    Map map = await KuGouRequest.getJsonData(KuGouRequest.OFFICIAL_URL);
    officialList = OfficialBean.getListFromJSON(map);
//    print("officialList:  $officialList");
  }

  static Future loadMore() async {
    Map map = await KuGouRequest.getJsonData(KuGouRequest.PERSON_URL);
    personBeanList.addAll(PersonBean.getListFromJSON(map));
//    print("personBeanList:  $personBeanList");
  }

  static bool checkNull() {
    return personBeanList == null ||
        pushLineList == null ||
        buttonList == null ;
  }
}