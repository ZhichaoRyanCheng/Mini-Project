<human>
	<h3>Tell A Joke</h3>
	<button type="button" onclick={ tellJoke }>Tell Leopard A Random Joke</button>
	<div class="jokeMaker">
		<!-- ref or reference attribute is a quick way to "bookmark" an element so we can quickly access it in javascript later. -->
		<!-- E.g. HTML <img ref="xxx"/>  -->
		<!-- E.g. JS   this.refs.xxx points to the img tag prior -->
		<input type="text" ref="jokeContent" placeholder="Enter A Joke">
		<button type="button" onclick={ addJoke }>Add</button>
	</div>

	<div class ="jokeContainer" each={myJokes}>
		<p>{value}</p>
    <button type="button" onclick={ removeJoke }>Remove</button>
  </div>

	<script>
		this.myJokes = [{
			value: "Hello, my friend!"
		},{
			value: "(I'm not your friend!!)"
		},{
			value: "I'm so hungry...."
		},{
			value: "me to..."
		},{
			value: "You look like a good lunch to me.."
		},{
			value: "Really? That's not a compliment,,"
		},{
			value: "You look like a nightmare to me,,,"
		},{
			value: "╭∩╮（︶︿︶）╭∩╮"
		},{
			value: "You can't catch me!",
		},{
			value: "let's see.."
		}]



		this.removeJoke = function(event) {
			// In RiotJS, event.item refers to the object of the child tag where the click event occurred.
			console.log(event);
			console.log(event.item);

			var jokeObj = event.item;

			var index = this.myJokes.indexOf(jokeObj);
			console.log(index);

			this.myJokes.splice(index, 1);
		};

		this.addJoke = function(event) {
			//console.log(typeof(this.refs.jokeContent.value));
			var newJoke = {};
			//console.log(newJoke);
			newJoke.value = this.refs.jokeContent.value;
			//console.log(newJoke);

			this.myJokes.push(newJoke);
			this.refs.jokeContent.value = "";
		};

		this.tellJoke = function(){
			var max = this.myJokes.length;
			var tempIndex = Math.floor(Math.random() * Math.floor(max));
			alert(this.myJokes[tempIndex].value);
		}
	</script>


	<style>
		:scope {
			display: block;
			background: grey;
			padding: 15px;
			vertical-align: bottom;
		}
    button{
      margin-left: 3px;
    }
    p{
      padding: 5px;
    }

		.jokeContainer{
			display: inline-block;
		}
	</style>
</human>
