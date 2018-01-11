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
    return cryp_message
  end

  def encrypt_file(filename, rotation)
    file = File.open("#{filename}", "r") #Create the file handle to the input file
    message = file.read #Read the text of the input file
    enc_message = encrypt(message, rotation) #Encrypt the text
    encrypted_file = File.open("encrypted_#{filename}", "w") #Create a name for the output file
    encrypted_file.write(enc_message) #Write out the text
    encrypted_file.close
    file.close#Close the file
  end

  def decrypt_file(filename, rotation)
    file = File.open("#{filename}", "r") #Create the file handle to the input file
    new_name = "#{filename}".gsub(/encrypted_/, 'decrypted')
    enc_message = file.read #Read the text of the input file
    message = decrypt(enc_message, rotation) #Decrypt the text
    decrypted_file = File.open("#{new_name}", "w") #Create a name for the output file
    decrypted_file.write(message) #Write out the text
    decrypted_file.close
    file.close #Close the file
  end

end

e = Encryptor.new
print "What is the file you want to encrypt? (Include file extension) > "
encrypt_this = gets.chomp
print "How much rotation do you want for your cipher? > "
rotation = gets.chomp.to_i
e.encrypt_file(encrypt_this, rotation)
print "What is the file you want to decrypt? (Include file extension) > "
decrypt_this = gets.chomp
print "How much rotation was used to encrypt the file? > "
rotation = gets.chomp.to_i
e.decrypt_file(decrypt_this, rotation)
