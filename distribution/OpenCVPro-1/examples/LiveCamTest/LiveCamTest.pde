import gab.opencvpro.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCVPro opencv;

void setup() {
  size(640, 480);
  video = new Capture(this, 640/2, 480/2);
  
  opencv = new OpenCVPro(this, 640/2, 480/2);
  opencv.loadCascade(OpenCVPro.CASCADE_FRONTALFACE_ALT);  
  
  video.start();
}

void draw() {
  //scale(2);
    image(video, 0,0 );

  opencv.loadImage(video);
  

  noFill();
  stroke(0,255,0);
  strokeWeight(3);
  Rectangle[] faces = opencv.detect();

  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  }
}

void captureEvent(Capture c) {
  c.read();
}

