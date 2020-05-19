
- if user.errors
  ul.errors
  - user.errors.each do |error|
    li
      error.to_s

form action="/session" method="post"
  h1 Sign In
  == csrf_tag
  div.form-group
    input.form-control type="email" name="email" placeholder="Email"
  div class="form-group"
    input.form-control type="password" name="password" placeholder="Password"
  button.btn.btn-success.btn-sm type="submit" Sign In
  hr
  == link_to("Don't have an account yet?", "/signup")
