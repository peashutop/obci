# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_obci_session',
  :secret => '3b8d9eef90b8a5b8adcf2aba293520964cda66ec7ae33667ba0588c6e4ffdf3678c686f6b9dd44866f2fdc1a180f0bce04a9b1a0c6d0063a31f17c244ee94e04'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
