class Encryptor
  def cipher(rotation)
    characters = (' '..'z').to_a
    rotated_characters = characters.rotate(rotation)
    Hash[characters.zip(rotated_characters)]
  end

  def encrypt(message, rotation)
    cipher_for_rotation = cipher(rotation)
    message = message.split("")
    cryp_message = []
    message.each do |letter|
      cryp_message << cipher_for_rotation[letter]
    end
    cryp_message = cryp_message.join
    puts "#{cryp_message}"
    return cryp_message
  end

  def decrypt(message, rotation)
    cipher_for_rotation = cipher(-rotation)
    message = message.split("")
    cryp_message = []
    message.each do |letter|
      cryp_message << cipher_for_rotation[letter]
    end
    cryp_message = cryp_message.join
    puts "#{cryp_message}"
    return cryp_message
  end

end

e = Encryptor.new
print "How much rotation do you want for your cipher? > "
rotation = gets.chomp.to_i
puts "What is the message you want to encrypt? > "
input = gets.chomp.downcase
input = e.encrypt(input, rotation)
e.decrypt(input, rotation)
