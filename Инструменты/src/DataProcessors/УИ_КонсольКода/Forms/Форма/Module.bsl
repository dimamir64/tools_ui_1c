&НаКлиенте
Перем ЗакрытиеФормыПодтверждено;

#Область СобытияФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	ПолеАлгоритмаСервер=УИ_РедакторКодаКлиентСервер.ТекстHTMLРедактораКода();
	ПолеАлгоритмаКлиент=УИ_РедакторКодаКлиентСервер.ТекстHTMLРедактораКода();
КонецПроцедуры

&НаКлиенте
Процедура ПередЗакрытием(Отказ, ЗавершениеРаботы, ТекстПредупреждения, СтандартнаяОбработка)
	Если Не ЗакрытиеФормыПодтверждено Тогда
		Отказ = Истина;
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	Если УИ_ОбщегоНазначенияКлиентСервер.ПолеHTMLПостроеноНаWebkit() Тогда
		Элементы.ГруппаСтраницыТекстАлгоритмаКлиент.ТекущаяСтраница=Элементы.ГруппаСтраницаПолеАлгоритмаКлиент;
		Элементы.ГруппаСтраницыТекстАлгоритмаСервер.ТекущаяСтраница=Элементы.ГруппаСтраницаПолеАлгоритмаСервер;
	Иначе
		Элементы.ГруппаСтраницыТекстАлгоритмаКлиент.ТекущаяСтраница=Элементы.ГруппаСтраницаТекстАлгоритмаКлиент;
		Элементы.ГруппаСтраницыТекстАлгоритмаСервер.ТекущаяСтраница=Элементы.ГруппаСтраницаТекстАлгоритмаСервер;
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура ТекстАлгоритмаКлиентДокументСформирован(Элемент)
	Если ЗначениеЗаполнено(ТекстАлгоритмаКлиент) Тогда
		ПодключитьОбработчикОжидания("ОбработчикОжиданияУстановитьТекстКодаВРедактореТекстаКлиент", 0.1, Истина);
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура ТекстАлгоритмаСерверДокументСформирован(Элемент)
	Если ЗначениеЗаполнено(ТекстАлгоритмаСервер) Тогда
		ПодключитьОбработчикОжидания("ОбработчикОжиданияУстановитьТекстКодаВРедактореТекстаСервер", 0.1, Истина);
	КонецЕсли;
КонецПроцедуры
#КонецОбласти

#Область СобытияКомандФормы
&НаКлиенте
Процедура ЗакрытьКонсоль(Команда)
	ПоказатьВопрос(Новый ОписаниеОповещения("ЗакрытьКонсольЗавершение", ЭтаФорма), "Выйти из консоли кода?",
		РежимДиалогаВопрос.ДаНет);
КонецПроцедуры

&НаКлиенте
Процедура ВыполнитьКод(Команда)
	//.1 Нужно обновить значения данных алгоритмов
	ОбновитьЗначениеПеременныхАлгоритмовИзРедактора();

	СтруктураПередачи = Неопределено;
	ВыполнитьАлгоритмНаКлиенте(СтруктураПередачи);
	ВыполнитьАлгоритмНаСервере(СтруктураПередачи);
КонецПроцедуры

&НаКлиенте
Процедура РедактироватьЗначениеКлиентскойПеременной(Команда)
	РедактироватьЗначениеПеременной(Элементы.ПеременныеКлиент);
КонецПроцедуры

&НаКлиенте
Процедура РедактироватьЗначениеСервернойПеременной(Команда)
	РедактироватьЗначениеПеременной(Элементы.ПеременныеСервер);
КонецПроцедуры

&НаКлиенте
Процедура НовыйАлгоритм(Команда)
	ИмяФайлаАлгоритма="";

	ТекстАлгоритмаКлиент="";
	ТекстАлгоритмаСервер="";

	Если УИ_ОбщегоНазначенияКлиентСервер.ПолеHTMLПостроеноНаWebkit() Тогда
		УИ_РедакторКодаКлиентСервер.УстановитьТекстРедактораЭлемента(Элементы.ПолеАлгоритмаКлиент,
			ТекстАлгоритмаКлиент);
		УИ_РедакторКодаКлиентСервер.УстановитьТекстРедактораЭлемента(Элементы.ПолеАлгоритмаСервер,
			ТекстАлгоритмаСервер);
	КонецЕсли;

	УстановитьЗаголовок();
