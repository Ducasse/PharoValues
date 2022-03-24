Extension { #name : #Color }

{ #category : #'*Values-converting' }
Color >> asColorValue [
	^ColorValue fromColor: self
]
