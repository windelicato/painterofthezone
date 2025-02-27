# PAINTER OF THE ZONE

#  >>> [РУССКИЙ](https://github.com/windelicato/painterofthezone/blob/main/README.ru.md) <<<

Highly configurable combat enhancement overhaul for S.T.A.L.K.E.R. G.A.M.M.A. with extensive MCM configuration

# FEATURES

### High resolution wallmark textures with parallax and material support

### Extensive MCM options to enable, disable, or tweak everything possible

### Enhancements to engine wallmarks
- When no walls are nearby places blood marks on the floor
- 16+ additional wallmark variations
- Blood pool under target on death

### Enhancements to engine hit fx particles
- Reworked all on hit particle fx
- Reactive particle system with hit fx that display feedback based on:
    - Target's armor (exo, medium-heavy armor, glass helmets, cloth armor)
    - Player's armor piercing ability calculated from bullet, weapon, and targets armor
    - Body part hit by the shot (headshot, bodyshot)
    - One-hit kill potential (massive fx on one hit headshots)

### Dismemberment
- Reworked @xcvb's mod to not spawn meshes and have a lower footprint
- Option to use a body wallmark instead of removing limbs to indicate massive hits
- Option to place blood splashes and wound textures on walls around dismemberment

### Bullet Time
- Slows down time for 2s after landing a powerful headshot to highlight visual fx
- Time can be extended by landing multiple consecutive headshots
- Rewards player for accuracy by making it easy to land follow up shots

### камера убийства / Kill cam
- Slow motion kill cam that moves the camera to the target's location on kill
- Many options for triggering to make it rewarding:
    - Only when current weapon does way more damage than necessary for a kill
    - Only when target is very far away
    - Only when target is last enemy in area
    - Only when bullet time is extended a certain number of times

### Safety features
- Avoided any actor_on_update unless user has timescale smoothing enabled
- All time critical or spammable callbacks are tick delayed (ie shotgun hit callbacks)
- Destruction of any temporary storage objects on save / load
- No spawning of game objects or meshes to keep track or remove in case of uninstall


# AVAILABLE MCM SETTINGS

### Wallmarks
- Enable / disable wallmark enhancements
- Enable / disable pools on death
- Option to keep engine wallmark size
- Option to make all wallmarks the same size
- Enable / disable extra wallmarks around point of dismemberment
- Option to set distance from dismemberment for wallmarks
- Option to set number of extra wallmarks
    - First 3 wallmarks will always include a blood splash, upscaled wound texture, and blood drips
- Options to pick from 3 categories of wallmark style:
    - Normal: bullet hole bloodmarks with trails
    - Drip: drips like those from bleeding player
    - Splash: larger splashes of blood
- Option to check for nearby walls before placing
- Option to delay wallmark placement when multiple hits are landed in short succession
- TTL for wallmarks
- Option to set gravity for floor wallmarks. Higher brings them closer to target

### Particles
- Enable / disable particle enhancements
- Enable / disable reactive particle system
- Enable / disable particle on hit
- Enable / disable trailing cloud of dust and blood on hit
- Option to pick direction of blood cloud
- Option to set size of blood cloud
- Enable / disable particle on headshot
- Enable / disable particle on headshot kill over dismemberment threshold
- Options to play all of these particles per shot or just one
- Enable / disable limiting to one of each particle at a time
- Option to set TTL for each particle before replacing

### Dismemberment
- Enable / disable for stalkers
- Enable / disable for mutants
- Enable / disable for heads only
- Enable / disable body wallmark instead of limb removal
- Options for hit threshold for stalkers and mutants

### Bullet time
- Enable / disable bullet time
- Option to choose how much time is slowed down
- Option to choose how long bullet time will last
- Option to enable sound on activation / deactivation
- Option to enable screen overlay effects during bullet time
- Enable / disable time changes gradually instead of instantly (disable for actor_on_update-less)
    - Option to set how gradual the time changes
- Trigger options:
    - Uses dismemberment threshold with dismemberment enabled
    - Option to set flat chance to trigger on headshot kill

### камера убийства / Killcam
- Enable / disable killcam
- Option to choose how much time is slowed down
- Option to choose how long killcam will last
- Option to choose how far away the camera is from target
- Enable / disable time changes gradually instead of instantly (disable for actor_on_update-less)
    - Option to set how gradual the time changes
- Trigger options:
    - Option to trigger when target is a certain distance from player
    - Option to trigger only when no other enemies are fighting the player in a certain distance
    - Option to trigger only when bullet time has been extended a certain number of times

# CREDITS

