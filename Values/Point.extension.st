Extension { #name : #Point }

{ #category : #'*Values-printing' }
Point >> printValueWith: printer [
	| string |
	string := (self x asSourceFor: printer target) , ' @ ' , (self y asSourceFor: printer target).
	^LiteralPrintvalue string: string
]
