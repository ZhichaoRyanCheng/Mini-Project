<gazelle>
  <img onmouseover={speak} src="https://media1.tenor.com/images/1a4e3583932a66c9a7c91862b700127a/tenor.gif?itemid=5513069">
  <p if={visible}>{data}{myCurrentJoke}</p>

  <script>
    //make a copy of my pet object and call it that
    var that = this;

    //initial state/propoerty
    this.hunger = 50;
    this.petImage = "happy";
    this.visible = false;
    this.myCurrentJoke = "temp joke";
    this.data = "";
    this.myJokes = [
      {
        value: "I'm not your friend!!"
      }, {
        value: "me to..."
      }, {
        value: "Really? That's not a compliment,,"
      }, {
        value: "You look like a nightmare to me,,,"
      }, {
        value: "You can't catch me!!"
      }
    ]
    this.hide = function () {
      this.visible = false;
    }

    this.clearData = function(){
      this.data = "";
    }

    this.selectJoke = function(){
      var max = that.myJokes.length;
      var tempIndex = Math.floor(Math.random() * Math.floor(max));
      that.myCurrentJoke = that.myJokes[tempIndex].value;
    }

    observable.on('leopardSpeak', function(passedData){
      that.data = passedData;
      that.wait();
    });


    this.wait = function(){
      setTimeout(function () {
        that.respond();
      }, 1000);
    }

    this.respond = function () {
      that.selectJoke();
      that.visible = true;
      that.update();
      // console.log(this);
      setTimeout(function () {
        that.hide();
        that.update();
      }, 1000);
    }

    this.speak = function () {
      this.clearData();
      console.log(this.data);
      this.selectJoke();

      //console.log(that.myCurrentJoke);
      observable.trigger('mimiSpeak', that.myCurrentJoke);
      this.visible = true;

      this.update();
      // console.log(this);
      setTimeout(function () {
        that.hide();
        that.update();
      }, 1000);
    }

  </script>

  <style>
    :scope {
      margin: auto;
      color: black;
      font-size:30px;;
    }

    img {
      width: 30%;
      height: 400px;
      border-radius: 80px;
    }
    P{
      text-align: right;
      padding-right: 4em;
    }
  </style>
</gazelle>
