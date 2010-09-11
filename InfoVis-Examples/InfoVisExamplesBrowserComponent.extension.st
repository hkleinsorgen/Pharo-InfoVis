Extension { #name : #InfoVisExamplesBrowserComponent }

{ #category : '*InfoVis-Examples' }
InfoVisExamplesBrowserComponent classSide >> initialize [

	| app |
	app := WAAdmin register: self asApplicationAt: 'examples/InfoVis'.
	app addLibrary: InfoVisDevelopmentLibrary.
	app addLibrary: InfoVisExampleLibrary.
	app addLibrary: JQDeploymentLibrary.
	app preferenceAt: #scriptGeneratorClass put: JQScriptGenerator.
	^ app
]
