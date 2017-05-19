public class Node{
	private float x, y, value, bias;
	private ArrayList<Synapse> synapses=new ArrayList<Synapse>();
	public Node(float xx, float yy){
		bias=0;
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
		value=(float)(1/(1+Math.pow(Math.E,-1*(sum+bias))));
		return (float)(1/(1+Math.pow(Math.E,-1*(sum+bias))));
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