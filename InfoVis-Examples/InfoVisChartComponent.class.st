Class {
	#name : #InfoVisChartComponent,
	#superclass : #InfoVisExampleComponent,
	#category : 'InfoVis-Examples'
}

{ #category : #'instance creation' }
InfoVisChartComponent class >> isAbstract [

	^ self = InfoVisChartComponent
]

{ #category : #accessing }
InfoVisChartComponent >> labels [

	self subclassResponsibility
]

{ #category : #rendering }
InfoVisChartComponent >> legendScriptFor: visualization [

	| script |
	script := JSStream new.
	script nextPutAll: '
		var legend = '; nextPutAll: visualization variableName; nextPutAll: '.getLegend();
		for(var name in legend) 
			$("div[title="+ name +"]").css("background-color", legend[name])'.
	^ script
]

{ #category : #rendering }
InfoVisChartComponent >> renderLegendOn: html [ 

	html paragraph: 
		[	html unorderedList id: 'legend';
				class: 'legend';
				with: 
					[	self labels do: 
							[: label |
								html listItem class: 'legend';
									with: 
										[	html div class: 'legend-color';
												title: label.
											html div class: 'legend-label';
												with: label
										]
							]
					]
		].
]

{ #category : #options }
InfoVisChartComponent >> toolTipFunction [

	^ ( JSStream on: 'tip.innerHTML = element.name + ": " + element.value' ) asFunction: #( #tip #element )
]
