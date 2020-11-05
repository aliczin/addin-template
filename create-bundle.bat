

mkdir local-dist
call xcopy /y/f .\build-x86\SampleAddIn.dll .\local-dist\SampleAddIn-32.dll
call xcopy /y/f .\build-x64\SampleAddIn.dll .\local-dist\SampleAddIn-64.dll

cd local-dist 
call 7z.exe u "..\SampleAddInBundle.zip" SampleAddIn-32.dll
call 7z.exe u "..\SampleAddInBundle.zip" SampleAddIn-64.dll
cd ..
call 7z.exe u "SampleAddInBundle.zip" MANIFEST-WINONLY.XML
call 7z.exe rn "SampleAddInBundle.zip" MANIFEST-WINONLY.XML MANIFEST.XML
