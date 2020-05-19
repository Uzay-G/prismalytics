doctype html
html
  head
    title Galena
    meta charset="utf-8"
    meta http-equiv="X-UA-Compatible" content="IE=edge"
    meta name="viewport" content="width=device-width, initial-scale=1"
    link rel="stylesheet" href="/dist/main.bundle.css"
    link rel="apple-touch-icon" href="/favicon.png"
    link rel="icon" href="/favicon.png"
    link rel="icon" type="image/x-icon" href="/favicon.ico"
    link href="https://fonts.googleapis.com/css2?family=Fjalla+One&family=Roboto&display=swap" rel="stylesheet"
  body
    nav class="navbar navbar-expand navbar-dark mb-3"
      div.container
        a.navbar-brand href="/"
          img src="/dist/images/logo.png" height="50" alt="Amber logo"
        ul class="navbar-nav mr-auto"
          == render(partial: "layouts/_nav.slang")
        ul.navbar-nav
          == render(partial: "layouts/_session.slang")
    div.container
      - flash.each do |key, value|
        div class="alert alert-#{key}" role="alert" #{flash[key]}

      div.main
        == content

    script src="/dist/main.bundle.js"

    - if Amber.settings.auto_reload?
      script src="/js/client_reload.js"