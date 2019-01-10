// начинаю писать с хвоста теста, в этом сервисе будем вычислять результат тестирования
import 'package:adizis_test_app/app_component.dart';

class GetResult {
  List<SkillBlock> listResult = List();
  GetResult(this.listResult);
  List<int> result_list_P = List(); //массив для записи результатов тестов P
  List<int> result_list_A = List(); //массив для записи результатов тестов A
  List<int> result_list_E = List(); //массив для записи результатов тестов E
  List<int> result_list_I = List(); //массив для записи результатов тестов I

  getResult(List<SkillBlock> listResult) {

    var test_result = Map(); //массив для вывода результатов PAEI

    test_result['P'] = getSumm(result_list_P);
    test_result['A'] = getSumm(result_list_A);
    test_result['E'] = getSumm(result_list_E);
    test_result['I'] = getSumm(result_list_I);

    print(test_result.toString()); //смотрим в консоли что получилось

    return test_result;
  }
  getSumm(List result_list) {
    int summ = 0;
    for(int i=0; i<12; i++){
      summ += result_list[i];
    }
    return summ;
  }
}