
// BSLLS:MissingReturnedValueDescription-off
// BSLLS:MissingParameterDescription-off
//DynamicDirective
Функция НазваниеОбъекта(ИмяИни, connection_info)
// BSLLS:MissingParameterDescription-on
// BSLLS:MissingReturnedValueDescription-on

	_data = "data";
	Результат = Неопределено;
	ПараметрыВызова = Новый Структура();
	ПараметрыВызова.Вставить("algorithm", ИмяИни);
	ПараметрыВызова.Вставить("object", Новый Структура("object", Неопределено));
	ПараметрыВызова.Вставить("endpoint", "info"); 
	ПараметрыВызова.Вставить("params", Неопределено); 
	ПараметрыВызова.Вставить("operation_uuid", Строка(Новый УникальныйИдентификатор())); 
	ПараметрыВызова.Вставить("connection_uuid", connection_info["ConnectionId"]); 
	ПараметрыВызова.Вставить("ReadPublicParam", Ложь);
	result	= ПолучитьФормуBlockly().API_BLOCKLY_RUN(ПараметрыВызова);
	Если get_prop(result, "status", Неопределено) = "complete" Тогда 
		data = get_prop(result, _data, Неопределено);
		Результат = get_prop(data, "ext_sys_obj_title");
	КонецЕсли;
	Если Не ЗначениеЗаполнено(Результат) Тогда
		ИмяИниВМассив = СтрРазделитьПодстрокой(ИмяИни, "_", Ложь); 
		Если ИмяИниВМассив.Количество() > 0 Тогда
			Результат = ИмяИниВМассив[0];	
		КонецЕсли;	
	КонецЕсли;
	Возврат Результат;
КонецФункции	

// BSLLS:MissingParameterDescription-off
//DynamicDirective
Процедура ДобавитьПунктВстраиваемогоМеню(ИмяИни, connection_info, ВстраиваемоеМеню, НазваниеОбъекта)
// BSLLS:MissingParameterDescription-on
	_data = "data";
	Если Не ЗначениеЗаполнено(НазваниеОбъекта) Тогда
		Возврат;
	КонецЕсли;	
	ПараметрыВызова = Новый Структура();
	ПараметрыВызова.Вставить("algorithm", ИмяИни);
	ПараметрыВызова.Вставить("object", Новый Структура("object", Неопределено));
	ПараметрыВызова.Вставить("endpoint", "toolbar"); 
	ПараметрыВызова.Вставить("params", Неопределено); 
	ПараметрыВызова.Вставить("operation_uuid", Строка(Новый УникальныйИдентификатор())); 
	ПараметрыВызова.Вставить("connection_uuid", connection_info["ConnectionId"]);
	ПараметрыВызова.Вставить("ReadPublicParam", Ложь);
	result	= ПолучитьФормуBlockly().API_BLOCKLY_RUN(ПараметрыВызова);
	Если get_prop(result, "status", Неопределено) = "complete" Тогда
		data = get_prop(result, _data, Неопределено);
		Если ЗначениеЗаполнено(data) Тогда
			ВстраиваемоеМеню.Вставить(НазваниеОбъекта, data);
			Возврат;
		КонецЕсли;	
	КонецЕсли;
	ПараметрыВызова.Вставить("endpoint", "view"); 
	result	= ПолучитьФормуBlockly().API_BLOCKLY_RUN(ПараметрыВызова);
	Если get_prop(result, "status", Неопределено) = "complete" Тогда
		data = get_prop(result, _data, Неопределено);
		toolbar = get_prop(result, "Toolbar", Неопределено);
		Если ЗначениеЗаполнено(toolbar) Тогда
			ВстраиваемоеМеню.Вставить(НазваниеОбъекта, data);
			Возврат; 
		КонецЕсли;	
	КонецЕсли;	
КонецПроцедуры	

