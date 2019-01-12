import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';
import 'dart:async';

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [
    MaterialRadioComponent,
    MaterialRadioGroupComponent,
    MaterialButtonComponent,
    MaterialProgressComponent,
    NgFor,
    NgIf,
    NgClass,
    NgModel,
    ViewChild,
    ViewChildren
    ],
  providers: [materialProviders]
)
class AppComponent {
  
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
    'Взаимодействующий', 'Теплый', 'Договаривающийся', 'Осведомленный', 'Приятный', 'Объединяющий'
  ];

  List listSkillBlocks = List<SkillBlock>(); // объект содержит показатели блока скиллов

  final skillScore = [1, 2, 3, 4]; //задаем значения для оценок скилла

  int selected_P = 1; // объявляем начальные значения оценок скиллов
  int selected_A = 1;
  int selected_E = 1;
  int selected_I = 1;

  int get value_P => selected_P; // получаем значения выбранных оценок для каждого скилла
  int get value_A => selected_A;
  int get value_E => selected_E;
  int get value_I => selected_I;

  int counter = 0; // номер блока с вопросами
  int _total = 0; // сумма выбранных скиллов
  int _aviable_P = 4; // доступное количество выборов в группе
  int _aviable_A = 4; // доступное количество выборов в группе
  int _aviable_E = 4; // доступное количество выборов в группе
  int _aviable_I = 4; // доступное количество выборов в группе
  /** Метод для контроля общего результата 10 баллов */
  void onChange() {
    Future((){ // два дня разбирался - надо подождать отработки результата и тогда его только вычислять
      totalSkills();
      checkAviability();
    });
  }
/* Функция расчета суммы выборов */
  void totalSkills(){
    print("P "+value_P.toString());
    print("A "+value_A.toString());
    print("E "+value_E.toString());
    print("I "+value_I.toString());
    if(value_A!=null && value_E!=null && value_I!=null && value_P!=null){
    _total = value_P + value_A + value_E + value_I;
    print("сумма оценок = "+_total.toString());
    }
  }

  int get total => _total;

  /* Проверка доступности колличества выборов */

  void checkAviability() {
    _aviable_P = 11 - _total;
    _aviable_A = 11 - _total;
    _aviable_E = 11 - _total;
    _aviable_I = 11 - _total;
  }

  int get aviable_P => _aviable_P;
  int get aviable_A => _aviable_A;
  int get aviable_E => _aviable_E;
  int get aviable_I => _aviable_I;

/* нажатие кнопки перехода к другому блоку вопросов */
  increment() {
    if(counter<11){
  //создаем объект с результатами оценок одного блока (предыдущий блок)
    SkillBlock block = SkillBlock(counter, value_P, value_A, value_E, value_I);
    listSkillBlocks.add(block); // пишем оценки блока в массив

    counter++;
    print("номер блока "+(counter+1).toString());
    uncheckAll(); //снимаем выборы со всех радио
    }
  }
  // геттеры названий скиллов
  String get skill_P => list_P[counter];
  String get skill_A => list_A[counter];
  String get skill_E => list_E[counter];
  String get skill_I => list_I[counter];

  @ViewChildren(MaterialRadioGroupComponent)
  List<MaterialRadioGroupComponent> groups;
  List<MaterialRadioComponent> radios;


  void uncheckAll() {
    
    for(MaterialRadioGroupComponent child in groups){
    //  print(child.selected);
      child.selected = 1; // при переходе к другому блоку преселект первых оценок
    }
    }

    int get count => counter;

    // выбор класса видимость или невидимость для страницы с результатом
    bool _trigger = false;
/** В этом коде получаем результат теста и меняем видимость страницы результата */
    void viewResult() {
      _trigger = true;
      SkillBlock block = SkillBlock(counter, value_P, value_A, value_E, value_I);
    listSkillBlocks.add(block); // пишем оценки блока в массив

      _getResult();
    }

    bool get trigger => _trigger; // триггер видимости блока для html

    int result_P=0;
    int result_A=0;
    int result_E=0;
    int result_I=0;

// функция для вызова кнопкой "Узнать результат"
    void _getResult() {
      result_P = getSumm_P();
      result_A = getSumm_A();
      result_E = getSumm_E();
      result_I = getSumm_I();
  }
// геттеры для html
  int get P => result_P;
  int get A => result_A;
  int get E => result_E;
  int get I => result_I;
// сумматоры показателей для вычисления результата
  getSumm_P () {int summ = 0; for(SkillBlock block in listSkillBlocks){summ+=block.value_P;} return summ;}
  getSumm_A () {int summ = 0; for(SkillBlock block in listSkillBlocks){summ+=block.value_A;} return summ;}
  getSumm_E () {int summ = 0; for(SkillBlock block in listSkillBlocks){summ+=block.value_E;} return summ;}
  getSumm_I () {int summ = 0; for(SkillBlock block in listSkillBlocks){summ+=block.value_I;} return summ;}

  }
// для записи результатов оценок каждого блока
  class SkillBlock {
    int id;
    int value_P;
    int value_A;
    int value_E;
    int value_I;
    SkillBlock(this.id, this.value_P, this.value_A, this.value_E, this.value_I);
  }

  // TODO нажатие кнопки Узнать результат второй раз деактивировать - возможно вывести сообщение пройти тест еще раз
