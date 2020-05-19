# Blocks Reference
---
**Blocks** are a type of item that makes up the terrain of a level.  &nbsp;These are the type of items that the player interacts with most often. &nbsp;As of New Super Mario Bros. X v1.0 (patch 1), there are unique 2000 block ids reserved for us developers. &nbsp;In addition to this, there are 1000 [User Blocks](user_blocks.html) for a level designer to call their own. &nbsp;As of **New Super Mario Bros. X 1.0 (patch 2)**, User Blocks are not to be used, and do not appear in the editor. &nbsp;The method that is used for storing User Blocks in level files is destined to change.

Blocks don't have to be square. &nbsp;A block will automatically resize to fit the graphic provided. &nbsp;You may also add your own config to change the appearance or behavior of all blocks of a specific id. &nbsp;A block graphic can be placed in the episode folder (where the level file is stored) or the level folder (a folder with the same filename as the level). &nbsp;**Block graphics** are to have the following filename: `block-n.png`. &nbsp;The `n` is the id of the block in question. &nbsp;For blocks with multiple frames, each frame is placed vertically in a column, with the first frame at the top and the last frame at the bottom.

**Block configuration** (block config) is a system where the appearance and behavior of a block can be modified. &nbsp;A block config file is a text file that describes how the block should look and act. &nbsp;It may be placed in the episode or level folders alongside the graphics (see above paragraph). &nbsp;A block configuration file must have the following filename: `block-n.txt`, where the `n` is the block id. &nbsp;There is a lot of configuration, so I dedicate the next section to configuration.

### Block Configuration
---
This section is dedicated to detailing what each and every configuration field does. &nbsp;Each line of a block configuration file is separated into two parts; A *key* (field) and a *value*. &nbsp;For example, if I want to make my block bouncy like a note block (![Note Block](img/noteblock.png "Note Block")), I would first find which config makes a block bouncy. &nbsp;The config *key* for bounciness is `bounce`. &nbsp;`bounce` is a *boolean* key, meaning it takes a value of *true* or *false*. &nbsp;I want my block to be bouncy, so I would write `bounce = true` under my `block-n.txt` 

If you want to see how a certain basegame block is configured, you can look under the  **config/block** folder in the root directory. &nbsp;It is important to note that the config files under the block config directory are to be used as a reference and should not be modified under any circumstance. &nbsp;Doing so may cause other episodes to not work correctly. &nbsp;These files affect how a block acts by default and are to be modified solely by developers. &nbsp;If you find an error in any of these files however, feel free to contact any of the developers of this game to fix this issue.

#### Config reference

---

<u>**Graphics**</u><br/>
`width` defines the width of the block. &nbsp;This is used to determine the size of the block when a block is spawned (from block hits to block creation).<br/>
*This takes an integer value (default 32)*.

`height` defines the height of the block. &nbsp;This is used to determine the size of the block when a block is spawned (from block hits to block creation).<br/>
*This takes an integer value (default 32)*.

`frames` defines how many animation frames the block has. &nbsp;Starting with the first frame at the top of the provided graphic, the displayed block frame is incremented until it hits this value, and repeats. &nbsp;The height of the graphic should be equal to `height` &times; `frames`.<br/>
*This takes an integer value (default 1)*.

`framespeed` defines how many frames pass until the next animation frame is displayed. &nbsp;Don't think of this value as a "speed" or "framerate". &nbsp;Think of this value as a *frame delay*; the *delay* (in frames) until the animation frame advances.<br/>
*This takes an integer value (default 8)*.

<u>**Interaction**</u><br/>
`passthrough` defines whether or not the block is solid. &nbsp;Passthrough blocks cannot be interacted with, but are still visible. &nbsp;These can be thought of as blocks in the background.<br/>
*This takes a boolean value (default false)*.<br/>
**Alias:** `pass-through`

`playerpassthrough` defines whether or not the block is solid to players. &nbsp;NPCs can still interact with these blocks.<br/>
*This takes a boolean value (default false)*.<br/>
**Alias:** `player-passthrough`

`npcpassthrough` defines whether or not the block is solid to NPCs. &nbsp;Players can still interact with these blocks.<br/>
*This takes a boolean value (default false)*.<br/>
**Alias:** `npc-passthrough`

`semisolid` defines whether or not the block is semisolid. &nbsp;A semisolid block can be jumped through the bottom or walked through the side, but can be stood on top. &nbsp;Clouds (![Cloud](img/cloud.png "Cloud")) are a good example of a semisolid block. &nbsp;*Sizable* blocks are semisolid by default, but can be forced to be solid by setting this value to *false*.<br/>
*This takes a boolean value (default false)*.<br/>
**Alias:** `semi-solid`

`sizable` defines whether a block is a sizable block. &nbsp;Sizable blocks can be resized in the editor to be any width or height. &nbsp;If you want to make a sizable block that isn't a multiple of 32&times;32 pixels, you may set the *width* and/or *height* properties to define how fine it may be resized. &nbsp;Sizable blocks are *semisolid* by default, but can be forced to be solid by setting `semisolid` to *false*. &nbsp;A graphic for a sizable block is thrice (three times) the normal size of a block. &nbsp;The graphic is divided into nine parts in a 3&times;3 grid. &nbsp;The corners will be the corners of the final graphic, the edges will be repeated to fill in the space between the corners, and the center will fill the rest of the space.<br/>
*This takes a boolean value (default false)*.

