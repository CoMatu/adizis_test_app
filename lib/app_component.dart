import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';

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

  List listSkillBlocks = List<SkillBlock>();

  int counter=0;

  increment() {
    //bool check = false; // есть ли объект с таким же id 
    if(counter<11){
  //создаем объект с результатами оценок одного блока
    SkillBlock block = SkillBlock(counter, value_P, value_A, value_E, value_I);
/*
  //проверяем, нет ли объекта с таким же id в массиве
  for(SkillBlock entry in listSkillBlocks) {
    if(entry.id==counter) {
      listSkillBlocks.removeAt(counter);
    }
  }
  */
    listSkillBlocks.add(block); // пишем оценки блока в массив

    counter++;
    print(counter);
    uncheckAll(); //снимаем выборы со всех радио
    }
  }
/* нажатие кнопки назад
  decrement() {
    if(counter!=0){
      counter--;
      print("D"+counter.toString());
    }
  }
*/
  String get skill_P => list_P[counter];
  String get skill_A => list_A[counter];
  String get skill_E => list_E[counter];
  String get skill_I => list_I[counter];

  final scillScore = [1, 2, 3, 4]; //задаем значения для оценок скилла
  int selected_P = 0; // объявляем начальные значения оценок скиллов
  int selected_A = 0;
  int selected_E = 0;
  int selected_I = 0;

  int get value_P => selected_P; // получаем значения выбранных оценок для каждого скилла
  int get value_A => selected_A;
  int get value_E => selected_E;
  int get value_I => selected_I;

 // String get result => (value_P+value_A+value_E+value_I).toString(); // выводим сумму оценок

  @ViewChildren(MaterialRadioGroupComponent)
  List<MaterialRadioGroupComponent> groups;

  void uncheckAll() {
    for(MaterialRadioGroupComponent child in groups){
    //  print(child.selected);
      child.selected = null;
    }
    }

    int get count => counter;
  }

  class SkillBlock {
    int id;
    int value_P;
    int value_A;
    int value_E;
    int value_I;
    SkillBlock(this.id, this.value_P, this.value_A, this.value_E, this.value_I);
  }

  // TODO сделать вывод выборов из массива при возврате на предыдущие блоки
  // TODO сделать ограничение по выборам оценок = не больше 10 баллов в каждом блоке
  // TODO сделать не активной кнопку навигации НАЗАД на первой странице
  // TODO сделать не активной кнопку ДАЛЕЕ на последнем блоке
  // TODO добавить кнопку получения результата теста