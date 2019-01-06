//import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:adizis_test_app/src/test_forms/radio_component.dart';
//import 'package:angular_router/angular_router.dart';

@Component(
  selector: 'test-forms',
  styleUrls: ['test_form_component.css'],
  templateUrl: 'test_form_component.html',
  directives: [
    MaterialButtonComponent,
    RadioScreenComponent,
    NgIf
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

  int counter=0;

  increment() {
    if(counter<11){
    counter++;
    }
  }

  decrement() {
    if(counter!=0){
      counter--;
    }
  }

  String get skill_P => list_P[counter];
  String get skill_A => list_A[counter];
  String get skill_E => list_E[counter];
  String get skill_I => list_I[counter];


  List<int> result_list_P = List(); //массив для записи результатов тестов P
  List<int> result_list_A = List(); //массив для записи результатов тестов A
  List<int> result_list_E = List(); //массив для записи результатов тестов E
  List<int> result_list_I = List(); //массив для записи результатов тестов I

}

//TODO: сделать вывод наименований скиллов в соответствии с номером блока вопросов