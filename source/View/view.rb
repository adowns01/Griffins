require 'debugger'




def get_menu_input(input_options)
  x = gets.chomp
  x = x.to_i
  p "Invalid input. Please enter #{input_options}" if !input_options.include? x
  x
end

def get_file_input
  input = gets.chomp
  if File.file?(input)
    return true
  else
    return false
  end
end


def big_menu
  welcome_menu


end



def welcome_menu
  puts "The Griffin Encrypter/Decrypter"
  puts "--------------------------------"
  puts "What would you like to do?"
  puts "1. Encrypt a message"
  puts "2. Decrypt a message"
  puts "3. View Message"
  puts "4. Exit"
  [1,2,3,4]
end

def encrypt_menu
  puts "Encryption Mode"
  puts "----------------"
  print "Please enter file name to encrypt: "
end

def decrypt_menu
  puts "Decryption Mode"
  puts "----------------"
  print "Please enter file name to decrypt: "
end

def get_shift_input
  print "Shift amount: "
  input = gets.chomp
  input.to_i
end

def big_menu

  flag = false
  while(flag == false)
    top_menu = welcome_menu
    x = get_menu_input(top_menu)
    inner_flag = false
    case x
      #1 = Shift
      when 1
        while(inner_flag == false)
          encrypt_menu
          x = get_file_input
          if(x == true)
            shift = get_shift_input
            puts "Shifting by #{shift}"
            puts "saving....."
            #SHIFT HERE
            inner_flag = true
          else
            puts "Invalid file please try again."
          end
        end
      #2 = DECRYPT
      when 2
        while(inner_flag == false)
          decrypt_menu
          x = get_file_input
          if(x == true)
            puts "Solving"
            puts "saving....."
            #SHIFT HERE
            inner_flag = true
          else
            puts "Invalid file please try again."
          end
        end
      when 3
        #VIEW MESSAGE
      when 4
        top_flag = true
        flag = true
    end
  end
end

big_menu
# encrypt_menu
# controller
