
&НаКлиенте
Процедура ПриНажатииОткрытьВСБИСПолучитьUID( Команда, ПараметрКоманды ) Экспорт 
	context_params	= Saby_Core.ПроверитьНаличиеПараметровПодключения();
	Если ТребуетсяАутентификация(context_params, Команда, ПараметрКоманды) Тогда
		Возврат;
	КонецЕсли;	
	
	мСсылок = ПолучитьСписокСсылокНаОбъектыКоманды( ПараметрКоманды );
	ПроверкаОбмена = Saby_ВстраиваниеВСтандартныеФормы.ПроисходилЛиОбменДокументовСоСБИС(мСсылок.Источник);
	Если ПроверкаОбмена.ОбменаНебыло.Количество()  > 0 Тогда
		ДопПараметры		= Новый Структура("Данные, Форма", ПроверкаОбмена, ПараметрКоманды.Форма );
		ДействиеВопроса = Новый ОписаниеОповещения("ОтветНаВопросОтправитьДокументыВСБИС", Saby_КомандыОбменаДляФормыКлиент, ДопПараметры);
		ПоказатьВопрос(ДействиеВопроса, 
			"Среди выбранных для открытия документов есть "+
			Формат(ПроверкаОбмена.ОбменаНебыло.Количество(), "ЧГ=0")+
			" которые в СБИС не загружались. Загрузить их?",
			РежимДиалогаВопрос.ДаНетОтмена,0,КодВозвратаДиалога.Да,"Документ не найден в SABY");	
	Иначе
		ОткрытьВСБИС_ПолучитьURL( ПроверкаОбмена.БылОбмен, ПараметрКоманды );
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура ОтветНаВопросОтправитьДокументыВСБИС(Результат, Параметры) Экспорт // здесь, думаю, комм
	Если Результат = КодВозвратаДиалога.Да Тогда
		мСсылок = ПолучитьСписокСсылокНаОбъектыКоманды(Параметры.Данные.ОбменаНебыло);
		ОткрытьФорму("Обработка.SABY.Форма.ЗагрузкаДокументов", мСсылок, Параметры.Форма);
	ИначеЕсли Результат = КодВозвратаДиалога.Нет Тогда
		//Получим ссылки на обработанные документы и откроем их в окнах
		ОткрытьВСБИС_ПолучитьURL( Параметры.Данные.БылОбмен, Параметры );
	Иначе
		//При отмене как и полагается не будем ни чего делать
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура ОтветНаВопросОтправитьВложенияВСБИС(Результат, Параметры) Экспорт // здесь, думаю, комм
	Если Результат = КодВозвратаДиалога.Да Тогда
		мСсылок = ПолучитьСписокСсылокНаОбъектыКоманды(Параметры.Данные.ОбменаНебыло);
		ОткрытьФорму("Обработка.SABY.Форма.ЗагрузкаДокументов", мСсылок, Параметры.Форма);
	ИначеЕсли Результат = КодВозвратаДиалога.Нет Тогда
		//Получим ссылки на обработанные документы и откроем их в окнах
		ВыгрузитьВложенияИзСБИС( Параметры.Данные.БылОбмен, Параметры );
	Иначе
		//При отмене как и полагается не будем ни чего делать
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура ОткрытьВСБИС_ПолучитьURL_ПослеАутентификации(Результат, Параметры) Экспорт 
	Если Результат <> Неопределено Тогда
		ОткрытьВСБИС_ПолучитьURL( Параметры.Источник, Параметры.ПараметрКоманды );
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура ОткрытьВСБИС_ПолучитьURL( Источник, ПараметрКоманды ) Экспорт 
	ОшибкаВыполнения	= Ложь;
	Попытка
		СсылкиНаДокументыВСБИС = Saby_ВстраиваниеВСтандартныеФормы.ПолучитьСсылкиНаДокументыВСБИС( Источник );
	Исключение
		ОшибкаВыполнения	= Истина;
		ИнфоОбОшибке = ИнформацияОбОшибке();
		СтруктураОшибки = Saby_Core.ExtExceptionAnalyse(ИнфоОбОшибке);
		Если СтруктураОшибки.type = "Unauthorized" Тогда
			//Открыть форму аутентификации
			ВходяшиеПараметры	= Новый Структура("Источник, ПараметрКоманды",Источник,ПараметрКоманды);
			ПроверкаВведенныхДанныхАутентификации = Новый ОписаниеОповещения("ОткрытьВСБИС_ПолучитьURL_ПослеАутентификации", Saby_КомандыОбменаДляФормыКлиент, ВходяшиеПараметры);
			ОткрытьФорму("Обработка.SABY.Форма.Вход",,,,,, ПроверкаВведенныхДанныхАутентификации);
			Возврат;
		Иначе
			СтруктураОшибки = Saby_Core.ExtExceptionAnalyse(ИнфоОбОшибке);
			//Если эти параметры отсутствуею, то и в настройках параметров подключения находится или Неопределено
			//или пустая структура, значит необходимо вызвать окно авторизации
			Если	Найти(СтруктураОшибки.message, "api_url") > 0 ИЛИ
					Найти(СтруктураОшибки.message, "password") > 0 ИЛИ
					Найти(СтруктураОшибки.message, "login") > 0 ИЛИ
					Найти(СтруктураОшибки.message, "api") > 0 Тогда
				ВходяшиеПараметры	= Новый Структура("Источник, ПараметрКоманды",Источник,ПараметрКоманды);
				ПроверкаВведенныхДанныхАутентификации = Новый ОписаниеОповещения("ОткрытьВСБИС_ПолучитьURL_ПослеАутентификации", Saby_КомандыОбменаДляФормыКлиент, ВходяшиеПараметры);
				ОткрытьФорму("Обработка.SABY.Форма.Вход",,,,,, ПроверкаВведенныхДанныхАутентификации);
				Возврат;
			Иначе
				ПоказатьОповещениеПользователя("Ошибка",,СтруктураОшибки.message,БиблиотекаКартинок["Ошибка32"],СтатусОповещенияПользователя.Важное, Новый УникальныйИдентификатор);
			КонецЕсли;
		КонецЕсли;
	КонецПопытки;
	
	Если	Не ОшибкаВыполнения И СсылкиНаДокументыВСБИС.ОбработаноСОшибкой.Количество()  > 0 Тогда
		ДопПараметры		= Новый Структура("Данные, Форма", СсылкиНаДокументыВСБИС.ОбработаноСОшибкой, ПараметрКоманды.Форма );
		ДействиеВопроса = Новый ОписаниеОповещения("ОтветНаВопросОтправитьДокументыВСБИС", Saby_КомандыОбменаДляФормыКлиент, ДопПараметры);
		ПоказатьОповещениеПользователя(
			"Удалены документы в SABY",
			, 
			"Среди выбранных для открытия документов есть "+
			Формат(СсылкиНаДокументыВСБИС.ОбработаноСОшибкой.Количество(), "ЧГ=0")+
			" которые были удалены в СБИС. Информация о статусах этих документов была удалена.",
			БиблиотекаКартинок["Ошибка32"],
			СтатусОповещенияПользователя.Важное, Новый УникальныйИдентификатор);
	ИначеЕсли Не ОшибкаВыполнения Тогда
		ОткрытьВСБИС( СсылкиНаДокументыВСБИС.ОбработаноУспешно, ПараметрКоманды.Форма );
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура ОткрытьВСБИС( МассивДокументовКОтправке, Форма ) Экспорт 
	Для Каждого СсылкаНаДокумент Из МассивДокументовКОтправке Цикл
		ПараметрыФормы = Новый Структура( "Заголовок, АдресСтраницы");
		ЗаполнитьЗначенияСвойств(ПараметрыФормы, СсылкаНаДокумент);
		Уникальность = Новый УникальныйИдентификатор;
		Если МассивДокументовКОтправке.Количество() > 0 Тогда
			Уникальность = СокрЛП(Saby_Core.get_prop(МассивДокументовКОтправке[0], "UID", Новый УникальныйИдентификатор));
		КонецЕсли;
		ОткрытьФорму("Обработка.SABY.Форма.Browser", ПараметрыФормы, Форма, Уникальность );
	КонецЦикла;
КонецПроцедуры

