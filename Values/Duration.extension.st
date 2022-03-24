Extension { #name : #Duration }

{ #category : #'*Values-instance creation' }
Duration class >> nanoseconds: aNumber [
	^aNumber nanoseconds
]

{ #category : #'*Values-printing' }
Duration >> printValueWith: printer [
	| wst |
	wst := WriteStream on: (String new: 25).
	wst
		nextPut: $(;
		nextPutAll: (printer classnameOf: self);
		nextPutAll: ' nanoseconds: ';
		nextPutAll: self asNanoseconds printString;
		nextPut: $).
	^LiteralPrintvalue string: wst contents
]
