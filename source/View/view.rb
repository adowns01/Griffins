require 'debugger'

class View
  def self.get_menu_input(input_options)
    x = gets.chomp
    x = x.to_i
    p "Invalid input. Please enter #{input_options}" if !input_options.include? x
    x
  end

  def self.get_file_input
    input = gets.chomp
    if File.file?(input)
      return true
    else
      return false
    end
  end

  def self.welcome_menu
    puts "The Griffin Encrypter/Decrypter"
    puts "--------------------------------"
    puts "What would you like to do?"
    puts "1. Encrypt a message"
    puts "2. Decrypt a message"
    puts "3. View Message"
    puts "4. Exit"
    [1,2,3,4]
  end

  def self.encrypt_menu
    puts "Encryption Mode"
    puts "----------------"
    print "Please enter file name to encrypt: "
  end

  def self.decrypt_menu
    puts "Decryption Mode"
    puts "----------------"
    print "Please enter file name to decrypt: "
  end

  def self.message_viewer_menu
    puts "Message View Mode"
    puts "----------------"
    print "Please enter message file to view: "
  end
  def self.get_shift_input
    print "Shift amount: "
    input = gets.chomp
    input.to_i
  end

  def self.clear_screen
    puts "\e[H\e[2J"
  end

  # def decrypt_process
  #   while(inner_flag == false)
  #           decrypt_menu
  #           x = get_file_input
  #           if(x == true)
  #             puts "Solving"
  #             puts "saving....."
  #             #SHIFT HERE
  #             inner_flag = true
  #           else
  #             puts "Invalid file please try again."
  #           end
  #         end
  # end

  def self.decrypt_load
    puts "Decrypting.."
    sleep(1)
    clear_screen
  end

  def self.test_message
    puts "this is a test"
  end

def self.big_menu
  flag = false
  while(flag == false)
    clear_screen
    top_menu = welcome_menu
    user_first_choice = get_menu_input(top_menu)
    clear_screen
    inner_flag = false
    case user_first_choice
      #1 = Shift
      when 1
        while(inner_flag == false)
          encrypt_menu
          user_file = get_file_input
          if(user_file == true)
            shift = get_shift_input
            puts "Shifting by #{shift}"
            puts "Saving....."
            sleep(2)
            #SHIFT HERE
            inner_flag = true
          else
            puts "Invalid file please try again."
            sleep(1)
            clear_screen
          end
        end
      #2 = DECRYPT
      when 2
       while(inner_flag == false)
          decrypt_menu
          user_file = get_file_input
          if(user_file == true)
            decrypt_load
            #SHIFT HERE
            inner_flag = true
          else
            puts "Invalid file please try again."
            sleep(1)
            clear_screen
          end
        end
      when 3
        while(inner_flag == false)
          message_viewer_menu
          user_file = get_file_input
          if(user_file == true)
            exit_flag = false
            while(exit_flag == false)
            clear_screen
            test_message
            puts ""
            puts "Type exit for main menu."
            exit = gets.chomp
            if exit.downcase == 'exit'
              exit_flag = true
            end
            end
            sleep(3)
            inner_flag = true
          else
            puts "Invalid file please try again."
            sleep(1)
            clear_screen
          end
        end
      when 4
        top_flag = true
        flag = true
    end
  end
end

end
View.big_menu
# encrypt_menu
# controller
