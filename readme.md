# PAINTER OF THE ZONE

Combat enhancement overhaul for S.T.A.L.K.E.R. G.A.M.M.A.

## Features

- High resolution wallmark textures with parallax and material support

- Enhancements to engine wallmarks
    - When no walls are nearby places blood marks on the floor
    - 16+ additional wallmark variations
    - Blood pool under target on death
    - MCM configurations for all the above:
        - Enable / disable wallmark enhancements
        - Enable / disable pools on death
        - Option to keep engine wallmark size
        - Option to make all wallmarks the same size
        - Options to pick from 3 categories of wallmark style:
            - Normal: bullet hole bloodmarks with trails
            - Drip: drips like those from bleeding player
            - Splash: larger splashes of blood
        - Option to check for nearby walls before placing
        - Option to delay wallmark placement when multiple hits are landed in short succession
        - TTL for wallmarks
        - Option to set gravity for floor wallmarks. Higher brings them closer to target

- Enhancements to engine hit fx particles
    - Reworked all on hit particle fx
    - Reactive particle system with hit fx that display feedback based on:
        - Target's armor (exo, medium-heavy armor, glass helmets, cloth armor)
        - Player's armor piercing ability calculated from bullet, weapon, and targets armor
        - Body part hit by the shot (headshot, bodyshot)
        - One-hit kill potential (massive fx on one hit headshots)
    - MCM configurations for all the above:
        - Enable / disable particle enhancements
        - Enable / disable reactive particle system
        - Enable / disable particle on hit
        - Enable / disable trailing cloud of dust and blood on hit
        - Enable / disable particle on headshot
        - Enable / disable particle on headshot kill over dismemberment threshold
        - Options to play all of these particles per shot or just one
        - Enable / disable limiting to one of each particle at a time
        - Option to set TTL for each particle before replacing

- Dismemberment
    - Reworked @xcvb's mod to not spawn meshes and have a lower footprint
    - Option to use a body wallmark instead of removing limbs to indicate massive hits
    - MCM configurations for all the above:
        - Enable / disable for stalkers
        - Enable / disable for mutants
        - Enable / disable for heads only
        - Enable / disable body wallmark instead of limb removal
        - Options for hit threshold for stalkers and mutants

- "Bullet Time"
    - Slows down time for 2s after landing a powerful headshot to highlight visual fx
    - Time can be extended by landing multiple consecutive headshots
    - Rewards player for accuracy by making it easy to land follow up shots
    - MCM configurations for all the above:
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

- Kill cam
    - Slow motion kill cam that moves the camera to the target's location on kill
    - Many options for triggering to make it rewarding:
        - Only when current weapon does way more damage than necessary for a kill
        - Only when target is very far away
        - Only when target is last enemy in area
        - Only when bullet time is extended a certain number of times
    - MCM configurations for all the above:
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

- Safety features
    - Avoided any actor_on_update unless user has timescale smoothing enabled
    - All time critical or spammable callbacks are tick delayed (ie shotgun hit callbacks)
    - Destruction of any temporary storage objects on save / load
    - No spawning of game objects or meshes to keep track or remove in case of uninstall

## Credits

