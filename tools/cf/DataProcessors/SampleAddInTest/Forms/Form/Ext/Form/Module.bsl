
&AtServer
Procedure LoadSampleAddinAtServer()
	
	
	LoadStatus = ПодключитьВнешнююКомпоненту(
		"ОбщийМакет.SampleAddIn", "SampleAddIn", ТипВнешнейКомпоненты.Native
	);
	
EndProcedure

&AtClient
Procedure LoadSampleAddin(Command)
	LoadSampleAddinAtServer();
EndProcedure

&AtServer
Procedure AddAtServer()
	LoadStatus = ПодключитьВнешнююКомпоненту(
		"ОбщийМакет.SampleAddIn", "SampleAddIn", ТипВнешнейКомпоненты.Native
	);
	
	Adiner = New ("AddIn.SampleAddIn.Sample");
	Result = Adiner.Add(Left, Rigth);
	
	f = 1;
	
EndProcedure

&AtClient
Procedure Add(Command)
	AddAtServer();
EndProcedure

&AtServer
Procedure MinusAtServer()
	LoadStatus = ПодключитьВнешнююКомпоненту(
		"ОбщийМакет.SampleAddIn", "SampleAddIn", ТипВнешнейКомпоненты.Native
	);
	
	Adiner = New ("AddIn.SampleAddIn.Sample");
	Result = Adiner.Delete(Left, Rigth);
	
EndProcedure

&AtClient
Procedure Minus(Command)
	MinusAtServer();
EndProcedure
