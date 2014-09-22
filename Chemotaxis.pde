Bacteria [] colony;
Food blob;
void setup()
 {
 	size(500, 500);
 	colony = new Bacteria[100];
 	for(int i = 0; i < colony.length; i++)
 	{
 		colony[i] = new Bacteria();
 	}
 	blob = new Food((int)(Math.random() * 500), (int)(Math.random() * 500), 0);
 }   
 void draw()   
 {    
 	background(191, 225, 255);
 	for(int i = 0; i < colony.length; i++)
 	{
 		if(15 >= dist(colony[i].bactX, colony[i].bactY, blob.foodX, blob.foodY))
 		{
 			blob.foodBye = 23;
 		}
 	}
 	blob.show();
	for(int i = 0; i < colony.length; i++)
	{
		colony[i].move();
		colony[i].show();
	}
 }  
 class Bacteria    
 {     
 	int bactX, bactY, bactColorR;
 	Bacteria()
 	{
 		bactX = (int)(Math.random() * 500);
 		bactY = (int)(Math.random() * 500);
 		bactColorR = (int)(Math.random() * 256);
 	}
 	void move()
 	{
 		if(bactX<blob.foodX)
 		{
 			bactX = bactX+(int)(Math.random() * 5) - 1;
 		}
 		else
 		{
 			bactX = bactX+(int)(Math.random() * 5) - 3;
 		}
 		if(bactY<blob.foodY)
 		{
 			bactY = bactY+(int)(Math.random() * 5) - 1;
 		}
 		else
 		{
 			bactY = bactY+(int)(Math.random() * 5) - 3;
 		}
 		//bactX = bactX + (int)(Math.random() * 3) - 1;
 		//bactY = bactY + (int)(Math.random() * 3) - 1;
 	}
 	void show()
 	{
 		noStroke();
 		fill(bactColorR, 20, 20);
 		ellipse(bactX, bactY, 15, 15);
 		ellipse(bactX+(int)(Math.random() * 7) - 3, bactY+(int)(Math.random() * 7) - 3, 12, 12);
 		ellipse(bactX+(int)(Math.random() * 7) - 3, bactY+(int)(Math.random() * 7) - 3, 12, 12);
 		//ellipse(bactX+(int)(Math.random() * 7) - 3, bactY+(int)(Math.random() * 7) - 3, 12, 12);
 	}
 }
 class Food
 {
 	int foodX, foodY, foodColorG, foodBye;
 	Food(int x, int y, int minus)
 	{
 		foodX = x;
 		foodY = y;
 		foodColorG = (int)(Math.random() * 100);
 		foodBye = minus;
 	}
 	void show()
 	{
 		noStroke();
 		//stroke(0, foodColorG, 0, 50);
 		fill(100, 156+foodColorG, 0);
 		ellipse(foodX-5, foodY-5, 20-foodBye, 20-foodBye);
 		ellipse(foodX-5, foodY+10, 25-foodBye, 25-foodBye);
 		ellipse(foodX+10, foodY-5, 25-foodBye, 20-foodBye);
 		ellipse(foodX+10, foodY+5, 30-foodBye, 25-foodBye);
 		ellipse(foodX, foodY+15, 20-foodBye, 25-foodBye);
 		noStroke();
 		ellipse(foodX+5, foodY, 25, 25-foodBye);
 	}
 }
void mousePressed()
{
	blob = new Food(mouseX, mouseY, 0);
}