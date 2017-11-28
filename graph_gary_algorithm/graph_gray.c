//
//  graph_gray.c
//  graph_gary_algorithm
//
//  Created by chen liang on 2017/11/27.
//  Copyright © 2017年 chen liang. All rights reserved.
//
#define red_left_value 0.299
#define green_left_value 0.578
#define blue_left_value 0.114
#define MaskB(x) ((x) & 0xFF)
#define R(x) (MaskB(x))
#define G(x) (MaskB(x >> 8))
#define B(x) (MaskB(x >> 16))
#define A(x) (MaskB(x >> 24))
#define RGBA(r,g,b,a) (MaskB(r) | MaskB(g)<<8 | MaskB(b) << 16 | MaskB(a) << 24)
#include "graph_gray.h"
#include <stdlib.h>
static  uint32_t grayValue(uint32_t r,uint32_t g,uint32_t b,enum GrayType type) {
    uint32_t result = 0;
    switch (type) {
        case GrayTypeMax:{
            uint32_t max = r;
            if (r < g) {
                max = g;
            }
            if (g < b) {
                max = b;
            }
            result = max;
        }break;
        case GrayTypeAverage:
            result = (r + b + g)/3;
            break;
        case GrayTypeWeight:
            result = red_left_value * r + green_left_value * g + blue_left_value *b;
            break;
        case GrayTypeVectorB:
            result = b;
            break;
        case GrayTypeVectorG:
            result = g;
            break;
        case GrayTypeVectorR:
            result = r;
            break;
        default:
            break;
    }
    return result;
}
void grah_gary_process(uint32_t *src,uint32_t width,uint32_t height,enum GrayType type) {
    if (src == NULL) {
        printf("erro input src,please check you src info");
        return ;
    }
    for (int i = 0; i < height; i++) {
        for (int j = 0 ; j < width; j++) {
            uint32_t *currentPixels = src + (i * width) + j;
            uint32_t color = *currentPixels;
            uint32_t r_color,g_color,b_color,alpha;
            alpha = A(color);
            r_color = R(color);
            g_color = G(color);
            b_color = B(color);
            uint32_t gray  = grayValue(r_color, g_color, b_color, type);
            *currentPixels = RGBA(gray, gray, gray, alpha);
        }
    }
}


