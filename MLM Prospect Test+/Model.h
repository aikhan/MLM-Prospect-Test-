//
//  Model.h
//  MLM Prospect Test+
//
//  Created by Asad Khan on 10/26/11.
//  Copyright (c) 2011 Semantic Notion Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"
@interface Model : NSObject{
    NSArray *questions;
    NSArray *authors;
}
@property (nonatomic, strong) NSArray *questions;
@property (nonatomic, strong) NSArray *authors;
+ (Model *)sharedModel;
@end
