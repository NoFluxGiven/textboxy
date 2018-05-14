#region Common config options you may want to modifiy

/* Appearance */
// Options concerning sprites,
// dimensions, animation speed and
// fonts
#macro tbyTextboxSprite         sprTextbox
#macro tbyPauseSprite           sprTextboxPause //origin should be the end point
#macro tbyPauseSpriteSpeed      0.04
#macro tbyBubbleSprite          sprTextboxBubble
#macro tbyTileSize              8
#macro tbyDrawPauseSymbol       true
#macro tbyDefaultFont           fontDefault

/* Technical */
// Options concerning functionality
// of technical features
#macro tbyDefaultMaxWidth       200
#macro tbyDefaultLineAmount     4
#macro tbyDefaultWaitEachChar   4 //in steps
#macro tbyWaitPerWaitChar       (room_speed/4) //how many steps to wait per . character
#macro tbyBoxBottomMargin		0

//If this expression is true, it counts as having advanced the message
#macro tbyInputKey              (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter))

/* Audio */
// Options concerning audio
#macro tbyPlaySpeechSound       true
#macro tbySpeechSound           sndSpeechDefault
#macro tbySpeechPitchChange     random_range(0.8, 1.2)
#macro tbySpeechIteration       3 //play sound every x characters
#macro tbyPlayConfirmSound      true
#macro tbyConfirmSound          sndMsgConfirm

#endregion


#region Not so common options, only change if you know what you are doing

#macro tbyManagerObject         tbyTextboxManager
#macro tbyTextObject            tbyText
// Change this if you have a dedicated layer for manager objects
#macro tbyCreateManagerSnippet  instance_create_depth(0, 0, -10000, tbyTextboxManager)
#macro tbyCreateTextSnippet     instance_create_depth(0, 0, -10001, tbyText) //needs to be higher than the manager

// These should all be one character only
// The format for the defaults is [control_code/additional_data], e.g. [c/red]
#macro tbyControlCodeOpening    "["
#macro tbyControlCodeClosing    "]"
#macro tbyControlCodeDelimiter  "/" 

#macro tbyDefaultColor          c_white
#macro tbyColorNames [ "white", c_white, "red", c_red, "orange", c_orange, "yellow", c_yellow, "green", c_green, "aqua", c_aqua, "blue", c_blue, "purple", c_purple]

enum TbyAction {
	SetSpeaker  = tbyActionSetSpeaker,
	SetMaxWidth = tbyActionSetMaxWidth,
	SetMaxLines = tbyActionSetMaxLines,
	SetOrigin   = tbyActionSetOrigin,
	SetPosition = tbyActionSetPosition,
	ShowString  = tbyActionShowString,
	SetSpeed	= tbyActionSetSpeed,
	SetPause	= tbyActionSetPause,
	SetFont		= tbyActionSetFont
}

/*
Every string index has a control code payload.
They take the following form:
+----------+---+---+---+---+---+---+---+
|++++++++++| T | e | s | t | i | n | g |
+----------+---+---+---+---+---+---+---+
|Color     | 1 | 1 | 1 | 1 | 2 | 2 | 2 |
+----------+---+---+---+---+---+---+---+
|WaitFrames| 0 | 0 | 0 | 0 | 0 | 0 | 3 |
+----------+---+---+---+---+---+---+---+
|Jittery?  | f | f | t | t | t | t | t |
+----------+---+---+---+---+---+---+---+
|...       |   |   |   |   |   |   |   |
+----------+---+---+---+---+---+---+---+
*/

enum TbyCode {
	Reset, //this needs to be on 0 position
	Color,
	Wait,
	Jittery,
	Skip,
	
	_SIZE
}

// They keys should all be ony character only
#macro tbyControlIdentifiers ["r", TbyCode.Reset, "c", TbyCode.Color, ".", TbyCode.Wait, "j", TbyCode.Jittery, "^", TbyCode.Skip]

#endregion


#region There should be no reason to change these

enum TbySliceIndex {
	TopLeft, TopMiddle, TopRight,
	MiddleLeft, Middle, MiddleRight,
	BottomLeft, BottomMiddle, BottomRight
}

//Indices for the positionUpdate data
enum TbyPositionUpdate {
	Type,
	X,
	Y
}

//Types of the positionUpdate data
enum TbyPositionUpdateType {
	TopLeft,
	Origin
}

/*  Helper stuff */
#macro tbySingleton             if (instance_number(object_index)>1) {instance_destroy();}

//Only to be used in the tbyTextboxManager object
#macro tbyManagerSetup          event_user(0)
#macro tbyManagerStart          event_user(1)
#macro tbyManagerNextAction     event_user(2)

//Only to be used in the tbyText object
#macro tbyTextStart             event_user(0)

#endregion