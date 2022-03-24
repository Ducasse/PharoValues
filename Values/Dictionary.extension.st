Extension { #name : #Dictionary }

{ #category : #'*Values-dictionary testing' }
Dictionary >> isEqualValue: anObject [
	^self contentsEquals: anObject
]

{ #category : #'*Values-printing' }
Dictionary >> keysForPrinting [
	^[self keys asSortedCollection] on: Error do: [:ex | ex return: self keys]
]

{ #category : #'*Values-printing' }
Dictionary >> printValueWith: printer [
	^DictionaryPrintvalue arguments: (self printargumentsWith: printer)
]

{ #category : #'*Values-printing' }
Dictionary >> printargumentsWith: printer [
	| args |
	args := OrderedCollection new.
	self keysForPrinting do: [:key |
		args add: (DictionaryPrintargument
			name: (key printValueWith: printer)
			value: ((self at: key) printValueWith: printer))].
	^args
]
