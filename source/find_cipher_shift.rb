# count how many times letter occurs in array

text = "She saw a secret little clearing, and a secret little hot made of rustic poles. And she had never been here before! She realized it was the quiet place where the growing pheasants were reared; the keeper in his shirt sleeves was kneeling, hammering. The dog trotted forward with a short, sharp bark, and the keeper lifted his face suddenly and saw her. He had a startled look in his eyes.

He straightened himself and saluted, watching her in silence, as she came forward with weakening limbs. He resented the intrusion; he cherished his solitude as his only and last freedom in life."


text_array = text.split("")
###############WHAT WE READ IN
class Solver
  attr_accessor :text_array

  def initialize(text_array)
    @text_array = downcase_text(text_array)
    find_char_frequency
    find_most_freq_letter
  end

  def determine_shift_to_e
    e_ascii = "e".ord
    letter_ascii = @most_feq_letter.ord

    shift = e_ascii - letter_ascii
    return shift
  end

  def find_most_freq_letter
    @most_feq_letter = @character_frequency.max_by{|letter, freq| freq}.first
  end

  def downcase_text(text_array)
    text_array.map{|char| char.downcase}
  end

  def find_char_frequency
    letters = ('a'..'z').to_a
    @character_frequency = Hash.new(0)

    text_array.each do |char|
      @character_frequency[char] += 1 if letters.include?(char)
    end
  end

end

Solver.new(text_array)
