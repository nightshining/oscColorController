#include "ofApp.h"

//--------------------------------------------------------------

void ofApp::setup(){
    
    ofBackground(ofColor::black);
    receiver.setup(7401);
    
    colorChange = 0;
    alpha = 0.0;
    
    int colorAmt = 20;
    
    for (int i = 0; i < colorAmt; i++) {
        colors.resize(i);
    }
    
    //Create Color Pallette//
    
    colors[0].set(143, 186, 164);
    colors[1].set(142, 95, 95);
    colors[2].set(143, 252, 190);
    colors[3].set(143, 62, 94);
    colors[4].set(145, 136, 138);
    colors[5].set(75, 136, 118);
    colors[6].set(255, 149, 150);
    colors[7].set(157, 199, 150);
    colors[8].set(255, 81, 133);
    colors[9].set(146, 202, 171);
    colors[10].set(127, 140, 130);
    colors[11].set(255, 192, 158);
    colors[12].set(117, 150, 131);


    counter = 0.0;
    patternOn = false;
    
    
}

//--------------------------------------------------------------

void ofApp::update(){
    
    while( receiver.hasWaitingMessages() ){
        
        // get the next message
        ofxOscMessage m;
        receiver.getNextMessage( &m );
        
        if( m.getAddress() == "/colorChange" ){
            // both the arguments are int32's
            colorChange = m.getArgAsInt32( 0 );
        }
        
        if( m.getAddress() == "/alpha" ){
            // both the arguments are int32's
            alpha = m.getArgAsInt32( 0 );
        }
        
        if( m.getAddress() == "/triggerObject" ){
            // both the arguments are int32's
            patternOn = m.getArgAsInt32( 0 );
        }
        
    }
    
//    alpha -= 10.0;
//    
//    if (alpha <= 0.0) {
//        alpha = 0.0;
//    }
//    
    for (int i = 0; i < colors.size(); i++) {
        
        colors[i].a = alpha;
    }

    
    counter += 0.33f;
    
    

}



//--------------------------------------------------------------

void ofApp::draw(){
    
    ofPushStyle();
    ofPushMatrix();
    //ofSetColor(r, g, b, a);
    ofSetColor(colors[colorChange]);
    ofRect(0, 0, ofGetWidth(), ofGetHeight());
    ofPopMatrix();
    ofPopStyle();
    
    
    if (patternOn) {
    for (int i = 50; i < ofGetWidth(); i+=100) {
        for (int j = 50; j < ofGetHeight(); j+=100) {
            
        int noiseCircles = sin(j + counter) * 50;
        ofPushStyle();
        ofPushMatrix();
        ofTranslate(i , j + noiseCircles );
        ofSetCircleResolution(60);
        ofSetColor(0);
        ofFill();
        ofCircle(0, 0, 25);
        ofPopMatrix();
        ofPopStyle();
        }
    }
    }
    
}



//--------------------------------------------------------------

void ofApp::exit(){
    
    
    
}



//--------------------------------------------------------------

void ofApp::touchDown(ofTouchEventArgs & touch){
    
    
    
}



//--------------------------------------------------------------

void ofApp::touchMoved(ofTouchEventArgs & touch){
    
    
    
}



//--------------------------------------------------------------

void ofApp::touchUp(ofTouchEventArgs & touch){
    
    
    
}



//--------------------------------------------------------------

void ofApp::touchDoubleTap(ofTouchEventArgs & touch){
    
    
    
}



//--------------------------------------------------------------

void ofApp::touchCancelled(ofTouchEventArgs & touch){
    
    
    
}



//--------------------------------------------------------------

void ofApp::lostFocus(){
    
    
    
}



//--------------------------------------------------------------

void ofApp::gotFocus(){
    
    
    
}



//--------------------------------------------------------------

void ofApp::gotMemoryWarning(){
    
    
    
}



//--------------------------------------------------------------

void ofApp::deviceOrientationChanged(int newOrientation){
    
    
    
}