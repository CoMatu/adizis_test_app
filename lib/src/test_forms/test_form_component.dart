//import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:adizis_test_app/src/services/get_result.dart';

@Component(
  selector: 'test-forms',
  styleUrls: ['test_form_component.css'],
  templateUrl: 'test_form_component.html',
  directives: [
    MaterialRadioGroupComponent,
    MaterialRadioComponent,
    MaterialButtonComponent,
    MaterialSliderComponent
      ],
//  providers: [ClassProvider(TodoListService)],
)

class TestFormComponent {
  int count = 0;

  List<int> result_list_P = List(); //массив для записи результатов тестов P
  List<int> result_list_A = List(); //массив для записи результатов тестов A
  List<int> result_list_E = List(); //массив для записи результатов тестов E
  List<int> result_list_I = List(); //массив для записи результатов тестов I

  increase() {
    count++;
    return count;
  }

  getResultP() {

  }

}