FILENAME = "sample_text.txt"



class Controller

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

end

# text_array = "asdlfkkas asdlfkjasdf asdfdjaslkf asdflkdjsalfj asdkfj".split(//)


# p Controller.read_in_text(FILENAME)
# p Controller.save_text(text_array, FILENAME)


