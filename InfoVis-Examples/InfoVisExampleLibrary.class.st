Class {
	#name : #InfoVisExampleLibrary,
	#superclass : #WAFileLibrary,
	#category : 'InfoVis-Examples'
}

{ #category : #accessing }
InfoVisExampleLibrary >> layoutCss [

	^ '
div.content {
	clear: both;
	width: 900px;
	margin: 15px;
}

div.navigation {
	position: relative;
	float: left;
	width: 200px; 
	padding: 5px;
	background-color: #FFFFFF;
}

div.example {
	position: relative;
	float: left;
	width: 600px; 
	padding: 5px;
	margin-left: 15px;
}

div.InfoVis {
	background-color: black;
	width: 100%;
	height: 400px;
}
div.code {
	background-color: #EEEEEE;
	padding: 5px;
}

div.hidden {
	display: none;
}

'
]

{ #category : #accessing }
InfoVisExampleLibrary >> mainCss [

	^ '

body {
	font-family: Tahoma, Helvetica, sans-serif;
	color: #444444;
}

em {
	font-weight: bold;
}

a {
	display: inline-block;
	color: #1BA6DF;
	text-decoration: none;
	border-bottom-style: dotted;
	border-bottom-width: 1px;
	border-bottom-color: #888888;
}

a:hover {
	border-bottom-style: solid;
	border-bottom-width: 1px;
	border-bottom-color: #1BA6DF;
}

'
]

{ #category : #accessing }
InfoVisExampleLibrary >> navigationCss [

	^ '
a.navigation {
	color: black;
	text-decoration: none;
	display: block;
}

a.selection {
	color: #1BA6DF;
	font-weight: bold;
	text-decoration: none;
	display: block;
}

ul.navigation {
	list-style-type: none;
	padding: 0px;
}

li.navigation {
	padding-left: 10px;
	margin: 5px;
	height: 1.5em;
}

'
]

{ #category : #accessing }
InfoVisExampleLibrary >> selectorsToInclude [

	^ #( #layoutCss #mainCss #navigationCss #visCss )
]

{ #category : #accessing }
InfoVisExampleLibrary >> visCss [

	^ '

div.tip {
	display: block;
	background-color: white;
	opacity: 0.7;
	padding: 5px;
	border-style: solid;
	border-width: 1px;
	border-color: black;
	-moz-box-shadow:2px 2px 8px #555555;
}

div.legend-color {
	border: 1px solid #AAAAAA;
	margin: 3px 3px 0 0;
	padding: 0 0 3px 0;
	display: inline-block;
	width: 1em;
	height: 1em;
}

li.legend {
	padding: 3px;
	vertical-align: middle;
}

ul.legend {
	border: 1px solid #555555;
	list-style-type: none;
	padding: 5px;
	margin: 0px;
	width: 10em;
}
'
]
