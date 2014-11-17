/* 
 * File:   main.cpp
 * Author: rcc
 *
 * Created on November 17, 2014, 12:59 PM
 */

#include <cstdlib>
#include<iostream>
#include<iomanip>

using namespace std;

/*
 * 
 */

   
    void divMod(int&,int&,int&);
    void scaleLeft(int&,int&,int&);
    void addSub(int&,int&,int&,int&);
    void scaleRight(int&,int&,int&);
    
     
 int main(int argc, char** argv) { 
     cout<<"input the temperature in F (32,212)"<<endl;
     int temF;
     cin>>temF;    
     int den=9, num=(temF-32)*5,result;
     divMod(den,result,num);     
     cout<<"The temperature in C is "<<result; 
     return 0;
     }     
 
 void scaleLeft(int &r1,int &r3,int &r2){ 
 	do{               //Scale left till overshoot with remainder 
 		r3<<=1;   //scale factor 
 		r2<<=1;   //subtraction factor 
 	}while(r1>=r2);   //End loop at overshoot 
 	r3>>=1;           //Scale factor back 
 	r2>>=1;           //Scale subtraction factor back 
 } 

 void scaleRight(int &r1,int &r3,int &r2){ 
 	do{               //Shift right until just under the remainder 
 		r3>>=1;   //Division counter 
 		r2>>=1;   //Mod/Remainder subtraction 
 	}while(r1<r2);    //Compare remainder with subtraction factor 
 } 
 
 void addSub(int &r3,int &r2,int &r0,int &r1){ 
 	do{                          //Just a loop 
 		r0+=r3;              //Count the subtracted scale factor 
 		r1-=r2;              //Subtract the scaled mod 
 		scaleRight(r1,r3,r2);//Keep scaling right until < remainder 
 	}while(r3>=1);                //Loop until division is complete 
 }
  
 void divMod(int &r2,int &r0,int &r1){ 
 	//Determine the quotient and remainder 
 	r0=0; 
 	int r3=1; 
 	if(r1>=r2){//Compare and exit if a<b when a%b 
 		scaleLeft(r1,r3,r2); 
 		addSub(r3,r2,r0,r1); 
 	} 
 } 

