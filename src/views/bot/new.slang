h1 New bot
- if bot.errors
  ul.errors
  - bot.errors.each do |error|
    li
      bot.to_s

<form action="/bots/create" method="post">
  == csrf_tag
  div.form-group
    input.form-control" type="text" name="name" placeholder="Bot name"

  div.form-group
    input.form-control" type="text" name="prefix" placeholder="Bot Prefix"
  button.btn btn-success btn-sm" type="submit" Create
  == link_to("Profile", "/profile", class: "btn btn-light btn-sm")
hr
<%= link_to("Already have an account?", "/signin") -%>