`connecting` defines whether a block visually connects to itself. &nbsp;Connecting blocks have a different graphical format than regular blocks. &nbsp;These blocks visually connect with neighboring blocks of the same id to look seamless. &nbsp;The current format can be divided into 5 sections, and further into 20 pieces. &nbsp;Each of the 5 sections are arranged vertically (much like animation frames) which all represent different "corner states". &nbsp;Starting from the top, the sections are labeled as follows: **fill**, **horizontal surface**, **vertical surface**, **outside corner**, and **inside corner**. &nbsp;Each of these are broken up into a 2&times;2 grid, with each representing a corner on the block. &nbsp;Based on the neighboring blocks of the same type, it pieces together these corners into the final graphic. &nbsp;Connecting blocks do not connect to blocks on a different layer. **Do not use this feature as of NSMBX v1.0 (patch 2), as the format may change.** &nbsp;See *block-742*, *block-743*, or *block-744* for graphical format examples. &nbsp;This behavior is often referred to as *autotiling*. &nbsp;Connecting blocks act similarly to how Super Mario Maker ground works.<br/>
*This takes a boolean value (default false)*.

`floorslope` defines the floor slope of a block. &nbsp;It takes in 3 possible values ranging from -1 to 1. &nbsp;A value of -1 defines a slope that goes from the bottom left corner of the block to the top right. &nbsp;A value of 1 defines a slope that goes from the top left corner of a block to the bottom right. &nbsp;A value of 0 defines no slope, or a standard block. &nbsp;The shape of a slope is a triangle that is resized to match the size of the block. &nbsp;The hypotenuse is always a diagonal to the bounding box of the block. &nbsp;A good way to remember which value is which is to consider what vertical direction a player would go if they move rightwards on it. &nbsp;If they go up, it's -1. &nbsp;If they go down, it's 1.<br/>
*This takes an integer value (default 0)*.<br/>
**Alias:** `floor-slope`

`ceilingslope` defines the ceiling slope of a block. &nbsp;It takes in 3 possible values ranging from -1 to 1. &nbsp;A value of -1 defines a slope that goes from the bottom left corner of the block to the top right. &nbsp;A value of 1 defines a slope that goes from the top left corner of a block to the bottom right. &nbsp;A value of 0 defines no slope, or a standard block. &nbsp;The shape of a slope is a triangle that is resized to match the size of the block. &nbsp;The hypotenuse is always a diagonal to the bounding box of the block. &nbsp;A good way to remember which value is which is to consider what vertical direction a player would go if they move rightwards on it. &nbsp;If they go up, it's -1. &nbsp;If they go down, it's 1.<br/>
*This takes an integer value (default 0)*.<br/>
**Alias:** `ceiling-slope`

<u>**Behavior**</u><br/>
`lava` defines whether the block acts like lava. &nbsp;If a block acts like lava, it will kill any NPCs or players that touch it. &nbsp;Invincibility is no use. &nbsp;Certain NPCs like rafts can ride along lava.<br/>
*This takes a boolean value (default false)*.

`kills` defines whether the block kills a player on contact.<br/>
*This takes a boolean value (default false)*.

`hurts` defines whether the block hurts a player on contact.<br/>
*This takes a boolean value (default false)*.

`pswitch` defines whether the block turns into a coin when a p-switch is hit. &nbsp;This is most often used by bricks.<br/>
*This takes a boolean value (default false)*.<br/>
**Alias:** `p-switch`

`bumpable` defines whether a block can be hit by the player or a thrown NPC. &nbsp;This is used by ?-blocks, switches, and any other blocks that a player should be able to bump. &nbsp;When this block is bumped, it will transform into the block id specified by the `transform` property.<br/>
*This takes a boolean value (default false)*.<br/>
**Alias:** `hitable`

`transform` defines what block id a bumped block will turn into if it has no items in it left.<br/>
*This takes an integer value (default 2)*.<br/>
**Alias:** `transform-onhit-into`

`smashable` defines whether or not a block can be smashed like a brick. &nbsp;It will transform into the effect id specified by `destroyeffect` if it is hit. &nbsp;A player with no powerup will only bump this block.<br/>
*This takes a boolean value (default false)*.

`destroyeffect` defines what effect id this block will transform into when it is destroyed. &nbsp;Currently, this also affects what sound the block will make when it is destroyed.<br/>
*This takes an integer value (default 1)*.<br/>
**Alias:** `destroy-effect`

`explodable` defines whether or not a block can be blown up by an explosion.<br/>
*This takes a boolean value (default false)*.

`hammer` defines whether or not a block can be destroyed by a player hammer. &nbsp;These blocks can also be destroyed using a tanooki suit as a statue.<br/>
*This takes a boolean value (default false)*.

`diggable` defines whether or not a block can be dug up by a player like in Super Mario Bros. 2. &nbsp;A diggable block can be removed by a player by standing on top of the block, holding the down key, and tapping the run key.<br/>
*This takes a boolean value (default false)*.

`bounce` defines whether or not a block is bouncy like a note block (![Note Block](img/noteblock.png "Note Block")). &nbsp;Players are launched upwards on contact with the top of a bouncy block, and can be launched higher by holding down the jump key. &nbsp;This releases the contents of the block. &nbsp;Bouncy blocks do not turn into a different block on hit. &nbsp;A player is also launched downwards faster if they hit the bottom of a bouncy block.<br/>
*This takes a boolean value (default false)*.

`bounceside` defines whether or not a block is bouncy on the sides. &nbsp;Players are launched sideways on contact with the side of this block, which releases the contents of the block. &nbsp;These blocks do not turn into a different block when hit from the side.<br/>
*This takes a boolean value (default false)*.<br/>
**Alias:** `bounce-side`
