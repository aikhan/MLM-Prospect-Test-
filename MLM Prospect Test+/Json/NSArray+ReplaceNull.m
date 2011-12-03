//
//  NSArray+ReplaceNull.m
//  Chefs Pantry
//
//  Created by Asad Khan on 12/6/10.
//  Copyright 2010 Semantic Notion Inc. All rights reserved.
//

#import "NSArray+ReplaceNull.h"
#import "NSDictionary+ReplaceNull.h"

@implementation NSArray (NSArray_ReplaceNull)


- (NSMutableArray *)replaceNullWithNilInDictionary
{
	
	NSMutableArray *array = [NSMutableArray arrayWithArray:self];
	
	for(int i=0; i<[array count]; i++)
	{
		id objectInArray = [array objectAtIndex:i];
		
		if([objectInArray isKindOfClass:[NSDictionary class]])
		{
			NSMutableDictionary *dictionary = [(NSDictionary *)objectInArray replaceNullWithNilInDictionary];
			[array replaceObjectAtIndex:i withObject:dictionary];
		}
		else if([objectInArray isKindOfClass:[NSArray class]])
		{
			NSMutableArray *newArray = [(NSArray *)objectInArray replaceNullWithNilInDictionary];
			[array replaceObjectAtIndex:i withObject:newArray];
		}
	}
	
	
	return array;
}



@end