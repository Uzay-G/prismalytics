require "../config/application"

# This file is for setting up your seeds.
#
# To run seeds execute `amber db seed`

# Example:
# User.create(name: "example", email: "ex@mple.com")
# Test user for auth

User.create(email: "admin@example.com", password: "password")
