script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"
div.home
  img src="/dist/images/logo.svg"
  h1 Powerful Bot Analytics
  p width="100"
    | Prismalytics allows you to gain useful insights on how your bot is being used.
    | It provides information on which commands are most commonly used, daily stats on the interactions with users, and so much more.

br
center
  h3 Your bot
canvas#activity


div.show-commands
  h3 
    | Learn more about 
    strong how
    | people are using your bot.
  div
    canvas#commands


javascript:
  var myLineChart = new Chart("activity", {
    type: 'line',
    data: {"labels":["2020-05-15","2020-05-17","2020-05-18"],"datasets":[{"label":"Daily messages received by bot","data":[200, 34, 1000],"borderColor":"rgb(154, 31, 64)","lineTension":0.1,"fill":false},{"label":"Number of servers","data":[1,5,20],"borderColor":"rgb(22, 36, 71)","lineTension":0.1,"fill":false}]},
  });
  var myDoughnutChart = new Chart("commands", {
    type: 'doughnut',
    data: {"labels":["help","stats","joke","clear","ping","kick","github"],"datasets":[{"data":[9,2,2,7,1,2],"backgroundColor":["rgb(135, 120, 82)","rgb(198, 75, 128)","rgb(61, 178, 155)","rgb(40, 107, 171)","rgb(154, 19, 142)","rgb(126, 26, 92)","rgb(243, 71, 214)","rgb(102, 33, 221)","rgb(105, 174, 167)","rgb(248, 93, 234)","rgb(18, 143, 151)"],"hoverBackgroundColor":"rgb(22, 36, 71)"}]},
    hoverBackgroundColor: "#162447",
  });