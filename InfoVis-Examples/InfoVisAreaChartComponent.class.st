Class {
	#name : #InfoVisAreaChartComponent,
	#superclass : #InfoVisChartComponent,
	#category : 'InfoVis-Examples'
}

{ #category : #accessing }
InfoVisAreaChartComponent >> jsonData [

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
	data at: 'label' put: #('Stuff' 'Thingies' 'Entities' 'Items').
	data at: 'values' put: values.
	^ data
]

{ #category : #rendering }
InfoVisAreaChartComponent >> renderExampleOn: html [ 

	| chart |
	chart := html infoVis areaChart.
	chart
		jsonData: self jsonData;
		animate: true;
		labelOffset: 10;
		showAggregates: true;
		showLabels: true;
		displayStackedWithGradients;
		filterOnClick: true;
		restoreOnRightClick: true.
	self setDefaultOptions: chart.
	html div 
		class: 'InfoVis';
		script: chart.
	self renderLegendFor: chart on: html.
]

{ #category : #rendering }
InfoVisAreaChartComponent >> renderExplanationOn: html [

	html render: 'An area chart with tooltips feeded by static JSON data. Click on an area to filter, right click to show all areas again'.
]

{ #category : #rendering }
InfoVisAreaChartComponent >> renderLegendFor: visualization on: html [

	html paragraph: [ 
		html  unorderedList
			id: 'legend';
			class: 'legend';
			script: (self legendScriptFor: visualization)
	].
]

{ #category : #accessing }
InfoVisAreaChartComponent >> title [

	^  'Area chart'
]
