- if bot.errors
  ul.errors
  - bot.errors.each do |error|
    li
      error.to_s

form action="/bots/create" method="post"
  h1 New bot
  == csrf_tag
  div.form-group
    input.form-control type="text" name="name" placeholder="Bot name" required="true"

  div.form-group
    input.form-control type="text" name="prefix" placeholder="Bot Prefix" required="true"
  button.btn.btn-success.btn-sm type="submit" Create
  hr
