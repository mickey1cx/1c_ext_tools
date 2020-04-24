﻿
&НаКлиенте
Процедура ПолучитьРоли(Команда)
	
	RegExp = Новый COMОбъект("VBScript.RegExp");// создаем объект для работы с регулярными выражениями
	RegExp.MultiLine = Истина;  // истина — текст многострочный, ложь — одна строка
	RegExp.Global = Истина;     // истина — поиск по всей строке, ложь — до первого совпадения
	RegExp.IgnoreCase = Истина; // истина — игнорировать регистр строки при поиске	
	
	Шаблон = "РольДоступна\(\""(\S+)\""\)";

	RegExp.Pattern = Шаблон;    // шаблон (регулярное выражение)	
	

	РезультатАнализаСтроки = RegExp.Execute(ТекстМодуля);

	УникальныеРоли = Новый Соответствие;
	МассивВыражений = Новый Массив;

	Для Каждого Выражение Из РезультатАнализаСтроки Цикл
	    СтруктураВыражение = Новый Структура ("Начало, Длина, Значение, ПодВыражения", Выражение.FirstIndex, Выражение.Length,Выражение.Value);

	    //Обработка подвыражений
	    МассивПодВыражений = Новый Массив;
		Для Каждого ПодВыражение Из Выражение.SubMatches Цикл
			УникальныеРоли.Вставить(ПодВыражение, ?(УникальныеРоли[ПодВыражение] = Неопределено, 1, УникальныеРоли[ПодВыражение] + 1));
	        МассивПодВыражений.Добавить(ПодВыражение);
	    КонецЦикла;
	    СтруктураВыражение.ПодВыражения = МассивПодВыражений;

	    МассивВыражений.Добавить (СтруктураВыражение);

	КонецЦикла;

	
	МассивРолей = Новый Массив;
	Для Каждого ЭлементКоллекции Из УникальныеРоли Цикл
		МассивРолей.Добавить(ЭлементКоллекции.Ключ + " : " + ЭлементКоллекции.Значение);
	КонецЦикла;
	
	Результат = СтрСоединить(МассивРолей, Символы.ПС);
	
КонецПроцедуры