- @xcvb_ for their Long Range Blood Decals and Dismemberment mods I used as a basis for this
- Bullet time was ported from BULLET TIME by exDeMODER (https://www.moddb.com/members/exdemoder)
- Some particles modified from HFX by Death Orchird (https://www.moddb.com/mods/stalker-anomaly/addons/hollywoodfx3)
- @0scoar for help formatting textures in XRay
- @Kaiser for painful help with translation

# DEPENDENCIES FOR NON-GAMMA INSTALLS
- Modified EXEs from themrdemonized https://github.com/themrdemonized/xray-monolith
- Wepl Hit Effects for feedback based particles https://www.moddb.com/mods/call-of-chernobyl/addons/wepls-hit-effects
- grok_bo or Artigrok BO for feedback armor based particles https://github.com/ilrathCXV/ArtiGrok-Ballistics-GAMMA-ilrath-Mo3

# COMPATABILITY WITH OTHER MODS
- Not fully tested with HD models or KVMAS. Base functionality works but I haven't tested everything
- Hit calculations for dismemberment / hit particles may differ using Arti's Special Ammo or any other mod that touches hit power

# TODO

### Textures

* [x] Remake textures they've been artifacted by re*exporting
* [x] Fix bump and height maps
* [x] Remove 8k textures
* [x] Downscale to 1k, 2k, and 4k
* [x] Create better wound textures
* [ ] Create better pool textures

### Particles
* [ ] Clean up unused .pe's in particles/
* [ ] Clone all effects with 50% less particles (script it with find/replace)
* [x] Add option to use 9 blood / 1 smoke for no armor instead of all red

### Killcam
* [ ] Option to slowly pan camera between two points
* [ ] Randomize camera yaw and roll
* [ ] Investigate possibility of predicting a shot will kill and following bullet behind camera

### Dismemberment
* [ ] Rework code and recreate objects
* [ ] Investigate if we can just pull the info we need from .ltx
* [x] Delay body wallmark
* [x] Place wound wallmarks on walls near point of dismemberment
* [ ] Go through and recheck all the mutant bones

### General
* [ ] Update grok_bo PR with new ideas
* [ ] Check performance on lower end systems
* [ ] Unregister unenabled callbacks
* [ ] Base Anomaly support
* [ ] Remove all references to "short range blood decals" in:
    * [ ] Code
    * [ ] Textures
    * [ ] Particles
    * [ ] LTX


# CHANGELOG

# 1.2.5
- Support base Anomaly
    - Dependencies:
        - WEPL Hit Effects
        - MCM Mod Configuration Menu
        - Screen Space Shaders v20+
    - Notes:
        - For dismemberment, recommended you lower "HIT THRESHOLD FOR STALKERS" to 1 in MCM > Painter of the Zone > Dismemberment

# 1.2.4a
- Fix mutant hits showing armor dust clouds
- Fix hit exclusive not playing on dead npcs
- Respect cloud max size when armor feedback is disabled

# 1.2.4
- Particle updates:
    - Blood dust cloud fingers vary in size to reflects current shot hit power
    - Blood dust cloud fingers now react in size and color against all enemies (only armored and exo before)
    - Added MCM values for minimum and maximum size of cloud particles
        - Set both minimum and maximum to 10 if you want things to stay the same
    - Tweaked a few dismemberment particles to not fade so quickly
    - Removed slow blood drop particle from flesh wound animation
- Dismemberment updates:
    - Placement of body wound mark more consistent
    - Extra particle effects play at the point of impact when dismemberment creates a new wallmark to simulate impact
- General updates:
    - Fixed edge case where certain mods inflict hits to npcs but not a specific bone (surrender)

# 1.2.3

- Texture updates:
    - Replaced 8k textures with 1k, 2k, and optional seperate 8k
    - Added bumps and fixed reflections
    - First pass at wound texture upgrade
    - Thanks @Oscoar for dealing with me this week
    - Fixed LTX for blood drops

- Dismemberment updates:
    - Option in MCM to place more wallmarks around point of dismemberment
    - Much better wallmark placement on head when "Allow removal of bones" is disabled

- Slowmo / камера убийства / Kill cam updates:
    - Much better safe camera detection. Let me know if kill camera is behind a wall
    - Cache wall positions around dismemberment so that we never have to recalculate
    - Better handling of resetting camera / timescale when game is reloaded in the middle of an event

- Particle updates:
    - Fixed weird dismemberment brain bits not destroying on contact
        - I reinstalled GAMMA and this wasn't happening on my old install. Very sorry to anyone who had to look at those
    - Stopped extra blood finger particles from playing during dismemberment

- Performance updates:
    - Cached lookups to GBO hit_power so that we only have to calculate it once

- General updates:
    - Moved installation instructions and MCM documentation to github
    - убить камера doesn't mean камера убийства (thanks @kaiser)
    - Updated defaults


# 1.2.2
- MCM moved from "Blood wallmarks" to "Painter of the zone"

- Particle updates:
    - Removed particle hitfx against walls floors and muzzle flashes.
        - If you anyone still wants them I'll include them with a FOMOD install
        - For now just install HFX
    - Smoke cloud fingers against armored targets are a blend of white and red clouds
        - The higher the penetration of your current shot, the more red the cloud
        - At low penetration cloud is mostly white
        - At high penetration cloud is mostly red
    - Added two new varations of armor hit effects
    - Toned down headshot effects vs armor and glass (big kill particles unchanged)
    - Even better handling of shotgun blasts to avoid spawning too many particles
        - Last update I went a little too tame on the defaults :(
    - Particles against dead NPCs are very bloody again so you can make a mess

- Killcam updates:
    - Seperated kill cam settings into their own section
    - Kill cam can be enabled independantly from bullet time


# 1.2.1

- Added slow motion killcam like Fallout
 	- Raytraces around target to find safe camera angle
 	- By default this triggers on headshot kills from powerful ammo
     - Other trigger options available in MCM
         - Trigger only when victim is a certain distance away
         - Trigger only when no nearby enemies / mutants are engaged with player
         - Or make it a little game. Trigger after more than one cosecutive headshot kills during one bullet time
 
- Added 8K wallmark textures
     - 6 new blood drips and blood drops
     - 8 new splash wallmarks
     - Wallmarks now respect SSS parameters and are much more reflective
         - For darker wallmarks, use `ssfx_blood_decals (0.6,0.6,0,0)`
         - For brighter wallmarks, use `ssfx_blood_decals (1,1,0,0)`
     - Upscaled better blood decal wound textures to 1024x1024. Used for dismemberment mostly
     - Added timer to prevent drawing multiple decals from one shotgun blast
     - Please disable Realistic Blood HQ Redone unless the 8k scares you
     - I'll add a FOMOD with some lower res options when I'm happy with these and I get around to it
 
- New particles
     - 2 new big dismemberment particle animations. They are picked randomly from the 3 available
         - These don't require dismemberment being enabled
     - Added lingering blood smoke dust finger particles
         - 3 options for direction
     - Added new hit feedback particles based on victim's armor
         - Glass shards on headshots against glass facemasks
         - Armor shards on headshots against heavy helmets
         - Armor shards on body shots against thick armor
         - Metal sparks on body shots against EXO armor
         - Smoke finger particles change to dust fingers against heavy armor
     - Added timer to prevent overlapping particles from shotguns or high RPM weapons
     - Ported hit fx from the new HFX for much better muzzle flash, smoke, and shots against materials
         - No need to use a seperate HFX patch anymore
     - I now overwrite default GAMMA hit particles with empty ones
     - Removed option to use CVFX
 
- Bullet time updates
     - Rewrote most of the code to help with smoother transitions
     - Added MCM options for smooth transitions. Turned off by default to avoid DJ record scratching affect on game audio
     - Bullet time start/stop sound should now properly trigger (but they still suck)
     - Fixed bugs with extremely low and high lengths of bullet time not turning off properly
 
- Dismemberment updates
     - Added an alternative to dismemberment that covers the bone in a large wound wallmark
         - Turn off "Allow limb removal" in MCM
     - Still looks bad on mutants. Might just leave this at heads or do rewrite later
 
- Other fixes
     - Fixed Russian MCM localization (hopefully) for the last time
     - Cleaned up MCM to make things easier to find and hide some of the more confusing options from users
         - Most of the more advanced settings will go away eventually. I'm still tweaking the defaults and these are useful


# 1.1.2
- Fixed weird case where we beat grok_bo to calculation.
    - The GAMMA damage calculation essentially erases hit values so this is a workaround to avoid monkeypatching grok_bo
    - See https://github.com/Grokitach/Stalker_GAMMA/pull/290 and tell grok to share his numbers with us!!!
- Fixed Russian localization still encoded in UTF-8 

# 1.1.1
- Remove extra crab mutants from water

# 1.1.0
- Add particle based dismemberment that supports grok_bo
    - Partial port of xcvb's dismemberment to GAMMA
    - Does not spawn meshes / chunks. Uses particle engine instead.
    - Respects GAMMA's armor pen and hit power calculations so dismemberment should be much more rare
- Lots of new particles added after learning how to use the particle editor
    - Headshot dismemberment particle
    - Glass particles on glass helmet kills
    - Armor particles on armor helmet kills
    - Cloth / skin particles on everything else
    - Extra blood smoke finger trails on hits
    - and more!!!
- Bullet time now procs on dismemberment threshold instead of every headshot when both are enabled
- Fixed all issues relating to events not triggering in order (using demonized on_before_hit_after_calcs)
    - Bullet time wasn't always triggering
    - Bullet time was triggering on dead bodies
    - Floor wallmarks weren't always appearing on kill
- Tons of new MCM configuration options
- LTX with my wallmark settings
- Added lots of safety checks for usual busyhands / other engine bug avoidance:
    - Currently the only actor_on_update is used with bullet time and wrapped in grok_delays
    - No spawning of game objects like the original dismemberment
    - Destruction of all mod temporary variable storage on save / load
    - Particles are spawned in a circular buffer and checked for destruction on every new particle spawn
    - Wrapped time critical function calls with demonized EXE nextTick
    - Replaced all on_before_hit with demonized EXE on_before_hit_after_calcs to avoid any timing collisions with other mods
- Russian translation for MCM
    - Просто гугл-переводчик. Пожалуйста, сообщите о плохом переводе.

# 1.0.5c
- Fixed timing issues when NPC died before on_hit callback completed. If you notice missing pools or no bullet time after a one hit kill, up "tick delay" in MCM > Blood Wallmarks > General
- No longer requires debug mode for bullet time

# 1.0.5b
- Place extra checks to avoid triggering on npc vs npc kills

# 1.0.5a
- Separated MCM menus
- Added option to configure chance to trigger bullettime in MCM

# 1.0.5
- Added optional "bullet time" that triggers when you get a headshot kill
- Bullet time is extended on each consecutive headshot kill
- Unfortunately requires debug mode on
- Added MCM options for bullet time

# 1.0.4
- Edited particles and moved the ones we are using into this mod
- Added particle buffer to prevent overwriting eachother
- Clean out tables on save/load to prevent memory increase
- Added optional headshot particle for monkeypatching
- Added MCM options for buffer size, wallmark tracing, particle choices for custom vfx overrides
- Updated suggestions for monkeypatch and particle rate

# 1.0.3
- Cleaned up optional extra particles on hit to be nice and visible :) Enable in MCM
- Added grok_bo monkeypatch recommendation/suggestion in pins^^^

# 1.0.2
  - Enabled for mutants
  - Try and handle pools overlapping with floormarks better. Might have to delay floormark display until grok_bo is done
  - No longer shows floormark when engine displays wallmark (ray traced 5m, some mods might show wallmarks further). Should fix double decals when npc is in a corner
  - Removed debug file accidently placed in last release D:

# 1.0.1
  - Renamed dltx files and sections to avoid any load order requirements

# 1.0
  - Initial release

# Condensed for Discord (ignore)

# Painter of the zone (previously short range blood decals)
ANY OF THIS CAN BE DISABLED IN MCM 
- 8k, 2k, or 1k blood wallmark textures
- Short range bloodstains on the ground when NPCs are hit but no walls are nearby
- Adds back static blood pools but without the resizing or footsteps to avoid busyhands (disabled by default)
- New on hit particles like glass particles for glass helmets, heads exploding, bloody finger clouds, armor chunks
- Bullet time. Temporarily slows down in game time when you kill an NPC with a headshot
- Slowmo killcam like Fallout VATS with lots of options for triggering
- Dismemberment using particles instead of game objects that fully respects GAMMA's damage calculations. No game objects spawned to avoid busyhands
- A massive MCM menu with all of the above fully configurable. Use what you want, don't use what you dont want
- Safety checks to the best of my knowledge to avoid engine bugs / busyhands. No save bloat, no actor_on_update every frame, time critical functions delayed with nextTick to avoid collisions

#[DOCS](https://github.com/windelicato/painterofthezone/tree/main?tab=readme-ov-file#painter-of-the-zone)

#[SETTINGS](https://github.com/windelicato/painterofthezone/tree/main?tab=readme-ov-file#available-mcm-settings)

#[CHANGELOG](https://github.com/windelicato/painterofthezone/tree/main?tab=readme-ov-file#changelog)

#[TODO](https://github.com/windelicato/painterofthezone/tree/main?tab=readme-ov-file#changelog)



#[ДОКУМЕНТЫ](https://github.com/windelicato/painterofthezone/blob/main/README.ru.md#%D1%85%D1%83%D0%B4%D0%BE%D0%B6%D0%BD%D0%B8%D0%BA-%D0%B7%D0%BE%D0%BD%D1%8B)

#[НАСТРОЙКИ](https://github.com/windelicato/painterofthezone/blob/main/README.ru.md#%D0%B4%D0%BE%D1%81%D1%82%D1%83%D0%BF%D0%BD%D1%8B%D0%B5-%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8-mcm)

#[СПРАВКА](https://github.com/windelicato/painterofthezone/blob/main/README.ru.md#%D0%B8%D0%B7%D0%BC%D0%B5%D0%BD%D0%B5%D0%BD%D0%B8%D1%8F)

#[СПИСОК ДЕЛ](https://github.com/windelicato/painterofthezone/blob/main/README.ru.md#%D0%B2%D1%81%D0%B5)