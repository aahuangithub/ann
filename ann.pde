//init this [layer][node number]

ArrayList<ArrayList<Node>> nodes = new ArrayList<ArrayList<Node>>();

float[] data=new float[8];

void setup(){
	size(1000, 800);
	nodes = new ArrayList<ArrayList<Node>>();
	//max 12
	ArrayList<Node> tem=new ArrayList<Node>();
	for(int i=0; i<data.length; i++){
		data[i]=(float)Math.random();
		tem.add(new Node(50, 50+i*90));
		tem.get(i).setValue(data[i]);
	}
	nodes.add(tem);


	for(int i=0; i<(int)(Math.random()*10+3); i++){
		ArrayList<Node> temp=new ArrayList<Node>();
		for(int j=0; j<(int)(Math.random()*10+1); j++){
			temp.add(new Node(100+i*90, 50+j*90));
		}
		nodes.add(temp);
	}
	for(int i=0; i<nodes.size()-1; i++)
		for(Node node:nodes.get(i))
			for(Node node2:nodes.get(i+1))
				node.addSynapse(node2);

}
void draw(){
	background(0);
	for(ArrayList<Node> i:nodes)
		for(Node j:i)
			j.disp();
}

void mousePressed(){
	setup();
}
