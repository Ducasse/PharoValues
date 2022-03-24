"
TextLineEmitter emits text as one line
"
Class {
	#name : #TextLineemitter,
	#superclass : #TextEmitter,
	#category : #Values
}

{ #category : #writing }
TextLineemitter >> emitSeparator [
	self stream space
]
