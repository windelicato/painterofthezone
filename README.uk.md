# ХУДОЖНИК ЗОНИ

Капітальний ремонт покращення бойових дій для S.T.A.L.K.E.R. G.A.M.M.A.

# ОСОБЛИВОСТІ

## Текстури настінних марок високої роздільної здатності з паралаксом і підтримкою матеріалів

## Великі параметри MCM для налаштування або вимкнення будь-якого з наступного:

### Покращення настінних позначок двигуна

-   Якщо поблизу немає стін, на підлозі залишаються сліди крові
-   16+ додаткових варіацій настінних марок
-   Калюжа крові під ціллю після смерті

### Удосконалення часток fx hit engine

-   Перероблено все на hit particle fx
-   Система реактивних частинок із ефектом удару, яка відображає відгук на основі:
    -   Броня цілі (екзо, броня середньої важкості, скляні шоломи, тканинна броня)
    -   Здатність гравця до броні, розрахована на основі броні куль, зброї та цілей
    -   Частина тіла, уражена пострілом (постріл в голову, постріл в тіло)
    -   Потенціал вбивства одним ударом (масовий ефект при ударах у голову одним ударом)

### Розчленування

-   Перероблено мод @xcvb, щоб не створювати сітки та мати менший слід
-   Можливість використовувати клеймо на стіні тіла замість видалення кінцівок для позначення масивних ударів

### Куля Час

-   Уповільнює час на 2 секунди після потужного пострілу в голову, щоб підкреслити візуальний ефект
-   Час можна збільшити, зробивши кілька послідовних ударів у голову
-   Винагороджуйте гравця за точність, полегшуючи виконання наступних ударів

### Убити камеру

-   Камера вбивства у повільному режимі, яка переміщує камеру до місця розташування цілі під час вбивства
-   Багато варіантів запуску, щоб зробити його винагородою:
    -   Лише тоді, коли поточна зброя завдає значно більше шкоди, ніж необхідно для вбивства
    -   Тільки коли ціль дуже далеко
    -   Лише тоді, коли мета є останнім ворогом у зоні
    -   Лише тоді, коли час кулі подовжується певну кількість разів

### Функції безпеки

-   Уникнення будь-якого actor_on_update, якщо користувач не ввімкнув згладжування шкали часу
-   Усі зворотні виклики, критичні за часом або спаму, відкладаються (тобто зворотні виклики удару дробовика)
-   Знищення будь-яких об’єктів тимчасового зберігання під час збереження/завантаження
-   Немає появи ігрових об’єктів або сіток, які слід відстежувати або видаляти у разі видалення

# ДОСТУПНІ НАЛАШТУВАННЯ MCM

### Настінні позначки

-   Увімкнути/вимкнути покращення стінових позначок
-   Увімкнути / вимкнути пули після смерті
-   Можливість збереження розміру стінової позначки двигуна
-   Можливість зробити всі настінні позначки однакового розміру
-   Варіанти вибору з 3 категорій стилю стінових марок:
    -   Звичайний: криваві сліди від кульових отворів зі слідами
    -   Крапельниця: капає, як з кровоточивого гравця
    -   Splash: великі бризки крові
-   Можливість перевірити наявність сусідніх стін перед розміщенням
-   Опція затримки розміщення настінних міток, коли кілька ударів припадає на коротку послідовність
-   TTL для настінних позначок
-   Опція встановлення сили тяжіння для стінових позначок підлоги. Вищий наближає їх до мети

### частинки

-   Увімкнути/вимкнути покращення частинок
-   Увімкнути/вимкнути систему активних частинок
-   Увімкнути / вимкнути частинку при попаданні
-   Увімкнути/вимкнути хмару пилу та крові, що тягнеться під час удару
-   Увімкнути / вимкнути частинку при пострілі в голову
-   Увімкнути / вимкнути частинку при вбивстві пострілом у голову, що перевищує поріг розчленування
-   Варіанти відтворення всіх цих частинок за один удар або лише одну
-   Увімкнути/вимкнути обмеження на одну кожну частинку за раз
-   Можливість встановити TTL для кожної частинки перед заміною

### Розчленування

-   Увімкнути / вимкнути для сталкерів
-   Увімкнути / вимкнути для мутантів
-   Увімкнути/вимкнути лише для голів
-   Увімкнути/вимкнути позначення на стіні тіла замість видалення кінцівок
-   Варіанти порогу попадання для сталкерів і мутантів

### Куля часу

