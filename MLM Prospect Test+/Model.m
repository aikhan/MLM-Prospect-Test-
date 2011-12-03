//
//  Model.m
//  MLM Prospect Test+
//
//  Created by Asad Khan on 10/26/11.
//  Copyright (c) 2011 Semantic Notion Inc. All rights reserved.
//

#import "Model.h"

@implementation Model
static Model *sharedModel = nil;
@synthesize questions, authors;

+ (Model*)sharedModel{
	if(sharedModel == nil){
		sharedModel = [[super allocWithZone:NULL] init];
	}
	return sharedModel;
}

/*+ (id)allocWithZone:(NSZone *)zone{
	return [[self sharedModel] retain];
}
*/
- (id)copyWithZone:(NSZone *)zone{
	return self;
}
/*
- (id)retain{
	return self;
}

- (NSUInteger)retainCount{
	return NSUIntegerMax;
}
 

- (void)release{
	//do nothing
}
 
- (id)autorelease{
	return self;
}
*/
- (id) init{
	self = [super init];
	if(self !=nil){
		
	/*	questions = [[NSArray alloc] initWithObjects:@"Bicicletas", @"Payasos", @"Pulpos", @"Futbol", @"Casas", @"Tiempo", @"Gasolina", @"Dinero",
				 @"Astronautas", @"Surf", @"Hawaianas", @"Elecciones", @"Talante", @"Armas", @"Aliens", @"consolandores", @"Calculadoras",
				 @"Enanos de jardin", @"chocolate", @"Juguetes", @"Granos", @"Barba", @"Porno", @"Chicles", @"Norias", @"Vomitos", @"Cafe",
				 @"Tatuajes", @"Estupidos", @"Drogas", @"Fronteras", nil];
		
	*/
     self.questions = [[NSArray alloc] initWithObjects:@"Do you like telling people about new things?", 
                       @"Do you like selling?", 
                       @"Do you feel OK about making money when you recommend products to friends?", 
                       @"Have you ever done 100%% commission sales? (Only get paid when you make or refer a sale.) ",
                       @"Have you had success doing 100%% commission sales?",
                       @"Have you ever owned your own business?" ,
                       @"Have you ever done MLM (network marketing)?",
                       @"MLM is a 100%% commission business. You make money only if you make sales. Is that OK?",
                       @"Would you use the product if you weren’t selling it?",
                       @"Are you easily influenced by the opinions of close friends and relatives?",
                       @"Do you have confidence in yourself?", 
                       @"When you talk, do people tend to listen to you?", 
                       @"If people you care about say 'No' to you, will you want to quit?",
                       @"Do you like to tell others about things you like?",
                       @"Is making significant money in your MLM business really important to you?",
                       @"Is socializing with MLM friends important to you?",
                       @"“Money is such a small ambition, and sad really. [You] should want to build something, something that lasts.”\n -Steve Jobs",
                       @"“Wanting something is not enough. You must hunger for it. Your motivation must be absolutely compelling in order to overcome the obstacles that will invariably come your way.”\n -Les Brown",
                       @"“The greatest mistake you can  make in life is to continually be afraid you will make one.”\n -Elbert Hubbard",
                       @"“Do not go where the path may lead, go instead where there is no path and leave a trail.”\n -Ralph Waldo Emerson", 
                       @"“Two roads diverged in a wood, and I — I took the one less traveled by, and that has made all the difference.”\n -Robert Frost", 
                       @"\"Your time is limited, so don't waste it living someone else's life...Don't let the noise of others' opinions drown out your own inner voice. And most important, have the courage to follow your heart and intuition.\"\n -Steve Jobs", nil];
        self.authors = [[NSArray alloc]initWithObjects:@"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"Madonna", @"Einstein", @"Steve Jobs", @"Les Brown", @"Elbert Hubbard", @"Ralph Waldo Emerson", @"Robert Frost", @"Steve Jobs", nil];
		
	}
	return self;
	
}//en
@end
