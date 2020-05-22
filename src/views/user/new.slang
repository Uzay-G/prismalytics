
- if user
  - if user.errors
    ul.errors
    - user.errors.each do |error|
      li 
        error.to_s

form action="/registration" method="post"
  h1 Sign Up
  == csrf_tag
  div class="form-group"
    input class="form-control" type="email" name="email" placeholder="Email" required="true"
  div class="form-group"
    input class="form-control" type="password" name="password" placeholder="Password" required="true"
  button.btn.btn-success.btn-sm type="submit"
    | Submit
  hr
  == link_to("Already have an account?", "/signin")
