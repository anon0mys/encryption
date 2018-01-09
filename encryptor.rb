class Encryptor
  def cipher
    {'a' => 'n', 'b' => 'o', 'c' => 'p', 'd' => 'q',
    'e' => 'r', 'f' => 's', 'g' => 't', 'h' => 'u',
    'i' => 'v', 'j' => 'w', 'k' => 'x', 'l' => 'y',
    'm' => 'z', 'n' => 'a', 'o' => 'b', 'p' => 'c',
    'q' => 'd', 'r' => 'e', 's' => 'f', 't' => 'g',
    'u' => 'h', 'v' => 'i', 'w' => 'j', 'x' => 'k',
    'y' => 'l', 'z' => 'm'
  }
  end

  def encrypt(message)
    new_message = []
    message = message.split("")
    message.each do |letter|
      new_message << cipher[letter]
    end
    cryp_message = new_message.join
    puts "#{cryp_message}"
    return cryp_message
  end

  def decrypt(message)
    new_message = []
    message = message.split("")
    message.each do |letter|
      new_message << cipher[letter]
    end
    cryp_message = new_message.join
    puts "#{cryp_message}"
    return cryp_message
  end

end

e = Encryptor.new
puts "What is the message you want to encrypt? > "
input = gets.chomp.downcase
input = e.encrypt(input)
e.decrypt(input)
