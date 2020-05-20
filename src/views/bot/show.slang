
div style="width: 800px; margin: auto"
    h2 Setup
    p We have built custom 
        a href="https://github.com/Uzay-G/prisma.py" python
        | and
        a href="https://github.com/Uzay-G/prismarb" ruby
        | libraries that server as wrappers for 
        code prismalytics
        | and we are working on implementing other libraries in different languages.
        | Check out the docs
        | for detailed instructions on how to get it working.
    h2 Analytics for #{bot.name}
    br
    p Daily Messages:
    canvas id="activity" width="800" height="400"
br
div id="dashboard"
    div.float-left
        center
            h3 Bot Information
        a.list-group-item.list-group-item-action href="/bots/edit/#{bot.id}"
            strong #{bot.name}
        a.list-group-item.list-group-item-action href="/bots/edit/#{bot.id}" Prefix: #{bot.prefix}
        p.list-group-item.list-group-item-action Secret Token: #{bot.token}
        == link_to "Edit", "/bots/edit/#{bot.id}", class: "btn btn-secondary"
        == link_to("delete", "/bots/#{ bot.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-xs")
        br
    br
    div.command-div
        center
            h3 Command Frequency
        canvas id="commands"

div.servers style="width: 800px; margin: auto;"
    h3 Servers
    - bot.servers.each do |server|
        ul
            li.list-group-item.list-group-item-action 
                h3 #{server.name}
                p
                    small #{server.region.capitalize}
                p #{server.users} Users
            //li.list-group-item.list-group-item-action Messages: #{server.message_count}
    br

script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"
- chart_data = {"labels": [] of String, "datasets": [{"data": [] of Int32, "backgroundColor": [] of String, "hoverBackgroundColor": "rgb(22, 36, 71)"}]}
- i = 0
- bot.commands.each do |command|
    - chart_data["labels"] << command.command
    - chart_data["datasets"][0]["data"] << command.occurences
    - chart_data["datasets"][0]["backgroundColor"] << "rgb(#{Random.rand(255)}, #{Random.rand(255)}, #{Random.rand(255)})"
    - i += 1

- activity_data = {"labels": [] of String, "datasets": [{"label": "Daily messages received by bot", "data": [] of Int32, "borderColor": "rgb(154, 31, 64)", "lineTension": 0.1, "fill": false},{"label": "Number of servers", "data": [] of Int32, "borderColor": "rgb(22, 36, 71)", "lineTension": 0.1,"fill": false}]}
- bot.activities.each do |activity|
    - activity_data["labels"] << activity.created_at.not_nil!.to_s("%F")
    - activity_data["datasets"][0]["data"] << activity.value
    - activity_data["datasets"][1]["data"] << activity.servers
javascript:
    var myDoughnutChart = new Chart("commands", {
        type: 'doughnut',
        data: #{chart_data.to_json},
        hoverBackgroundColor: "#162447",

    });
    var myLineChart = new Chart("activity", {
        type: 'line',
        data: #{activity_data.to_json},

    });