module EncryptionHelper
  BCRYPT_SALT = "a4n4MIHqwX9ICE1EPLtayzi9EGAslRa7mCRoYSine7Z57NKywPzSYy4xsZz6uLSMMgFNaQvm8A14SoW4X8iOoRQgAPAR0zUqpeNx" # 100 Random Characters

  def self.rand_bcrypt
    BCrypt::Password.create("#{Random.rand}#{Time.now.to_i}#{EncryptionHelper::BCRYPT_SALT}")
  end

  def self.salted_sha512(value, salt)
    Digest::SHA2.new(512).hexdigest("#{value}#{salt}")
  end

  def self.salted_md5(value, salt)
    Digest::MD5.hexdigest("#{value}#{salt}")
  end

  def self.secure_rand_short(length:, salt:)
    val, final = Digest::SHA1.hexdigest("#{rand(36**8).to_s(36)}#{}")[8..(8+(length-1))], ""
    val.chars.each{|x| final = "#{final}#{rand.round > 0 ? x : x.upcase}"}
    final
  end

  # Secure reversible encryption methods
  def self.cryptor
    key = ActiveSupport::KeyGenerator.new(ENV["REVERSE_ENCRYPT_KEY"]).generate_key(ENV["REVERSE_ENCRYPT_SALT"], 32)
    ActiveSupport::MessageEncryptor.new(key)
  end

  def self.secure_encrypt(data)
    crypt = cryptor
    crypt.encrypt_and_sign(data)
  end

  def self.secure_decrypt(data)
    crypt = cryptor
    crypt.decrypt_and_verify(data)
  end
end
  