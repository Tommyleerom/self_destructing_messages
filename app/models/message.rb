class Message < ApplicationRecord

  def decrypt
    EncryptionService.decrypt(report)
  end

  def encrypt
    self.report = EncryptionService.encrypt(report)
  end

end