-   Увімкнути / вимкнути час кулі
-   Можливість вибрати, на скільки сповільнюється час
-   Можливість вибрати, скільки часу триватиме куля
-   Можливість увімкнути звук при активації/деактивації
-   Можливість увімкнути ефекти накладання екрану під час лімітованого часу
-   Увімкнути/вимкнути зміну часу поступово, а не миттєво (вимкнути для actor_on_update-less)
    -   Можливість налаштування поступовості зміни часу
-   Параметри тригера:
    -   Використовує поріг розчленування з увімкненим розчленуванням
    -   Можливість встановити рівний шанс спрацьовування при вбивстві пострілом у голову

### Killcam

-   Увімкнути/вимкнути killcam
-   Можливість вибрати, на скільки сповільнюється час
-   Можливість вибрати, як довго працюватиме killcam
-   Можливість вибору відстані камери від цілі
-   Увімкнути/вимкнути зміну часу поступово, а не миттєво (вимкнути для actor_on_update-less)
    -   Можливість налаштування поступовості зміни часу
-   Параметри тригера:
    -   Можливість спрацьовування, коли мета знаходиться на певній відстані від гравця
    -   Можливість активації лише тоді, коли інші вороги не борються з гравцем на певній відстані
    -   Можливість спрацьовувати лише тоді, коли час кулі подовжено певну кількість разів

# КРЕДИТИ

-   @xcvb\_ за їхні наклейки крові на великі відстані та моди розчленування, які я використав як основу для цього
-   Bullet time перенесено з BULLET TIME exDeMODER (<https://www.moddb.com/members/exdemoder>)
-   Деякі частинки, модифіковані з HALIFAX Death Orchid (<https://www.moddb.com/mods/stalker-anomaly/addons/hollywoodfx3>)
-   @0scar за допомогу у форматуванні текстур у XRay

# ЗАЛЕЖНОСТІ ДЛЯ ВСТАНОВЛЕННЯ НЕ ГАММА

-   Модифіковані EXE з нихrdemonized<https://github.com/themrdemonized/xray-monolith>
-   Wepl Hit Effects для частинок на основі зворотного зв’язку<https://www.moddb.com/mods/call-of-chernobyl/addons/wepls-hit-effects>
-   grok_bo або Artigrok BO для зворотного зв’язку на основі частинок броні<https://github.com/ilrathCXV/ArtiGrok-Ballistics-GAMMA-ilrath-Mo3>

# СУМІСНІСТЬ З ІНШИМИ МОДАМИ

-   Не повністю протестовано з моделями HD або KVMAS. Базова функція працює, але я перевірив не все
-   Розрахунок ударів для розчленування/вдарених частинок може відрізнятися при використанні спеціальних боєприпасів Arti або будь-якого іншого мода, який впливає на силу удару

# ВСЕ

### Текстури

-   [x] Переробте текстури, які були артефактовані повторним експортом
-   [ ] Виправте карти нерівностей і висоти
-   [ ] Видаліть текстури 8k
-   [ ] Зменшити масштаб до 1k, 2k і 4k
-   [ ] Створення кращої текстури рани
-   [ ] Створіть кращі текстури басейну

### частинки

-   [ ] Очистити невикористані .pe в частинках/
-   [ ] Клонуйте всі ефекти на 50% менше частинок (скриптуйте його з пошуком/заміною)
-   [ ] Додайте можливість використовувати 9 крові / 1 дим без броні замість повністю червоного

### Killcam

-   [ ] Можливість повільного повороту камери між двома точками
-   [ ] Рандомізуйте відхилення та крен камери
-   [ ] Дослідіть можливість передбачити, що постріл уб’є, і слідувати за кулею поза камерою

### Розчленування

-   [ ] Переробити код і відтворити об’єкти
-   [ ] Дослідіть, чи можемо ми просто отримати потрібну інформацію з .ltx
-   [ ] Настінна позначка корпусу затримки
-   [ ] Помістіть позначки ран на стінах біля точки розчленування
-   [ ] Пройдіть і перевірте ще раз усі кістки мутантів

### Загальний

-   [ ] Доповнюйте PR grok_bo новими ідеями
-   [ ] Перевірте продуктивність на нижчих системах
-   [ ] Скасувати реєстрацію неактивних зворотних викликів
-   [ ] Підтримка базової аномалії
-   [ ] Видаліть усі посилання на "наклейки з кров'ю короткого діапазону" в:
    -   [ ] Код
    -   [ ] Текстури
    -   [ ] частинки
    -   [ ] LTX

# ЖУРНАЛ ЗМІН

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

# 1.2.1

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

# 1,0.кга

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
