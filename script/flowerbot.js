/*
 *  Flower Bot Engine
 *  created 4/14/2012
 * 	note: the canvas should be a multiple of the block size (current default is 25)
 */
var ctx = null;
var boxpos = [];
var flowerpos = [blocksize * 18,blocksize * 9]; // default flower position
var flowervisible = true;
var blocksize = 25;
    	
function draw(){  
var canvas = document.getElementById('canvas');  
if (canvas.getContext){  
  
  ctx = canvas.getContext('2d');  
  // clear rect in case we're resetting
  ctx.clearRect(0,0,canvas.width,canvas.height);
  
  // draw the player
  ctx.fillStyle = "rgb(200,0,0)";
  ctx.fillRect (0, 0, blocksize, blocksize);
  boxpos = [0,0];
  
  // draw the flower
  drawFlower(ctx);
  /*
  ctx.fillStyle = "rgb(250,80,171)";
  ctx.fillRect (blocksize * 18, blocksize * 9, blocksize, blocksize);
  flowerpos = [blocksize * 18,blocksize * 9];
  */
  
}  
}

function reset(){

	// make flower visible
	flowervisible = true;
	draw();
}

function moveRight(){
var canvas = document.getElementById('canvas');  
if (canvas.getContext){  
  
  ctx = canvas.getContext('2d');  
  
  ctx.clearRect(0,0,canvas.width,canvas.height); 
  
  boxpos[0] = boxpos[0] + blocksize;
  
  ctx.fillStyle = "rgb(200,0,0)";
  ctx.fillRect (boxpos[0], boxpos[1], blocksize, blocksize);
  
  //redraw flower
  drawFlower(ctx);
  
}  
}

function moveLeft(){
var canvas = document.getElementById('canvas');  
if (canvas.getContext){  
  
  ctx = canvas.getContext('2d');
  
  ctx.clearRect(0,0,canvas.width,canvas.height);
  
  boxpos[0] = boxpos[0] - blocksize;
  
  ctx.fillStyle = "rgb(200,0,0)";
  ctx.fillRect (boxpos[0], boxpos[1], blocksize, blocksize);
  
  
  //redraw flower
  drawFlower(ctx);
}
}

function moveUp(){
var canvas = document.getElementById('canvas');  
if (canvas.getContext){  
  
  ctx = canvas.getContext('2d');  
  
  ctx.clearRect(0,0,canvas.width,canvas.height);
  
  boxpos[1] = boxpos[1] - blocksize;
  
  ctx.fillStyle = "rgb(200,0,0)";
  ctx.fillRect (boxpos[0], boxpos[1], blocksize, blocksize);
  
  
  //redraw flower
  drawFlower(ctx);
}  
}

function moveDown(){
var canvas = document.getElementById('canvas');  
if (canvas.getContext){  
  
  ctx = canvas.getContext('2d');
  
  ctx.clearRect(0,0,canvas.width,canvas.height);
  
  boxpos[1] = boxpos[1] + blocksize;
  
  ctx.fillStyle = "rgb(200,0,0)";
  ctx.fillRect (boxpos[0], boxpos[1], blocksize, blocksize);
  
  //redraw flower
  drawFlower(ctx);
}
}

function drawFlower(context) {

  // if flower is visible, draw it
  if (flowervisible == true) {
	  context.fillStyle = "rgb(250,80,171)";
	  context.fillRect (blocksize * 18, blocksize * 9, blocksize, blocksize);
	  flowerpos = [blocksize * 18,blocksize * 9];
  }
}

function refresh(context) {
	
	ctx.clearRect(0,0,canvas.width,canvas.height);
	ctx.fillStyle = "rgb(200,0,0)";
	ctx.fillRect (boxpos[0], boxpos[1], blocksize, blocksize);
	drawFlower();
	
}

function nearFlower() {

	// calculate distance in number of blocks
	var xdiff = Math.abs((flowerpos[0]/25) - (boxpos[0]/25))
	var ydiff = Math.abs((flowerpos[1]/25) - (boxpos[1]/25))
	
	if ((xdiff <= 1) && (ydiff <= 1)) {
		
		// if nearby flower, return true
		return true;
	}
	else {
	
		// if not nearby flower, return false
		return false;
	}
}

function pickFlower() {

	if (nearFlower()) {
		alert("Picked the flower!");
		flowervisible = false;
		
		// refresh the view
		var canvas = document.getElementById('canvas');
		ctx = canvas.getContext('2d');
		refresh(ctx);
	}
	else {
		alert("No flower nearby!");
	}
}