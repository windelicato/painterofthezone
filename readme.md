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

## Changelog
https://github.com/windelicato/painterofthezone/blob/main/changelog.md

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