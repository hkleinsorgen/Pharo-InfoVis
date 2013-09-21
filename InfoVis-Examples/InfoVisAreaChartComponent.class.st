Class {
	#name : #InfoVisAreaChartComponent,
	#superclass : #InfoVisChartComponent,
	#category : #'InfoVis-Examples'
}

{ #category : #rendering }
InfoVisAreaChartComponent >> createVisualizationFor: html [ 

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
	^ chart
]

{ #category : #rendering }
InfoVisAreaChartComponent >> renderExplanationOn: html [

	html render: 'An area chart with tooltips feeded by static JSON data. Click on an area to filter, right click to show all areas again'.
]

{ #category : #rendering }
InfoVisAreaChartComponent >> renderVisualization: chart on: html [ 

	html div class: self visualizationCssClass;
		script: chart.
	self renderLegendOn: html.
	html document addLoadScript: (self legendScriptFor: chart).
]

{ #category : #accessing }
InfoVisAreaChartComponent >> title [

	^  'Area chart'
]
