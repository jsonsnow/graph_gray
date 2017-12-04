//
//  graph_gray.h
//  graph_gary_algorithm
//
//  Created by chen liang on 2017/11/27.
//  Copyright © 2017年 chen liang. All rights reserved.
//

#ifndef graph_gray_h
#define graph_gray_h
enum GrayType{
    GrayTypeVectorR,
    GrayTypeVectorG,
    GrayTypeVectorB,
    GrayTypeMax,
    GrayTypeAverage,
    GrayTypeWeight
};
#include <stdio.h>
void  grah_gary_process(uint32_t *src,uint32_t **dest,uint32_t width,uint32_t height,enum GrayType type);
#endif /* graph_gray_h */
