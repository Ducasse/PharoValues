Extension { #name : 'Valuemap' }

{ #category : '*Values-Tests-test instances' }
Valuemap class >> example [
	<sampleInstance>
	"self example"

	| valauemap |
	valauemap := Valuemap new.
	valauemap at: #isinTitle put: 'ISIN'.
	valauemap at: #isinValue put: 'DE0009999991'.
	valauemap at: #börsenwertTitle put: 'Börsenwert'.
	valauemap at: #börsenwertValue put: '99,9 Mrd. €'.
	valauemap at: #hochTiefTitle put: 'Hoch/Tief'.
	valauemap at: #hochTiefValue put: '10,00/20,00'.
	valauemap at: #kgvTitle put: 'KGV'.
	valauemap at: #kgvValue put: '9,87'.
	^valauemap
]
