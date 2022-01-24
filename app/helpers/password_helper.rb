module PasswordHelper
  # Define how long passwords should be
  PASSWORD_IN = 8..100

  # Define what characters are not allowed in a password
  PASSWORD_WHITESPACE = /\s/i

  # Define uppercase character policy
  PASSWORD_UPPERCASE = /[A-Z]/

  # Define lowercase character policy
  PASSWORD_LOWERCASE = /[a-z]/

  # Define numerical digit character policy
  PASSWORD_DIGIT = /\d/

  # Define non-alphanumeric character policy
  PASSWORD_ALNUM = /[[:^alnum:]]/

  # Last passwords locked policy
  LAST_PASSWORDS_HISTORY = 3 # 4 = the current set password and 1-3 are history state

  # Authentication lockout policy
  AUTH_ATTEMPT_LIMIT = 10
  AUTH_LOCKOUT_MINUTES = 30
end