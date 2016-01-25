This is Launch School exercise.



note pig_latin.rb comments:

			vowel: [a, e, i, o, u]
			consonant: except x, y

				v identify first alpha is vowel

				first is x 
					second is vowel
						xv
					second is consonant
						xc 		

				first is consonant 
					second is vowel
						cv
					second is consonant
						cc
						tri is consonant
							ccc		

				c identify first alpha is consonant					 



WARNING: disgraphs and trigraphs has the same disgraphs:  sc sh sp st th
Need to avoid counter while deal with rules


The class method self.dealing_one_word means judge the current word is vowel.
Then we "deal" the second word again and again until the string is empty.
It's a nested if...else.
One layer judge vowel, go to the next layer, then judge vowel ... just loop through the string.
          
