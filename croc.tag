<croc>
  <img onmouseover={speak} src="https://www.nerjarob.com/wp-content/uploads/croc.gif">
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
        value: "Hello, you two!"
      }, {
        value: "Nice to see you guys at lunch time...."
      }, {
        value: " We should hangout sometimes and I won't bite...."
      }, {
        value: "╭∩╮（︶︿︶）╭∩╮"
      }, {
        value: "Can't wait to find out..."
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

      width: 35%;
      height: 400px;
      border-radius: 80px;
    }
  </style>
</croc>
