//
//  graph_util.h
//  graph_gary_algorithm
//
//  Created by chen liang on 2017/12/1.
//  Copyright © 2017年 chen liang. All rights reserved.
//

#ifndef graph_util_h
#define graph_util_h

#define MaskB(x) ((x) & 0xFF)
#define R(x) (MaskB(x))
#define G(x) (MaskB(x >> 8))
#define B(x) (MaskB(x >> 16))
#define A(x) (MaskB(x >> 24))
#define RGBA(r,g,b,a) (MaskB(r) | MaskB(g)<<8 | MaskB(b) << 16 | MaskB(a) << 24)

#endif /* graph_util_h */
