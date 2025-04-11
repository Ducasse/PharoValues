"
Emits source as one line
"
Class {
	#name : 'Lineemitter',
	#superclass : 'SourceEmitter',
	#category : 'Values-Emitter',
	#package : 'Values',
	#tag : 'Emitter'
}

{ #category : 'writing' }
Lineemitter >> emitSeparator [
	self stream space
]