КонецПроцедуры

&НаКлиенте
Процедура ОткрытьФайл(Команда)
	УИ_ОбщегоНазначенияКлиент.ПрочитатьДанныеКонсолиИзФайла("КонсольКода", СтруктураОписанияСохраняемогоФайла(),
		Новый ОписаниеОповещения("ОткрытьФайлЗавершение", ЭтотОбъект));
КонецПроцедуры

&НаКлиенте
Процедура СохранитьФайл(Команда)
	СохранитьФайлНаДиск();
КонецПроцедуры

&НаКлиенте
Процедура СохранитьФайлКак(Команда)
	СохранитьФайлНаДиск(Истина);
КонецПроцедуры
#КонецОбласти

#Область ПрочиеФункции

&НаКлиенте
Функция СтруктураОписанияСохраняемогоФайла()
	Структура=УИ_ОбщегоНазначенияКлиент.ПустаяСтруктураОписанияВыбираемогоФайла();
	Структура.ИмяФайла=ИмяФайлаАлгоритма;

	УИ_ОбщегоНазначенияКлиент.ДобавитьФорматВОписаниеФайлаСохранения(Структура, "Файл алгоритма(*.xbsl)", "xbsl");
	Возврат Структура;
КонецФункции

&НаКлиенте
Процедура СохранитьФайлНаДиск(СохранитьКак = Ложь)
	ОбновитьЗначениеПеременныхАлгоритмовИзРедактора();

	УИ_ОбщегоНазначенияКлиент.СохранитьДанныеКонсолиВФайл("КонсольКода", СохранитьКак,
		СтруктураОписанияСохраняемогоФайла(), ПолучитьСтрокуСохранения(),
		Новый ОписаниеОповещения("СохранитьФайлЗавершение", ЭтотОбъект));
КонецПроцедуры

&НаКлиенте
Процедура СохранитьФайлЗавершение(ИмяФайлаСохранения, ДополнительныеПараметры) Экспорт
	Если ИмяФайлаСохранения = Неопределено Тогда
		Возврат;
	КонецЕсли;

	Если Не ЗначениеЗаполнено(ИмяФайлаСохранения) Тогда
		Возврат;
	КонецЕсли;

	Модифицированность=Ложь;
	ИмяФайлаАлгоритма=ИмяФайлаСохранения;
	УстановитьЗаголовок();
	
//	Сообщить("Алгоритм успешно сохранен");

КонецПроцедуры

&НаКлиенте
Процедура ОткрытьФайлЗавершение(Результат, ДополнительныеПараметры) Экспорт
	Если Результат = Неопределено Тогда
		Возврат;
	КонецЕсли;

	Модифицированность=Ложь;
	ИмяФайлаАлгоритма = Результат.ИмяФайла;

	ОткрытьАлгоритмНаСервере(Результат.Адрес);

	Если УИ_ОбщегоНазначенияКлиентСервер.ПолеHTMLПостроеноНаWebkit() Тогда
		УИ_РедакторКодаКлиентСервер.УстановитьТекстРедактораЭлемента(Элементы.ПолеАлгоритмаКлиент,
			ТекстАлгоритмаКлиент);
		УИ_РедакторКодаКлиентСервер.УстановитьТекстРедактораЭлемента(Элементы.ПолеАлгоритмаСервер,
			ТекстАлгоритмаСервер);
	КонецЕсли;

	УстановитьЗаголовок();
КонецПроцедуры

&НаКлиенте
Процедура ЗакрытьКонсольЗавершение(Результат, ДополнительныеПараметры) Экспорт

	Если Результат = КодВозвратаДиалога.Да Тогда
		ЗакрытиеФормыПодтверждено = Истина;
		Закрыть();
	КонецЕсли;

КонецПроцедуры

&НаКлиенте
Процедура ОбработчикОжиданияУстановитьТекстКодаВРедактореТекстаКлиент()
	Попытка
		УИ_РедакторКодаКлиентСервер.УстановитьТекстРедактораЭлемента(Элементы.ПолеАлгоритмаКлиент,
			ТекстАлгоритмаКлиент);
	Исключение
		ПодключитьОбработчикОжидания("ОбработчикОжиданияУстановитьТекстКодаВРедактореТекстаКлиент", 0.5, Истина);
	КонецПопытки;
КонецПроцедуры

