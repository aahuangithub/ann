public class Node{
	private float x, y, value, error;
	private ArrayList<Synapse> synapses=new ArrayList<Synapse>();
	public Node(float xx, float yy){
		x=xx;
		y=yy;
	}

	public void addSynapse(Node con2){
		synapses.add(new Synapse(con2, this));
	}

	public float activation(){
		float sum=0;
		for(Synapse synapse:synapses) 
			sum+=synapse.calculate();
		value=(float)(1/(1+Math.pow(Math.E,-1*sum)));
		return (float)(1/(1+Math.pow(Math.E,-1*sum)));
	}
	public float calcError(float answer){
		error=value-answer;
		return value-answer;
	}

	//GET
	public float getError(){
		return error;
	}
	public float getValue(){
		return value;
	}
	public float[] getCoords(){
		float[] temp = {x, y};
		return temp;
	}

	//SET
	public void setValue(float val){
		value=val;
	}



	public void disp(){
		fill(255);
		text((int)(value*100), x+15, y);
		stroke(0);
		strokeWeight(1);
		fill(255);
		for(Synapse synapse:synapses)
			synapse.disp();
		ellipse(x, y, 20, 20);
	}
	

}