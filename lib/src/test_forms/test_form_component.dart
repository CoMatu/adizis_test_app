import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:adizis_test_app/src/test_forms/radio_component.dart';

@Component(
  selector: 'test-forms',
  styleUrls: ['test_form_component.css'],
  templateUrl: 'test_form_component.html',
  directives: [
    MaterialRadioGroupComponent,
    MaterialRadioComponent,
    MaterialButtonComponent,
    MaterialCheckboxComponent,
    NgFor,
    RadioScreenComponent
  ],
  providers: [materialProviders],
)

class TestFormComponent {

  final List<String> list_P = [
    'Вовлеченный', 'Прямолинейный', 'Делающий', 'Отдающий себе отчет', 'Результативный', 
    'Упорный', 'Активный', 'Прагматичный', 'Побеждающий', 'Рациональный', 'Деловой', 'Реалистичный'
  ];
  final List<String> list_A = [
    'Сомневающийся', 'Анализирующий', 'Созерцающий', 'Оценивающий', 'Логичный', 'Консервативный', 
    'Наблюдающий', 'Размышляющий', 'Точный', 'Сдержанный', 'Аккуратный', 'Осторожный'
  ];
  final List<String> list_E = [
    'Яркий', 'Харизматичный', 'Провоцирующий', 'Идущий на риск', 'Задающий вопросы', 'Радикальный', 
    'Абстрактный', 'Смотрящий в будущее', 'Концептуальный', 'Генерирующий идеи', 'Творческий', 'Мечтающий'
  ];
  final List<String> list_I = [
    'Отзывчивый', 'Чувствующий', 'Сопереживающий', 'Благожелательный', 'Интуитивный', 'Общительный', 
    'Взаимодействующий', 'Теплый', 'Стремящийся к консенсусу', 'Осведомленный', 'Приятный', 'Объединяющий'
  ];

  List<int> result_list_P = List(); //массив для записи результатов тестов P
  List<int> result_list_A = List(); //массив для записи результатов тестов A
  List<int> result_list_E = List(); //массив для записи результатов тестов E
  List<int> result_list_I = List(); //массив для записи результатов тестов I

}