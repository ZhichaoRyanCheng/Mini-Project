<parent-child>
	<div class="memeMaker">
		<!-- ref or reference attribute is a quick way to "bookmark" an element so we can quickly access it in javascript later. -->
		<!-- E.g. HTML <img ref="xxx"/>  -->
		<!-- E.g. JS   this.refs.xxx points to the img tag prior -->
		<input type="text" ref="urlEl" placeholder="Enter url">
		<input type="text" ref="captionEl" placeholder="Enter caption">

		<button type="button" onclick={ addMeme }>Add Meme</button>
	</div>

	<meme each={ animal in memes }></meme>
	<!-- <ol>
		<!-- <div show={ myMemes.length == 0 }>
			<p>NO MEMEs</p>
		</div> -->
		<!-- <ul each={ myMemes }>
      <div>
        <img src={ url } alt="user image" />
        <h1>{ caption }</h1>
      </div> -->
			<!-- <button type="button" onclick={ parent.remove }>Remove Meme</button> -->
		<!-- </li> -->
	<!-- </ul> -->


	<script>
    <!-- a js array to store all my Meme info -->

		var tag = this;

		var memesRef = rootRef.child('memes');

		this.memes = [];
		this.captions = [];

		this.addMeme = function(){
			var key = memesRef.push().key;
			console.log(key);

			var animal = {
				meme: this.refs.urlEl.value,
				caption: this.refs.captionEl.value
			};

			memesRef.push(animal);
		}

		memesRef.on('value', function(snap){
			let dataAsObj = snap.val();


			var tempData = [];

			//instead of statically typing out the array value, we now read it in
			//from the firebase data obj using a js for loop structure
			for (key in dataAsObj) {
				tempData.push(dataAsObj[key]);
			}

			//finally, we copy this array back to our tag's property field
			// console.log("myMemes", tag.myMemes);
			tag.memes = tempData;

			//same question, 4th time of encounter. Why do we need to call tag update here?
			tag.update();
		});
		<!-- this.myMemes = [{
			url: "https://media.tenor.com/images/45d9f7c7d8819cee96116ef94fee5a88/tenor.gif",
			caption: "Welcome to Zooland!! You are in the right place to learn wildlife!!!!"
		},{
			url: "https://media.giphy.com/media/osK3oTtlITrmo/giphy.gif",
			caption: "Well Done and you can add one more!!"
		}] -->



		<!-- this.remove = function(event) {
		//console.log('EVENT:', event);
		//console.log('EVENT.ITEM', event.item);

		//In RiotJS, event.item refers to the book object of the child tag where the click event occurred.
			var memeObj = event.item;

			var index = this.myMemes.indexOf(memeObj);
			this.myMemes.splice(index, 1);
		};

		this.addMeme = function(event) {
      console.log(event);
			var url = this.refs.urlEl.value;
			var caption = this.refs.captionEl.value;

			var meme = {
				url: url,
				caption: caption
			};

			// We are adding a book object to the source of truth array.
			this.myMemes.push(meme);

			// RESET INPUTS
			this.refs.urlEl.value = "";
			this.refs.captionEl.value = "";
		}; -->
	</script>


	<style>
		:scope {
			display: block;
			padding: 15px;
		}
    img {
      width: 45%;
      height: 400px;
      border-radius: 50%;
    }
		input, button {
			border-radius: 50px;
			background: white;
			text: black;
		}
		h1 {
		color: green;
    font:20px;
		font-family: fantasy;
		font-weight: bold;
		}


	</style>

</parent-child>
