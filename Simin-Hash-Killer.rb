require 'digest'


puts ''' 

    ███████╗██╗███╗   ███╗██╗███╗   ██╗    ██╗  ██╗ █████╗ ███████╗██╗  ██╗    ██╗  ██╗██╗██╗     ██╗     
    ██╔════╝██║████╗ ████║██║████╗  ██║    ██║  ██║██╔══██╗██╔════╝██║  ██║    ██║ ██╔╝██║██║     ██║     
    ███████╗██║██╔████╔██║██║██╔██╗ ██║    ███████║███████║███████╗███████║    █████╔╝ ██║██║     ██║     
    ╚════██║██║██║╚██╔╝██║██║██║╚██╗██║    ██╔══██║██╔══██║╚════██║██╔══██║    ██╔═██╗ ██║██║     ██║     
    ███████║██║██║ ╚═╝ ██║██║██║ ╚████║    ██║  ██║██║  ██║███████║██║  ██║    ██║  ██╗██║███████╗███████╗
    ╚══════╝╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝    ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝    ╚═╝  ╚═╝╚═╝╚══════╝╚══════╝

    ==============================
    Симин Хаш Кил
    Версия: 1.1.1
    Разработчик: Мохамад Бабаеи
    ==============================

    '''

puts <<~MENU
  Please Define What Do You Want ?

  [1] > Create A Hash [ MD5 | SHA-256 ]
  [2] > Crack / Decode A Hash 
MENU

user_choose = gets.chomp

if user_choose == "1"
  puts "Please Enter The String For Converting To The H@SH : "
  user_input_secure = gets.chomp

  puts "-------------------"
  puts "Please Select The Type Of The Hash You Want : [ MD5 - SHA256 ] "
  user_hash_type_selection = gets.chomp

  if user_hash_type_selection.downcase == "md5"
    md5 = Digest::MD5.hexdigest(user_input_secure)
    puts "-------------------"
    puts "Your Hash Is Ready In MD5 Format : #{md5}"
  elsif user_hash_type_selection.downcase == "sha256"
    sha256 = Digest::SHA256.hexdigest(user_input_secure)
    puts "-------------------"
    puts "Your Hash Is Ready In SHA256 Format : #{sha256}"
  end

elsif user_choose == "2"
  puts "Please Enter The Hash For Cracking / Kill : "
  user_input_hash = gets.chomp
  def crack_md5(target_hash, wordlist)
    wordlist.each do |word|
      return word.strip if Digest::MD5.hexdigest(word.strip) == target_hash
    end
    nil
  end
  puts "-------------------"
  wordlist = File.readlines("wordlist.txt")
  original = crack_md5("#{user_input_hash}", wordlist)
  puts original ? "Found: #{original}" : "Not found"
end
