xcopy /y/f .\SampleAddInBundle.zip .\tools\cf\CommonTemplates\SampleAddIn\Ext\Template.bin

call vrunner update-dev --src ./tools/cf

call vrunner syntax-check --settings=tools/vanessa/runner.json

call vrunner designer --settings=tools/vanessa/runner.json
