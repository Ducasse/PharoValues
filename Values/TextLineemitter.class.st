"
TextLineEmitter emits text as one line
"
Class {
	#name : 'TextLineemitter',
	#superclass : 'TextEmitter',
	#category : 'Values-Emitter',
	#package : 'Values',
	#tag : 'Emitter'
}

{ #category : 'writing' }
TextLineemitter >> emitSeparator [
	self stream space
]
