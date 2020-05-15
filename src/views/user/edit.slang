h1 Edit Profile

- if user.errors
  ul.errors
    - user.errors.each do |error|
      li
        error.to_s

form action="/profile" method="post"
  == csrf_tag
  input type="hidden" name="_method" value="patch"

  div.form-group
    input.form-control type="email" name="email" placeholder="Email" value="#{user.email}"

  == submit("Update", class: "btn btn-success btn-sm")
 
== link_to("Profile", "/profile", class: "btn btn-light btn-sm")
