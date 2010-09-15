Class {
	#name : #InfoVisPieChartComponent,
	#superclass : #InfoVisChartComponent,
	#category : 'InfoVis-Examples'
}

{ #category : #rendering }
InfoVisPieChartComponent >> renderExampleOn: html [ 

	| chart |
	chart := html infoVis pieChart.
	chart
		jsonData: self jsonData;
		animate: true;
		offset: 30;
		sliceOffset: 2;
		labelOffset: 10;
		showLabels: true;
		displayStackedWithGradients.
	self setDefaultOptions: chart.
	html div class: self visualizationCssClass;
		script: chart.
	self renderLegendOn: html.
	html document addLoadScript: (self legendScriptFor: chart).
]

{ #category : #rendering }
InfoVisPieChartComponent >> renderExplanationOn: html [

	html render: 'A pie chart with static JSON data'.
]

{ #category : #accessing }
InfoVisPieChartComponent >> title [

	^  'Pie chart'
]