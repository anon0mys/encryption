class Encryptor

  def initialize
    puts "Please choose what you would like to do > "
    puts "1. Encrypt a file, 2. Decrypt a file, 3. Encrypt a message, 4. Decrypt a message, 5. Crack a code"
    choice = gets.chomp.to_i

    case choice
    when 1
      print "What is the file you want to encrypt? (Include file extension) > "
      encrypt_this = gets.chomp
      print "How much rotation do you want to use for your cipher? > "
      rotation = gets.chomp.to_i
      encrypt_file(encrypt_this, rotation)
    when 2
      print "What is the file you want to decrypt? (Include file extension) > "
      decrypt_this = gets.chomp
      print "How much rotation was used to encrypt the file? > "
      rotation = gets.chomp.to_i
      decrypt_file(decrypt_this, rotation)
    when 3
      puts "What is the message you want to encrypt? > "
      encrypt_this = gets.chomp
      print "How much rotation do you want to use for your cipher? > "
      rotation = gets.chomp.to_i
      puts "Your encyrpted message is:"
      puts "#{message_encrypt(encrypt_this, rotation)}"
    when 4
      puts "What is the message you want to decrypt? > "
      decrypt_this = gets.chomp
      print "How much rotation was used to encrypt the message? > "
      rotation = gets.chomp.to_i
      puts "Your decyrpted message is:"
      puts "#{message_decrypt(decrypt_this, rotation)}"
    when 5
      puts "What is the code you want to crack? > "
      decrypt_this = gets.chomp
      crack(decrypt_this)
    else
      puts "Please make a valid selection"
      initialize
    end

    again

  end

  def cipher(rotation)
    characters = (' '..'z').to_a
    rotated_characters = characters.rotate(rotation)
    Hash[characters.zip(rotated_characters)]
  end

  def message_encrypt(message, rotation)
    cipher_for_rotation = cipher(rotation)
    message = message.split("")
    cryp_message = []
    message.each do |letter|
      cryp_message << cipher_for_rotation[letter]
    end
    cryp_message = cryp_message.join
    return cryp_message
  end

  def message_decrypt(message, rotation)
    cipher_for_rotation = cipher(-rotation)
    message = message.split("")
    cryp_message = []
    message.each do |letter|
      cryp_message << cipher_for_rotation[letter]
    end
    cryp_message = cryp_message.join
    return cryp_message
  end

  def encrypt_file(filename, rotation)
    file = File.open("#{filename}", "r") #Create the file handle to the input file
    message = file.read #Read the text of the input file
    enc_message = message_encrypt(message, rotation) #Encrypt the text
    encrypted_file = File.open("encrypted_#{filename}", "w") #Create a name for the output file
    encrypted_file.write(enc_message) #Write out the text
    encrypted_file.close
    file.close#Close the file
  end

  def decrypt_file(filename, rotation)
    file = File.open("#{filename}", "r") #Create the file handle to the input file
    new_name = "#{filename}".gsub(/encrypted/, 'decrypted')
    enc_message = file.read #Read the text of the input file
    message = message_decrypt(enc_message, rotation) #Decrypt the text
    decrypted_file = File.open("#{new_name}", "w") #Create a name for the output file
    decrypted_file.write(message) #Write out the text
    decrypted_file.close
    file.close #Close the file
  end

  def supported_characters
    (" ".."z").to_a
  end

  def crack(message)
    supported_characters.count.times.collect do |attempt|
      puts message_decrypt(message, attempt)
    end
  end

  def again
    puts "Do you want to do anything else? (Yes/No) > "
    choice = gets.chomp.downcase
    if choice == "yes"
      initialize
    else
      puts "Goodbye"
      exit(0)
    end
  end
end

e = Encryptor.new
