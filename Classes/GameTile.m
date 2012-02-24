//
//  GameTile.m
//  Skeleton Key HD
//
//  Created by micah on 1/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameTile.h"
#import "GameData.h"
#import "SkeletonKeyHDAppDelegate.h"

@implementation GameTile

@synthesize x;
@synthesize y;
@synthesize tileType;

+ (id) tileWithType:(int)tileType andX:(int)x andY:(int)y {
	NSString* textureName;
	if(tileType >= GameTileSolid4Sides && tileType <= GameTileSolid0Sides) {
		GameData* gameData = ((SkeletonKeyHDAppDelegate*)([UIApplication sharedApplication].delegate)).gameData;
		switch(gameData.stage) {
			case GameStageForest: textureName = @"game_tiles_forest.png"; break;
			case GameStageCaves: textureName = @"game_tiles_caves.png"; break;
			case GameStageBeach: textureName = @"game_tiles_beach.png"; break;
			case GameStageShip: textureName = @"game_tiles_ship.png"; break;
		}
	} else {
		textureName = @"game_tiles_objects.png";
	}
	GameTile* tile = [GameTile spriteWithFile:textureName];
	[tile changeType:tileType];
	[tile changePositionX:x andY:y];
    tile.scale = 1.02;
	return tile;
}

- (void) changeType:(int)_tileType {
	tileType = _tileType;
	CGRect rect;
	switch(tileType) {
		case GameTileSolid4Sides:		rect = CGRectMake(  0,   0, 110, 110);	break;
		case GameTileSolid3SidesTRB:	rect = CGRectMake(110,   0, 110, 110);	break;
		case GameTileSolid3SidesTRL:	rect = CGRectMake(220,   0, 110, 110);	break;
		case GameTileSolid3SidesTLB:	rect = CGRectMake(330,   0, 110, 110);	break;
		case GameTileSolid3SidesRBL:	rect = CGRectMake(440,   0, 110, 110);	break;
		case GameTileSolid2SidesTR:		rect = CGRectMake(550,   0, 110, 110);	break;
		case GameTileSolid2SidesTB:		rect = CGRectMake(660,   0, 110, 110);	break;
		case GameTileSolid2SidesTL:		rect = CGRectMake(770,   0, 110, 110);	break;
		case GameTileSolid2SidesRB:		rect = CGRectMake(  0, 111, 110, 110);	break;
		case GameTileSolid2SidesRL:		rect = CGRectMake(110, 111, 110, 110);	break;
		case GameTileSolid2SidesBL:		rect = CGRectMake(220, 111, 110, 110);	break;
		case GameTileSolid1SidesT:		rect = CGRectMake(330, 111, 110, 110);	break;
		case GameTileSolid1SidesR:		rect = CGRectMake(440, 111, 110, 110);	break;
		case GameTileSolid1SidesB:		rect = CGRectMake(550, 111, 110, 110);	break;
		case GameTileSolid1SidesL:		rect = CGRectMake(660, 111, 110, 110);	break;
		case GameTileSolid0Sides:		rect = CGRectMake(770, 111, 110, 110);	break;
		case GameTileKey:				rect = CGRectMake(  0,   0, 110, 110);	break;
		case GameTileChest:				rect = CGRectMake(110,   0, 110, 110);	break;
		case GameTileChestOpen:			rect = CGRectMake(220,   0, 110, 110);	break;
		case GameTileSwitch:			rect = CGRectMake(330,   0, 110, 110);	break;
		case GameTileDoorLRClosed:		rect = CGRectMake(440,   0, 110, 110);	break;
		case GameTileDoorLROpen:		rect = CGRectMake(550,   0, 110, 110);	break;
		case GameTileDoorTBClosed:		rect = CGRectMake(660,   0, 110, 110);	break;
		case GameTileDoorTBOpen:		rect = CGRectMake(770,   0, 110, 110);	break;
	}
	[self setTextureRect:rect];
}

- (void) changePositionX:(int)_x andY:(int)_y {
	x = _x;
	y = _y;
	self.position = ccp(109+(110*x), 79+(110*(7-y)));
}

@end
