# User Items
---
**User Items** are special items that are to be added in a future release of the game. &nbsp;They are a range of 1000 items that can be used at the level designer's discretion with the hopes of enabling users to create incredible content packs. &nbsp;Currently, the only User Items that are even integrated into the game are User Blocks. &nbsp;As of the current release, (NSMBX v1.0 patch 2), User Items are not to be used and do not show up in the editor. &nbsp;This is intentional, as the system for storing User Blocks in a level file is destined to change. &nbsp;

###Format
---
Currently, the only supported User Items are **User Blocks**. &nbsp;User Blocks are defined under the exact same format as normal [blocks](blocks.html), with a few changes to storage format. &nbsp;All files associated with a particular User Block are written in a similar format to normal blocks. &nbsp;The only difference is the name of the files. &nbsp;The user blocks currently range from `block-1u` to `block-1000u`. &nbsp;Note the `u` after the block id. &nbsp;Currently, (and this is to be changed), User Block IDs are appended to the end of the basegame Block IDs. &nbsp;As there are 2000 basegame Block IDs, `block-1u` is treated internally as `block-2001`.

Please do not use User Items in any way until we work out a proper system for storing them.