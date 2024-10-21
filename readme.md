# 1.2.1
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


# 1.2.0

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