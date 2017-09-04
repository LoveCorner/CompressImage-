//
//  ReduceImage.h
//  ISSP
//
//  Created by bjike on 16/9/13.
//  Copyright © 2016年 bjike. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ReduceImage : NSObject

+(NSData *)base64ImageThumbnaiWith:(UIImage *)image;

@end
