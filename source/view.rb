require 'debugger'
require 'colorize'
require_relative 'controller'

class View
  def self.get_menu_input(input_options)
    x = gets.chomp
    x = x.to_i
    p "Invalid input. Please enter #{input_options}" if !input_options.include? x
    if x ==4
      return 'exit'
    else
      return x
    end
  end

    def self.get_file_input
      input = gets.chomp
      if File.file?(input)
        return [true, input]
      else
        return [false]
      end
    end

    def self.display_title
      clear_screen
      puts "  _______ .______       __   _______  _______  __  .__   __.      _______.".yellow
      puts " /  _____||   _  \\     |  | |   ____||   ____||  | |  \\ |  |     /       |".yellow
      puts "|  |  __  |  |_)  |    |  | |  |__   |  |__   |  | |   \\|  |    |   (----`".yellow
      puts "|  | |_ | |      /     |  | |   __|  |   __|  |  | |  . `  |     \\   \\   ".yellow
      puts "|  |__| | |  |\\  \\----.|  | |  |     |  |     |  | |  |\\   | .----)   |   ".yellow
      puts " \\______| | _| `._____||__| |__|     |__|     |__| |__| \\__| |_______/ ".yellow
      puts ""
      puts "        Jedi Amelia, Jedi Danny, Jedi Bridgette, and Padawan Josh         ".red
      sleep(5)
    end

def self.welcome_menu
  puts "The Griffin Encrypter/Decrypter".yellow
  puts "--------------------------------".white
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


def self.encrypt_sub_menu
  inner_flag = false
  while(inner_flag == false)
    encrypt_menu
    user_file = get_file_input
    if(user_file[0] == true)
      shift = get_shift_input
      puts "Shifting by #{shift}"
      puts "Saving....."
      sleep(2)
      Controller.encrypt(user_file[1], shift)
      inner_flag = true
    else
      puts "Invalid file please try again."
      sleep(1)
      clear_screen
    end
  end
end

def self.decrypt_sub_menu
  inner_flag = false
  while(inner_flag == false)
    decrypt_menu
    user_file = get_file_input
    if(user_file[0] == true)
      decrypt_load
      Controller.decrypt(user_file[1])
      inner_flag = true
    else
      puts "Invalid file please try again."
      sleep(1)
      clear_screen
    end
  end
end

def self.view_message_sub_menu
  inner_flag = false
  while(inner_flag == false)
    message_viewer_menu
    user_file = get_file_input
    if(user_file[0] == true)
      exit_flag = false
      while(exit_flag == false)
        clear_screen
        #PRINT MESSAGE TO SCREEN
        Controller.display_message(user_file[1])
        puts ""
        puts "Type exit for main menu."
        exit = gets.chomp
        if exit.downcase == 'exit'
          exit_flag = true
        # sleep(2)
          inner_flag = true
        else

          puts "Invalid file please try again."
          sleep(1)
          clear_screen
        end
      end
    end
  end
end


def self.decrypt_load
  puts "Decrypting..."
  sleep(1)
  clear_screen
end

def self.test_message
  puts "this is a test"
end

def self.main_menu
  flag = false
  while(flag == false)
    clear_screen
    top_menu = welcome_menu
    main_menu_choice = get_menu_input(top_menu)
    debugger
    clear_screen
    inner_flag = false
    case main_menu_choice
         #1 = encrypt
       when 1
        encrypt_sub_menu
        #2 = DECRYPT
      when 2
        decrypt_sub_menu
      when 3
       view_message_sub_menu
     when 'exit'
       top_flag = true
       flag = true
     end
   end
 end







end


View.display_title
View.main_menu
