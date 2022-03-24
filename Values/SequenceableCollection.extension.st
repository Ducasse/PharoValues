Extension { #name : #SequenceableCollection }

{ #category : #'*Values-printing' }
SequenceableCollection >> printValueWith: printer [
	self isLiteral ifTrue: [
		^LiteralPrintvalue string: self storeString].
	^ArrayPrintvalue arguments: (self collect: [:item | item printValueWith: printer])
]
