<leopard>
  <img onmouseover={speak} src="https://media2.giphy.com/media/CXgrd9yKBdVF6/source.gif">
  <p if={visible}>{data}{myCurrentJoke}</p>
  <script>
    //make gigi object  observable
    var that = this;

    //initial state/propoerty
    this.petImage = "neutral";
    this.visible = false;
    this.data = "";
    this.myJokes = [
      {
        value: "Hello, my friend!"
      }, {
        value: "I'm so hungry...."
      }, {
        value: "You look like a good lunch to me.."
      }, {
        value: "╭∩╮（︶︿︶）╭∩╮"
      }, {
        value: "let's see.."
      }
    ];


    this.myCurrentJoke = "temp joke";

    this.selectJoke = function(){
      var max = that.myJokes.length;
      var tempIndex = Math.floor(Math.random() * Math.floor(max));
      that.myCurrentJoke = that.myJokes[tempIndex].value;
    }

    this.clearData = function(){
      this.data = "";
    }

    this.hide = function () {
      this.visible = false;
    }

    this.speak = function () {
      this.clearData();
      this.selectJoke();
      // embed a trigger to inform mimi + pass data
      observable.trigger('gigiSpeak', this.myCurrentJoke);
      this.visible = true;
      setTimeout(function () {
        that.hide();
        that.update();
      }, 1000);
    }

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

    observable.on('gazelleSpeak', function(passedData){
      that.data = passedData;
      that.wait();
    });

  </script>

  <style>
    :scope {
      margin: auto;
      color: black;
      font-size: 30px;
    }

    img {
      
      width: 60%;
      height: 400px;
      border-radius: 80px;
    }
  </style>
</leopard>
