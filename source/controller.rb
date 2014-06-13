require_relative 'find_cipher_shift'
require_relative 'shift_danny_josh'

FILENAME = "sample_text.txt"



class Controller


  def self.encrypt(filename, shift = rand(1..25))
    text_array = Controller.read_in_text(filename)
    coded_text_array = shift(text_array, shift)
    Controller.save_text(coded_text_array, filename)
  end

  def self.decrypt(filename)
    coded_text_array = Controller.read_in_text(filename)
    shift = find_shift(coded_text_array)
    text_array = shift(coded_text_array, shift)
    Controller.save_text(text_array, filename)
  end

  def self.find_shift(coded_text_array)
    my_solver = Solver.new(coded_text_array)
    return my_solver.determine_shift_to_e
  end

  def self.read_in_text(filename)
    text_array = []
    f = File.open(filename, "r")
    f.each_line do |line|
      text_array += line.split("")
    end
    f.close
    return text_array
  end

  def self.save_text(text_array, filename)
    File.open(filename, "w") do |file|
      file.puts text_array.join("")
    end
  end

  def self.display_message(filename)
    f = File.open(filename, "r")
    f.each_line do |line|
      puts line
    end
    f.close
  end
end





# Controller.display_title
# Controller.encrypt('sample_text.txt')
# Controller.decrypt('sample_text.txt')
# Controller.display_message('sample_text.txt')