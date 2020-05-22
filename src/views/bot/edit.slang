- if bot.errors
  ul.errors
  - bot.errors.each do |error|
    li
      error.to_s


form action="/bot/#{bot.id}" method="post"
  h1 Edit #{bot.name}
  == csrf_tag
  input type="hidden" name="_method" value="patch"
  input type="hidden" name="id" value="#{bot.id}"
  div.form-group
    input.form-control type="text" name="name" placeholder="Bot name" value="#{bot.name}" required="true"

  div.form-group
    input.form-control type="text" name="prefix" placeholder="Bot Prefix" value="#{bot.prefix}" required="true"
  == submit("Update", class: "btn btn-success btn-sm")
  == link_to("Profile", "/profile", class: "btn btn-light btn-sm")
