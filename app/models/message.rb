class Message < ApplicationRecord

  has_secure_token :auth_token, length: 24

  before_create :crypt_message

  def encrypt text
    text = text.to_s unless text.is_a? String

    len   = ActiveSupport::MessageEncryptor.key_len
    salt  = SecureRandom.hex len
    key   = ActiveSupport::KeyGenerator.new(password).generate_key salt, len
    crypt = ActiveSupport::MessageEncryptor.new(key, cipher: "aes-256-gcm")
    encrypted_data = crypt.encrypt_and_sign text
    "#{salt}$$#{encrypted_data}"
  end

  def decrypt(text, password)
    salt, data = text.split "$$"

    len   = ActiveSupport::MessageEncryptor.key_len
    key   = ActiveSupport::KeyGenerator.new(password).generate_key salt, len
    crypt = ActiveSupport::MessageEncryptor.new(key, cipher: "aes-256-gcm")
    crypt.decrypt_and_verify data
  end

  def crypt_message
    self.report = self.encrypt self.report
  end

  def decrypt_message
    self.decrypt(self.report, password)
  end

end
