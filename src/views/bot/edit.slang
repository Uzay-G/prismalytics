h1 Edit #{bot.name}
- if bot.errors
  ul.errors
  - bot.errors.each do |error|
    li
      error.to_s


form action="/bot/#{bot.id}" method="post"
  == csrf_tag
  input type="hidden" name="_method" value="patch"
  input type="hidden" name="id" value="#{bot.id}"
  div.form-group
    input.form-control type="text" name="name" placeholder="Bot name" value="#{bot.name}"

  div.form-group
    input.form-control type="text" name="prefix" placeholder="Bot Prefix" value="#{bot.prefix}"
  == submit("Update", class: "btn btn-success btn-sm")
  == link_to("Profile", "/profile", class: "btn btn-light btn-sm")
