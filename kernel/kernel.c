//#include <stdio.h>


void main(){
    // video memory top-left corner of the screen
    char* video_mem = (char*) 0xb8000;

    *video_mem = 'X';
}