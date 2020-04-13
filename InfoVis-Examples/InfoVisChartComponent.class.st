Class {
	#name : #InfoVisChartComponent,
	#superclass : #InfoVisExampleComponent,
	#category : #''
}

{ #category : #'instance creation' }
InfoVisChartComponent class >> isAbstract [

	^ self = InfoVisChartComponent
]

{ #category : #accessing }
InfoVisChartComponent >> category [

	^ 'Charts'
]

{ #category : #JSON }
InfoVisChartComponent >> jsonData [

	| data values entryLabels entryValues |
	values := OrderedCollection new.

	entryLabels := #('1960' '1970' '1980' '1990' '2000' '2010').
	entryValues := #(
		#(20 40 15 5)
		#(30 10 45 10)
		#(38 20 35 17)
		#(58 10 35 32)
		#(55 60 34 38)
		#(26 40 25 40)
	).
	entryLabels with: entryValues do: [ : l : v |
		values add: (Dictionary new
			at: 'label' put: l;
			at: 'values' put: v;
			yourself)
	].

	data := Dictionary new.
	data at: 'label' put: self labels.
	data at: 'values' put: values.
	^ data
]

{ #category : #accessing }
InfoVisChartComponent >> labels [

	^ #( 'Stuff' 'Thingies' 'Entities' 'Items' )
]

{ #category : #rendering }
InfoVisChartComponent >> legendScriptFor: visualization [ 

	| script |
	script := JSStream new.
	script nextPutAll: 'var legend = '.
	visualization getLegend javascriptOn: script.
	script nextPutAll: '; for(var name in legend) $("div[title="+ name +"]").css("background-color", legend[name])'.
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

{ #category : #rendering }
InfoVisChartComponent >> toolTipFunction [

	^ ( JSStream on: 'tip.innerHTML = element.name + ": " + element.value' ) asFunction: #( #tip #element )
]
