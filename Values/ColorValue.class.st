"
VisualWorks class
"
Class {
	#name : 'ColorValue',
	#superclass : 'Color',
	#category : 'Values-Emitter',
	#package : 'Values',
	#tag : 'Emitter'
}

{ #category : 'accessing - defaults' }
ColorValue class >> black [
	^super black asColorValue
]

{ #category : 'accessing - defaults' }
ColorValue class >> blue [
	^super blue asColorValue
]

{ #category : 'accessing - defaults' }
ColorValue class >> cyan [
	^super cyan asColorValue
]

{ #category : 'instance creation' }
ColorValue class >> fromByte: anInteger [
	^self fromBytes: (ByteArray new: 3 withAll: anInteger)
]

{ #category : 'instance creation' }
ColorValue class >> fromBytes: threeBytes [
	^self fromBytesRed: threeBytes first green: (threeBytes at: 2) blue: threeBytes last
]

{ #category : 'instance creation' }
ColorValue class >> fromBytesRed: redByte green: greenByte blue: blueByte [
	^self red: redByte / 255 green: greenByte / 255 blue: blueByte / 255
]

{ #category : 'instance creation' }
ColorValue class >> fromColor: aColor [
	^self r: aColor red g: aColor green b: aColor blue
]

{ #category : 'accessing - defaults' }
ColorValue class >> green [
	^super green asColorValue
]

{ #category : 'accessing - defaults' }
ColorValue class >> magenta [
	^super magenta asColorValue
]

{ #category : 'accessing - defaults' }
ColorValue class >> namedValueNames [
	"The selection is the common set of color names with identical colors in VW and Squeak/Pharo
	The colors are all variations of min and max of the 3 components"
	"self namesByValues"
	
	^#(#black #white
	#red #green #blue
	#cyan #magenta #yellow)
]

{ #category : 'accessing - defaults' }
ColorValue class >> red [
	^super red asColorValue
]

{ #category : 'instance creation' }
ColorValue class >> red: r green: g blue: b [
	^self r: r g: g b: b
]

{ #category : 'accessing - defaults' }
ColorValue class >> white [
	^super white asColorValue
]

{ #category : 'accessing - defaults' }
ColorValue class >> yellow [
	^super yellow asColorValue
]

{ #category : 'converting' }
ColorValue >> asByteArray [
	^ByteArray
		with: (self red * 255) truncated
		with: (self green * 255) truncated
		with: (self blue * 255) truncated
]

{ #category : 'converting' }
ColorValue >> asColorValue [
	^self
]

{ #category : 'converting' }
ColorValue >> asGrayValue [
	"<Number>
	between 0.0 (Black) and 1.0 (White) suitable for PDF DeviceGray"

	^self brightness
]

{ #category : 'constants' }
ColorValue >> cyan [
	"<Number[0..1]>
	the cyan part of the receiver"

	^1.0 - self red
]

{ #category : 'testing' }
ColorValue >> isEmpty [
	^self scaledRed isNil and: [
	self scaledGreen isNil and: [
	self scaledBlue isNil]]
]

{ #category : 'constants' }
ColorValue >> magenta [
	"<Number[0..1]>
	the magenta part of the receiver"

	^1.0 - self green
]

{ #category : 'printing' }
ColorValue >> printValueWith: printer [
	| args |
	(self class nameOrNilFor: self) ifNotNil: [:symbol |
		^LiteralPrintvalue string: (printer classnameOf: self) , ' ' , symbol asString].
	args := OrderedCollection new.
	args add: (printer constant: 'fromBytesRed' value: (self red * 255) rounded).
	args add: (printer constant: 'green' value: (self green * 255) rounded).
	args add: (printer constant: 'blue' value: (self blue * 255) rounded).
	^printer printvalue: self arguments: args
]

{ #category : 'accessing' }
ColorValue >> rgbIndex [
	"<Integer>
	Three 8 bit RGB numbers interpreted as number for ordering"

	^self asByteArray inject: 0 into: [:num :byte | (num bitShift: 8) + byte]
]

{ #category : 'constants' }
ColorValue >> yellow [
	"<Number[0..1]>
	the yellow part of the receiver"

	^1.0 - self blue
]
