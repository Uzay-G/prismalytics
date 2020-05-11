
h2 #{bot.name}
div.float-left
    h3 Bot Information
    a.list-group-item.list-group-item-action
        strong #{bot.name}
    a.list-group-item.list-group-item-action Prefix: #{bot.prefix}
    == link_to "Edit", "/bots/edit/#{bot.id}", class: "btn btn-secondary"
    == link_to("delete", "/bots/#{ bot.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-xs")
    br

div.float-right
    h2 Stats