&НаКлиенте
Процедура ОбработчикОжиданияУстановитьТекстКодаВРедактореТекстаСервер()
	Попытка
		УИ_РедакторКодаКлиентСервер.УстановитьТекстРедактораЭлемента(Элементы.ТекстАлгоритмаСервер,
			ТекстАлгоритмаСервер);
	Исключение
		ПодключитьОбработчикОжидания("ОбработчикОжиданияУстановитьТекстКодаВРедактореТекстаСервер", 0.5, Истина);
	КонецПопытки;
КонецПроцедуры

&НаКлиенте
Процедура ОбновитьЗначениеПеременныхАлгоритмовИзРедактора()
	Если Не УИ_ОбщегоНазначенияКлиентСервер.ПолеHTMLПостроеноНаWebkit() Тогда
		Возврат;
	КонецЕсли;

	ТекстАлгоритмаКлиент=УИ_РедакторКодаКлиентСервер.ТекстРедактораИзПоляРедактора(Элементы.ПолеАлгоритмаКлиент);
	ТекстАлгоритмаСервер=УИ_РедакторКодаКлиентСервер.ТекстРедактораИзПоляРедактора(Элементы.ПолеАлгоритмаСервер);
КонецПроцедуры

&НаКлиентеНаСервереБезКонтекста
Функция ПодготовленныйКодАлгоритма(ТекстКода, Переменные)
	ПодготовленныйКод="";

	Для НомерПеременной = 0 По Переменные.Количество() - 1 Цикл
		ТекПеременная=Переменные[НомерПеременной];
		ПодготовленныйКод=ПодготовленныйКод + Символы.ПС + ТекПеременная.Имя + "=Переменные[" + Формат(НомерПеременной,
			"ЧН=0; ЧГ=0;") + "].Значение;";
	КонецЦикла;

	ПодготовленныйКод=ПодготовленныйКод + Символы.ПС + ТекстКода;

	Возврат ПодготовленныйКод;
КонецФункции

&НаКлиентеНаСервереБезКонтекста
Функция ВыполнитьАлгоритм(ТекстАлготима, Переменные, СтруктураПередачи)
	Успешно = Истина;
	ОписаниеОшибки = "";

	НачалоВыполнения = ТекущаяУниверсальнаяДатаВМиллисекундах();
	Попытка
		Выполнить (ТекстАлготима);
	Исключение
		Успешно = Ложь;
		ОписаниеОшибки = ОписаниеОшибки();
		Сообщить(ОписаниеОшибки);
	КонецПопытки;
	ОкончаниеВыполнения = ТекущаяУниверсальнаяДатаВМиллисекундах();

	РезультатВыполнения = Новый Структура;
	РезультатВыполнения.Вставить("Успешно", Успешно);
	РезультатВыполнения.Вставить("ВремяВыполнения", ОкончаниеВыполнения - НачалоВыполнения);
	РезультатВыполнения.Вставить("ОписаниеОшибки", ОписаниеОшибки);

	Возврат РезультатВыполнения;
КонецФункции

&НаКлиенте
Процедура ВыполнитьАлгоритмНаКлиенте(СтруктураПередачи)
	КодАлгоритма = ПодготовленныйКодАлгоритма(ТекстАлгоритмаКлиент, ПеременныеКлиент);

	Если Не ЗначениеЗаполнено(СокрЛП(КодАлгоритма)) Тогда
		Возврат;
	КонецЕсли;

	РезультатыВыполнения = ВыполнитьАлгоритм(КодАлгоритма, ПеременныеКлиент, СтруктураПередачи);

	Если РезультатыВыполнения.Успешно Тогда
		ЗаголовокЭлемента = "&&НаКлиенте (Время выполнения кода: " + Строка((РезультатыВыполнения.ВремяВыполнения)
			/ 1000) + " сек.)";
	Иначе
		ЗаголовокЭлемента = "&&НаКлиенте";
	КонецЕсли;
	Элементы.ГруппаКлиент.Заголовок = ЗаголовокЭлемента;

КонецПроцедуры

