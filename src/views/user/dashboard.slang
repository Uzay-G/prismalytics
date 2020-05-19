div.float-left 
    h2 Bots
    - current_user.not_nil!.bots.each do |bot|
        a.list-group-item.list-group-item-action href="/bots/#{bot.id}"
            p = bot.name
    br
    - if current_user.not_nil!.bots.size < 5
        a.btn.btn-dark type="button" href="/bots/new" Add Bot
