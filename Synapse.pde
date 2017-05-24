class Synapse{
	private float weight;
	private Node con1, con2;
	public Synapse(Node one, Node two){
		con1=one;
		con2=two;
		weight=(float)Math.random();
	}
	public void setWeight(float w){weight=w;}
	public float getWeight(){return weight;}

	public float calculate(){
		return weight*con1.getValue();
	}
	public float calcError(){
		return 0;
	}
	public void learn(){
		//gradient descent?
		if(calcError()<0) weight+=STEP;
		else weight-=STEP;
	}
	public void disp(){
		stroke(127+127*weight);
		strokeWeight(2);
		float[] t1, t2;
		t1=con1.getCoords();
		t2=con2.getCoords();
		line(t1[0],t1[1],t2[0],t2[1]);
	}
}