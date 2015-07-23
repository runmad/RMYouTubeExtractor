//
//  RMYouTubeExtractor.h
//  RMYouTubeExtractor
//
//  Created by Rune Madsen on 2014-04-26.
//  Copyright (c) 2014 The App Boutique. All rights reserved.
//

typedef NS_ENUM (NSUInteger, RMYouTubeExtractorAttemptType) {
	RMYouTubeExtractorAttemptTypeEmbedded = 0,
	RMYouTubeExtractorAttemptTypeDetailPage,
    RMYouTubeExtractorAttemptTypeVevo,
    RMYouTubeExtractorAttemptTypeBlank,
    RMYouTubeExtractorAttemptTypeError
};

typedef NS_ENUM (NSUInteger, RMYouTubeExtractorVideoQuality) {
	RMYouTubeExtractorVideoQualitySmall240  = 36,
	RMYouTubeExtractorVideoQualityMedium360 = 18,
	RMYouTubeExtractorVideoQualityHD720     = 22,
};

@interface RMYouTubeExtractor : NSObject

+(RMYouTubeExtractor*)sharedInstance;

-(void)extractVideoForIdentifier:(NSString*)videoIdentifier completion:(void (^)(NSDictionary *videoDictionary, NSError *error))completion;

-(NSArray*)preferredVideoQualities;

@end