// BSLLS:MissingParameterDescription-off
//DynamicDirective
Процедура ЗагрузкаПредопределенныхОбъектов(ИмяИни, connection_info)
// BSLLS:MissingParameterDescription-on
	data = "data";
	params = "params";
	connection_uuid = "connection_uuid";
	ПараметрыВызова = Новый Структура();
	ПараметрыВызова.Вставить("algorithm", ИмяИни);
	ПараметрыВызова.Вставить("object", Новый Структура("object", Неопределено));
	ПараметрыВызова.Вставить("endpoint", Неопределено);
	ПараметрыВызова.Вставить(params, Неопределено);
	ПараметрыВызова.Вставить("operation_uuid", Строка(Новый УникальныйИдентификатор()));
	ПараметрыВызова.Вставить(connection_uuid, connection_info["ConnectionId"]);
	result	= ПолучитьФормуBlockly().API_BLOCKLY_RUN(ПараметрыВызова);
	Если result["status"] = "complete" Тогда
		Если ТипЗнч(result[data]) = Тип("Массив") Тогда 
			Для каждого _data из result[data] Цикл
				ТранспортИнтеграции.local_helper_extsyncdoc_write_predefined(
					context[params],
					context["operation"][connection_uuid],
					_data["Type"],
					_data["ClientType"],
					_data["Objects"]);	
			КонецЦикла;	
		Иначе	
			ТранспортИнтеграции.local_helper_extsyncdoc_write_predefined(
				context[params],
				context["operation"][connection_uuid],
				result[data]["Type"],
				result[data]["ClientType"],
				result[data]["Objects"]);  
		КонецЕсли;  
	Иначе
		Если result["status"] = "error" Тогда
			ВызватьИсключение NewExtExceptionСтрока(, "Не удалось загрузить предопределенные данные - " + ИмяИни,
				"command_processpredefineobject");	
		КонецЕсли;	
	КонецЕсли;	
КонецПроцедуры
			
// BSLLS:MissingReturnedValueDescription-off
// BSLLS:MissingParameterDescription-off
//DynamicDirective
Функция ПриСозданииНовогоПодключения(connection_info) Экспорт
// BSLLS:MissingParameterDescription-on
// BSLLS:MissingReturnedValueDescription-on
	
	СчетОбъектов = 1;
	ПроцентПрогресса = 0;
	
	ВсегоОбъектов = connection_info["ExtSysSettings"].Количество();
	ВстраиваемоеМеню = Новый Соответствие;
	Сто = 100;
	Для каждого Элем из connection_info["ExtSysSettings"] Цикл
		ПроцентПрогресса = Окр(СчетОбъектов / ВсегоОбъектов * Сто, 0);
		ИмяОбъектаСинхронизации = Элем.Ключ;
		ИмяОбъектаСинхронизации = get_prop(Элем.Значение, "data", Элем.Ключ);
		ИмяОбъектаСинхронизации = get_prop(ИмяОбъектаСинхронизации, "КрасивоеНазвание", Элем.Ключ);
		ИмяОбъектаСинхронизации = get_prop(ИмяОбъектаСинхронизации, "Значение", Элем.Ключ);
		СообщитьПрогрессОперации(,"Синхронизация "+ИмяОбъектаСинхронизации,Новый Структура("Прогресс", ПроцентПрогресса));
		СчетОбъектов = СчетОбъектов + 1;
		
		ИмяИни = СтрЗаменить(Элем.Ключ, "Blockly_", "");
		если Найти(ИмяИни, "predefine") > 0 Тогда
			Попытка
				ЗагрузкаПредопределенныхОбъектов(ИмяИни, connection_info);
			Исключение
				ИнфОбОшибке = ИнформацияОбОшибке();
				ДанныеПрогресса = Новый Структура("Прогресс, status", ПроцентПрогресса, "error");
				СообщитьПрогрессОперации(, "Синхронизация завершена с ошибкой", ДанныеПрогресса);
				ВызватьИсключение(NewExtExceptionСтрока(ИнфОбОшибке, "Объект не содержит необходимый параметр"));
			КонецПопытки;
		Конецесли;	
	КонецЦикла;

	если ВстраиваемоеМеню.Количество() > 0 Тогда 
		context_param = НастройкиПодключенияПрочитать();
		context_param.Вставить("ВстраиваемоеМеню", ВстраиваемоеМеню);
		НастройкиПодключенияЗаписать(context_param);
	Конецесли;
	
	ПроцентПрогресса = 100;
	ДанныеПрогресса = Новый Структура("Прогресс, status", ПроцентПрогресса, "complete");
	СообщитьПрогрессОперации(, "Синхронизация завершена", ДанныеПрогресса);
	
	Возврат Истина;
КонецФункции
