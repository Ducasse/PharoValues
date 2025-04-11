"
SourceEmitter outputs source code.
"
Class {
	#name : 'SourceEmitter',
	#superclass : 'Emitter',
	#category : 'Values',
	#package : 'Values'
}

{ #category : 'accessing' }
SourceEmitter >> emitterClassFor: printvalue [
	^printvalue isLine
		ifTrue: [Lineemitter]
		ifFalse: [Blockemitter]
]

{ #category : 'accessing' }
SourceEmitter >> streamClass [
	^WriteStream
]
