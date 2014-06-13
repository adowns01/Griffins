# capital letters 65..90
# lower case letters 97..122
require 'debugger'
require 'pp'
#takes in array of characters, shifts by provided value
#output: array of characters (now shifted)
def shift(arr, shift)
  arr.map! do |character|
    #convert character to ascii number
    char_to_int = character.ord
    case char_to_int
      #if lower case letter shift with base 97 (see ascii)
      when 97..122
        ((((char_to_int-97)+shift)%26)+97).chr
      #if lower case letter shift with base 65 (see ascii)
      when 65..90
        ((((char_to_int-65)+shift)%26)+65).chr
      #if not a letter character just return as original
      else
        char_to_int.chr
      end
  end
  #return the newly shifted array
  arr
end


# sample_string = "aaa aaa aaa aa! aaa! AA Z?"
# sample_string = sample_string.split("")
# pp "original string:"
# p sample_string

# pp "shifted string:"
# p shift(sample_string, 26)