- @xcvb_ for their Long Range Blood Decals and Dismemberment mods I used as a basis for this
- Bullet time was ported from BULLET TIME by exDeMODER (https://www.moddb.com/members/exdemoder)
- Some particles modified from HFX by Death Orchird (https://www.moddb.com/mods/stalker-anomaly/addons/hollywoodfx3)
- @0scar for help formatting textures in XRay

## Dependencies for non-GAMMA installs
- Modified EXEs from themrdemonized https://github.com/themrdemonized/xray-monolith
- Wepl Hit Effects for feedback based particles https://www.moddb.com/mods/call-of-chernobyl/addons/wepls-hit-effects
- grok_bo or Artigrok BO for feedback armor based particles https://github.com/ilrathCXV/ArtiGrok-Ballistics-GAMMA-ilrath-Mo3

## Compatability with other mods
- Not fully tested with HD models or KVMAS. Base functionality works but I haven't tested everything
- Hit calculations for dismemberment / hit particles may differ using Arti's Special Ammo or any other mod that touches hit power

## TODO

### Textures

* [x] Remake textures they've been artifacted by re*exporting
* [ ] Fix bump and height maps
* [ ] Remove 8k textures
* [ ] Downscale to 1k, 2k, and 4k
* [ ] Create better wound textures
* [ ] Create better pool textures

### Particles
* [ ] Clean up unused .pe's in particles/
* [ ] Clone all effects with 50% less particles (script it with find/replace)
* [ ] Add option to use 9 blood / 1 smoke for no armor instead of all red

### Killcam
* [ ] Option to slowly pan camera between two points
* [ ] Randomize camera yaw and roll
* [ ] Investigate possibility of predicting a shot will kill and following bullet behind camera

### Dismemberment
* [ ] Rework code and recreate objects
* [ ] Investigate if we can just pull the info we need from .ltx
* [ ] Delay body wallmark
* [ ] Place wound wallmarks on walls near point of dismemberment
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

# 1.2.1
```
    MCM moved from "Blood wallmarks" to "Painter of the zone"

    Particle updates:
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

    Killcam updates:
    - Seperated kill cam settings into their own section
    - Kill cam can be enabled independantly from bullet time
```


# 1.2.1

```
Added slow motion killcam like Fallout
	- Raytraces around target to find safe camera angle
	- By default this triggers on headshot kills from powerful ammo
    - Other trigger options available in MCM
        - Trigger only when victim is a certain distance away
        - Trigger only when no nearby enemies / mutants are engaged with player
        - Or make it a little game. Trigger after more than one cosecutive headshot kills during one bullet time

Added 8K wallmark textures
    - 6 new blood drips and blood drops
    - 8 new splash wallmarks
    - Wallmarks now respect SSS parameters and are much more reflective
        - For darker wallmarks, use `ssfx_blood_decals (0.6,0.6,0,0)`
        - For brighter wallmarks, use `ssfx_blood_decals (1,1,0,0)`
    - Upscaled better blood decal wound textures to 1024x1024. Used for dismemberment mostly
    - Added timer to prevent drawing multiple decals from one shotgun blast
    - Please disable Realistic Blood HQ Redone unless the 8k scares you
    - I'll add a FOMOD with some lower res options when I'm happy with these and I get around to it

New particles
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

Bullet time updates
    - Rewrote most of the code to help with smoother transitions
    - Added MCM options for smooth transitions. Turned off by default to avoid DJ record scratching affect on game audio
    - Bullet time start/stop sound should now properly trigger (but they still suck)
    - Fixed bugs with extremely low and high lengths of bullet time not turning off properly

Dismemberment updates
    - Added an alternative to dismemberment that covers the bone in a large wound wallmark
        - Turn off "Allow limb removal" in MCM
    - Still looks bad on mutants. Might just leave this at heads or do rewrite later

Other fixes
    - Fixed Russian MCM localization (hopefully) for the last time
    - Cleaned up MCM to make things easier to find and hide some of the more confusing options from users
        - Most of the more advanced settings will go away eventually. I'm still tweaking the defaults and these are useful
```


# 1.1.2
```
    - Fixed weird case where we beat grok_bo to calculation.
        - The GAMMA damage calculation essentially erases hit values so this is a workaround to avoid monkeypatching grok_bo
        - See https://github.com/Grokitach/Stalker_GAMMA/pull/290 and tell grok to share his numbers with us!!!
    - Fixed Russian localization still encoded in UTF-8 
```

# 1.1.1
```
    - Remove extra crab mutants from water
```

# 1.1.0
```
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
```

# 1.0.5c
```
    - Fixed timing issues when NPC died before on_hit callback completed. If you notice missing pools or no bullet time after a one hit kill, up "tick delay" in MCM > Blood Wallmarks > General
    - No longer requires debug mode for bullet time
```

# 1.0.5b
```
    - Place extra checks to avoid triggering on npc vs npc kills
```

# 1.0.5a
```
    - Separated MCM menus
    - Added option to configure chance to trigger bullettime in MCM
```

# 1.0.5
```
    - Added optional "bullet time" that triggers when you get a headshot kill
    - Bullet time is extended on each consecutive headshot kill
    - Unfortunately requires debug mode on
    - Added MCM options for bullet time
```

# 1.0.4
```
    - Edited particles and moved the ones we are using into this mod
    - Added particle buffer to prevent overwriting eachother
    - Clean out tables on save/load to prevent memory increase
    - Added optional headshot particle for monkeypatching
    - Added MCM options for buffer size, wallmark tracing, particle choices for custom vfx overrides
    - Updated suggestions for monkeypatch and particle rate
```

# 1.0.3
```
    - Cleaned up optional extra particles on hit to be nice and visible :) Enable in MCM
    - Added grok_bo monkeypatch recommendation/suggestion in pins^^^
```

# 1.0.2
```
  - Enabled for mutants
  - Try and handle pools overlapping with floormarks better. Might have to delay floormark display until grok_bo is done
  - No longer shows floormark when engine displays wallmark (ray traced 5m, some mods might show wallmarks further). Should fix double decals when npc is in a corner
  - Removed debug file accidently placed in last release D:
```

# 1.0.1
```
  - Renamed dltx files and sections to avoid any load order requirements
```

# 1.0
```
  - Initial release
```