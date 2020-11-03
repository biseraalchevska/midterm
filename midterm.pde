// example from runwayML
// adapted by aven (https://www.aven.cc)
// artMahcines & NYU Shanghai

// aiarts, course website: https://wp.nyu.edu/shanghai-ima-aiarts/

import com.runwayml.*;
RunwayHTTP runway;
PImage head;
PImage torso;
PImage hip;
PImage l_knee;
PImage leg;
PImage shoulder;
PImage shoulder2;
PImage arm1;
JSONObject data;

void setup() {
  size(500, 700);
  head = loadImage("head copy.png");
  torso = loadImage("torso copy.png");
  hip = loadImage("hip copy.png");
  l_knee = loadImage("left hip to knww copy.png");
  leg = loadImage("right foot to knee copy.png");
  shoulder = loadImage("right shoulder to elbow copy.png");
  shoulder2 = loadImage("right shoulder to elbow RIGHT copy.png");
  arm1 = loadImage("left arm elow to wrist copy.png");
  runway = new RunwayHTTP(this);
}

void draw() {
  background(255);
  //ModelUtils.drawPoseParts(data,g,10);
  draw_poses();
}



void draw_poses() {
  if (data != null) {
    JSONArray poses = data.getJSONArray("poses");

    // lets assume we have multi-poses detection on
    for (int i = 0; i < poses.size(); i ++) {
      //pass in index
      JSONArray the_pose = poses.getJSONArray(i);
      //println(the_pose);
      //println(the_pose.size());
      for (int j = 0; j < the_pose.size(); j ++) { //access to keypoints
        JSONArray point = the_pose.getJSONArray(j);
        //print(point);
        //println(point.size());
        float x = point.getFloat(0)*width;
        float y = point.getFloat(1)*height;

        if (j == 0) {
          imageMode(CENTER);
          image(head, x-30, y-10, 90, 90);

        }
        if (j==6){
          image (torso, x+40,y, 90,90);
        }
        if(j == 11){
           image (hip, x-60,y-90,90,90);
        }
        if(j == 13){
          image (l_knee, x-60,y-160,70,70);
        }
        if(j == 14){
          image (l_knee, x+10,y-165,70,70);
        }
        if(j == 15){
          image (leg, x-60,y-200,60,60);
        }        
        if(j == 16){
          image (leg, x+10,y-190,60,60);
        }        
        if(j == 5){
          image (shoulder2, x-30,y+10,235,235);
        }        
        if(j == 6){
          image (shoulder, x-30,y+10,120,120);  
        } 
      }
    }
  }
}


void runwayDataEvent(JSONObject runwayData) {
  data = runwayData;
}
