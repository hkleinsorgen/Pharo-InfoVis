"
Provides animation options like duration of the animations, frames per second and animation transitions
"
Class {
	#name : #InfoVisFxOptions,
	#superclass : #InfoVisOptions,
	#category : 'InfoVis-Core'
}

{ #category : #accessing }
InfoVisFxOptions class >> infoVisName [

	^ 'Fx'
]

{ #category : #options }
InfoVisFxOptions >> clearCanvas: aBoolean [
	"Default: true.  Whether to clear the frame/canvas when the viz is plotted or animated."

	self optionAt: 'clearCanvas' put: aBoolean
]

{ #category : #options }
InfoVisFxOptions >> duration: aNumber [
	"Default: 2500.  Duration of the animation in milliseconds."

	self optionAt: 'duration' put: aNumber
]

{ #category : #options }
InfoVisFxOptions >> fps: aNumber [
	"Default: 40.  Frames per second."

	self optionAt: 'fps' put: aNumber
]

{ #category : #options }
InfoVisFxOptions >> transition: aObject [
	"Default: $jit.Trans.Quart.easeInOut.  The transition used for the animations.  See below for a more detailed explanation."

	self optionAt: 'transition' put: aObject
]
