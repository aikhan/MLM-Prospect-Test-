//
//  NSDictionary+ReplaceNull.m
//  Chefs Pantry
//
//  Created by Asad Khan on 12/6/10.
//  Copyright 2010 Semantic Notion Inc. All rights reserved.
//

#import "NSDictionary+ReplaceNull.h"
#import "NSArray+ReplaceNull.h"

@implementation NSDictionary (NSDictionary_ReplaceNull)


- (NSMutableDictionary *)replaceNullWithNilInDictionary
{
	NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithDictionary:self];
	
	NSArray *keys = [dictionary allKeys];
	
	for(id keyName in keys)
	{
		id valueForKey = [dictionary valueForKey:keyName];
		
		if ([valueForKey isKindOfClass:[NSNull class]]) 
		{
			[dictionary setValue:nil forKey:keyName];
		}
		else if([valueForKey isKindOfClass:[NSDictionary class]])
		{
			[dictionary setObject:[(NSDictionary *)valueForKey replaceNullWithNilInDictionary] forKey:keyName];
		}
		else if([valueForKey isKindOfClass:[NSArray class]])
		{
			[dictionary setObject:[(NSArray *)valueForKey replaceNullWithNilInDictionary] forKey:keyName];
		}
	}
	
	return dictionary;
}



@end