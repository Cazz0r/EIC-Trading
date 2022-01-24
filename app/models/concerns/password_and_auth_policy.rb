module PasswordAndAuthPolicy
  extend ActiveSupport::Concern
  included do
    attr_accessor :new_last_password
    has_secure_password

    before_validation :fill_pw_salt

    # Password Policy Implementation
    validate :password_length, if: -> { password.present? }

    def self.authenticate(params)
      user = User.where("lower(username) = ?", (params[:username] || "").downcase).first
      return :invalid_credentials if user.blank? || !user.authenticate(params[:password])
      user
    end

    private
    def fill_pw_salt
      self.pw_salt = EncryptionHelper.rand_bcrypt if self.pw_salt.blank?
    end

    def password_length
      return if PasswordHelper::PASSWORD_IN.cover?(self.password.length)
      errors[:base] << "Password must be at least 8 characters."
    end
  end
end