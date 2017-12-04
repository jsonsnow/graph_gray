//
//  graph_threshold.c
//  graph_gary_algorithm
//
//  Created by chen liang on 2017/11/30.
//  Copyright © 2017年 chen liang. All rights reserved.
//

#include "graph_threshold.h"
#include <stdlib.h>
#include <string.h>
#include "graph_util.h"

void graph_average_threshold(uint32_t *src,uint32_t **dest ,uint32_t width,uint32_t height) {
    if (src == NULL) {
        printf("erro input src,please check you src info");
        return;
    }
    float intensity = 0;
    int value;
    uint32_t *pixels = (uint32_t *)malloc(sizeof(uint32_t) * width * height);
    memcpy(pixels,src,sizeof(uint32_t) * width * height);
    for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
            uint32_t *currentPixels = pixels + (y * width) + x;
            uint32_t color = *currentPixels;
            uint32_t r_color,g_color,b_color,alpha;
            alpha = A(color);
            r_color = R(color);
            g_color = G(color);
            b_color = B(color);
            intensity = (r_color+ g_color + b_color) / 3. / 255.;
            value = intensity > 0.45?255:0;
            *currentPixels = RGBA(value, value, value, alpha);
        }
    }
    *dest = pixels;
}
