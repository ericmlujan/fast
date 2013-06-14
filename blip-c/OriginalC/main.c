//
//  main.c
//  Balloon prediction
//
//  Created by Jake Lee on 7/18/12.
//  Copyright (c) 2012 Green Valley High School. All rights reserved.
//

#include <stdio.h>

float lat1;
float long1;
float alt1;
float tim1;
float lat2;
float long2;
float alt2;
float tim2;
float timA;
float altA;
float timB;
float altB;
float ratio;
float plat;
float plong;
float ptim;
float arate;
float drate;
float latd;
float longd;
int i=0;

int main()
{
    printf("time should be in UCT decimal format");
    printf("launch coordinates:");
    scanf("%f %f %f %f", lat1, long1, alt1, tim1);
    printf("burst coordinates:");
    scanf("%f %f %f %f", lat2, long2, alt2, tim2);
    printf("points a and b:");
    scanf("%f %f %f %f", timA, altA, timB, altB);
          
    arate = (alt2 - alt1) / (tim2 - tim1);
    drate = (altA - altB) / (timB - timA);
    ratio = arate / drate;
    latd = lat2 - lat1;
    longd = long2 - long1;
    plat = (latd * ratio) + lat2;
    plong = longd * ratio +long2;
    ptim = (alt2 - alt1) / drate;
        
    printf("Latitude=%f, Longitude=%f, Time=%f UTC", plat, plong, ptim);
    printf("arate=%f, drate=%f, ratio=%f, latd=%f, longd=%f", arate, drate, ratio, latd, longd);
}