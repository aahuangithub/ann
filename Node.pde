public class Node{
	private float x, y, value;
	private ArrayList<Synapse> synapses=new ArrayList<Synapse>();
	public Node(float xx, float yy){
		x=xx;
		y=yy;
	}

	public void addSynapse(Node con2){
		synapses.add(new Synapse(this, con2));
	}

	public float activation(float[] m){
		float sum=0;
		for(Synapse synapse:synapses) 
			sum+=synapse.calculate();
		value=(float)(1/(1+Math.pow(Math.E,-1*sum)));
		return (float)(1/(1+Math.pow(Math.E,-1*sum)));
	}
	public float getValue(){
		return value;
	}

	public void setValue(float val){
		value=val;
	}

	public float[] getCoords(){
		float[] temp = {x, y};
		return temp;
	}

	public void disp(){
		text(value, x, y);
		stroke(0);
		strokeWeight(1);
		fill(255);
		for(Synapse synapse:synapses)
			synapse.disp();
		ellipse(x, y, 20, 20);
	}

}