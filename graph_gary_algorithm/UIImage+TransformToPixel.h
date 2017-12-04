//
//  UIImage+TransformToPixel.h
//  graph_gary_algorithm
//
//  Created by chen liang on 2017/12/1.
//  Copyright © 2017年 chen liang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (TransformToPixel)

- (uint32_t *)imageToPixelData;
+ (UIImage *)pixelToImageData:(uint32_t *)pixels width:(size_t)width height:(size_t)height;
@end