&НаСервере
Процедура ВыполнитьАлгоритмНаСервере(СтруктураПередачи)
	КодАлгоритма = ПодготовленныйКодАлгоритма(ТекстАлгоритмаСервер, ПеременныеСервер);

	Если Не ЗначениеЗаполнено(СокрЛП(КодАлгоритма)) Тогда
		Возврат;
	КонецЕсли;

	РезультатыВыполнения = ВыполнитьАлгоритм(КодАлгоритма, ПеременныеСервер, СтруктураПередачи);

	Если РезультатыВыполнения.Успешно Тогда
		ЗаголовокЭлемента = "&&НаСервере (Время выполнения кода: " + Строка((РезультатыВыполнения.ВремяВыполнения)
			/ 1000) + " сек.)";
	Иначе
		ЗаголовокЭлемента = "&&НаСервере";
	КонецЕсли;
	Элементы.ГруппаСервер.Заголовок = ЗаголовокЭлемента;

КонецПроцедуры

&НаСервере
Функция ПолучитьСтрокуСохранения()

	СохраняемыеДанные = Новый Структура;
	СохраняемыеДанные.Вставить("ТекстАлгоритмаКлиент", ТекстАлгоритмаКлиент);
	СохраняемыеДанные.Вставить("ТекстАлгоритмаСервер", ТекстАлгоритмаСервер);

	МассивПеременных=Новый Массив;
	Для Каждого ТекПеременная Из ПеременныеКлиент Цикл
		СтруктураПеременной=Новый Структура;
		СтруктураПеременной.Вставить("Имя", ТекПеременная.Имя);
		СтруктураПеременной.Вставить("Значение", ЗначениеВСтрокуВнутр(ТекПеременная.Значение));

		МассивПеременных.Добавить(СтруктураПеременной);
	КонецЦикла;
	СохраняемыеДанные.Вставить("ПеременныеКлиент", МассивПеременных);

	МассивПеременных=Новый Массив;
	Для Каждого ТекПеременная Из ПеременныеСервер Цикл
		СтруктураПеременной=Новый Структура;
		СтруктураПеременной.Вставить("Имя", ТекПеременная.Имя);
		СтруктураПеременной.Вставить("Значение", ЗначениеВСтрокуВнутр(ТекПеременная.Значение));

		МассивПеременных.Добавить(СтруктураПеременной);
	КонецЦикла;
	СохраняемыеДанные.Вставить("ПеременныеСервер", МассивПеременных);

	ЗаписьJSON=Новый ЗаписьJSON;
	ЗаписьJSON.УстановитьСтроку();

	ЗаписатьJSON(ЗаписьJSON, СохраняемыеДанные);

	Возврат ЗаписьJSON.Закрыть();

КонецФункции
&НаСервере
Процедура ОткрытьАлгоритмНаСервере(АдресФайлаВоВременномХранилище)
	ДанныеФайла=ПолучитьИзВременногоХранилища(АдресФайлаВоВременномХранилище);

	ЧтениеJSON=Новый ЧтениеJSON;
	ЧтениеJSON.ОткрытьПоток(ДанныеФайла.ОткрытьПотокДляЧтения());

	СтруктураФайла=ПрочитатьJSON(ЧтениеJSON);
	ЧтениеJSON.Закрыть();

	ТекстАлгоритмаКлиент=СтруктураФайла.ТекстАлгоритмаКлиент;
	ТекстАлгоритмаСервер=СтруктураФайла.ТекстАлгоритмаСервер;

	ПеременныеКлиент.Очистить();
	Для Каждого Переменная Из СтруктураФайла.ПеременныеКлиент Цикл
		НС=ПеременныеКлиент.Добавить();
		НС.Имя=Переменная.Имя;
		НС.Значение=ЗначениеИзСтрокиВнутр(Переменная.Значение);
	КонецЦикла;

	ПеременныеСервер.Очистить();
	Для Каждого Переменная Из СтруктураФайла.ПеременныеСервер Цикл
		НС=ПеременныеСервер.Добавить();
		НС.Имя=Переменная.Имя;
		НС.Значение=ЗначениеИзСтрокиВнутр(Переменная.Значение);
	КонецЦикла;

КонецПроцедуры
&НаКлиенте
Процедура РедактироватьЗначениеПеременной(ТаблицаФормы)
	ТекДанные=ТаблицаФормы.ТекущиеДанные;
	Если ТекДанные = Неопределено Тогда
		Возврат;
	КонецЕсли;

	УИ_ОбщегоНазначенияКлиент.РедактироватьОбъект(ТекДанные.Значение);
КонецПроцедуры

&НаКлиенте
Процедура УстановитьЗаголовок()
	Заголовок=ИмяФайлаАлгоритма;
КонецПроцедуры

#КонецОбласти

ЗакрытиеФормыПодтверждено=Ложь;