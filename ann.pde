final static float STEP=0.001;
float totalError=0;
//always have the last ending in 1 (output node)
final static int[] LAYER_SIZES={2, 3, 4, 5, 4, 3, 2, 1};
ArrayList<ArrayList<Node>> nodes = new ArrayList<ArrayList<Node>>();

float[] data=new float[2];

void setup(){
	size(1000, 800);
	nodes = new ArrayList<ArrayList<Node>>();

	//max 12
	ArrayList<Node> tem=new ArrayList<Node>();
	for(int i=0; i<data.length; i++){
		data[i]=(Math.random()>.5)? 1:0;
		tem.add(new Node(50, 50+i*90));
		tem.get(i).setValue(data[i]);
	}
	nodes.add(tem);


	for(int i=0; i<LAYER_SIZES.length; i++){
		ArrayList<Node> temp=new ArrayList<Node>();
		for(int j=0; j<LAYER_SIZES[i]; j++){
			temp.add(new Node(100+i*90, 50+j*90));


		}			
		//creates 'bias' node
		Node temp2=new Node(100+i*90, 600);
			temp2.setValue(1);
			temp.add(temp2);
		nodes.add(temp);
	}
	for(int i=1; i<nodes.size(); i++)
		for(Node node:nodes.get(i))
			for(Node node2:nodes.get(i-1))
				node.addSynapse(node2);

}
void draw(){
	background(0);
	for (Node n:nodes.get(0)) 
		n.disp();
	for(int i=1; i<nodes.size(); i++){
		for(int j=0; j<nodes.get(i).size()-1; j++){
			nodes.get(i).get(j).activation();
			nodes.get(i).get(j).disp();
		}
		//displays bias node
		nodes.get(i).get(nodes.get(i).size()-1).disp();
	}
	totalError=0.5*(float)Math.pow(nodes.get(nodes.size()-1).get(0).calcError(getAnswer()),2);
	println("Correct Answer (NAND): "+getAnswer());
}
float getAnswer(){
	return (nodes.get(0).get(0).getValue() != 1 && nodes.get(0).get(1).getValue() != 1)?1:0;
}
void mousePressed(){
	setup();
}
