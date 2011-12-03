//
//  Question.h
//  MLM Prospect Test+
//
//  Created by Asad Khan on 10/26/11.
//  Copyright (c) 2011 Semantic Notion Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject{
    NSString *question;
    NSString *author;
    int answer;
}
@property (nonatomic, strong) NSString *question;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, assign) int answer;
@end
