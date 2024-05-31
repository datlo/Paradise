/*CONTENTS
* 1. LASER GUN
* 2. RETRO LASER
* 3. ANTIQUE
* 4. SCATTERSHOT
* 5. ACCELERATOR
* 6. LWAP
* 7. X-RAY
* 8. IMMOLATOR
* 9. EMITTER
* 10. LASER TAG
*/
//////////////////////////////
// MARK: LASER GUN
//////////////////////////////
/obj/item/gun/energy/laser
	name = "\improper LG-5 laser carbine"
	desc = "A compact and lightweight laser carbine manufactured by Shellguard Munitions Co. Considered the most widely used laserarm in the Orion sector, it only fires lethal rounds and requires a recharger to reload."
	icon_state = "laser"
	item_state = "laser"
	w_class = WEIGHT_CLASS_NORMAL
	materials = list(MAT_METAL=2000)
	origin_tech = "combat=4;magnets=2"
	ammo_type = list(/obj/item/ammo_casing/energy/lasergun)
	ammo_x_offset = 1
	shaded_charge = TRUE
	execution_speed = 5 SECONDS

/obj/item/gun/energy/laser/examine_more(mob/user)
	..()
	. = list()
	. += "A compact but versatile laser carbine, and an icon of the Shellguard Munitions Co. arsenal. Its origins stem back to early corporate expansion, \
	after acquiring assets from a now-defunct laser company which gave Shellguard the framework to produce its own initial laser prototypes. \
	The early models would be significant at carving out Shellguard's niche in the arms market and later weapon philosophy around lasers. The LG-series is one of the earliest, \
	and most iconic laser brands throughout the Orion sector, thanks to low cost and excessive overproduction of units."
	. += ""
	. += "Crafted for cost-effectiveness and reliability in combat, the LG series boasts a robust philosophy in frame and internal parts. The use of lightweight alloys and polymers in the body and furniture makes it \
	surprisingly light for its size. Heat generated during firing is dissipated by a fan-assisted heatsink, protecting the internal power cell and optical assembly from overheating."
	. += ""
	. += "The LG-5 is prevalent among corporate security forces and PMCs. Thanks to the popularity of the design - along with its simplicity and robust construction - a wide variety of aftermarket modifications have \
	been created for it both by laser enthusiasts and corporate interests, giving end-users many options to customise it to fit their needs. \
	Foregrips are among the most common modifications seen, as despite the lack of recoil generated by laser weapons, the \"tactical, militaristic\" appearance they are perceived to add makes them very popular."
	. += ""
	. += "Shellguard discontinued warranties due to widespread customization and has moved its attention to later EG series."

/obj/item/gun/energy/laser/cyborg
	name = "mounted LG-5 laser carbine"
	desc = "A modified LG-5 laser carbine that draws power directly from your internal energy cell. This probably would have voided the gun's warranty if Shellguard hadn't already discontinued LG-5 warranties."
	can_charge = FALSE
	ammo_type = list(/obj/item/ammo_casing/energy/laser/cyborg)
	origin_tech = null

/obj/item/gun/energy/laser/cyborg/newshot()
	..()
	robocharge()

/obj/item/gun/energy/laser/cyborg/emp_act()
	return

/obj/item/gun/energy/laser/practice
	name = "\improper LG-5(T) training laser carbine"
	desc = "A training model of Shellguard Munitions' LG-5 laser rifle. It shoots low-power laser shots designed for target practice."
	origin_tech = "combat=2;magnets=2"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/practice)
	clumsy_check = FALSE
	needs_permit = FALSE

/obj/item/gun/energy/laser/practice/examine(mob/user)
	. = ..()
	. += "<span class='warning'>This weapon's shots are too weak to harm anyone, it is useless as an offensive weapon.</span>"

//////////////////////////////
// MARK: RETRO LASER
//////////////////////////////
/obj/item/gun/energy/laser/retro
	name ="\improper L-1 'retro' laser gun"
	icon_state = "retro"
	item_state = "retro"
	desc = "An older model of the basic lasergun, no longer used by Nanotrasen's private security or military forces. \
	Nevertheless, it is still quite deadly and easy to maintain, making it a favorite amongst pirates and other outlaws."
	ammo_x_offset = 3

/obj/item/gun/energy/laser/retro/examine_more(mob/user)
	..()
	. = list()
	. += "The L-1 Laser Gun was among the earliest practical man-portable laser weapons on the market, produced by the now-defunct Maiman Photonics company."
	. += ""
	. += "The weapon was designed with reliability in mind, and features a heavy metal frame enclosing a relatively simple (yet powerful) carbon dioxide laser assembly. \
	They were produced in great quantities until Maiman Photonics was acquired by Shellguard Munitions in a hostile takeover bid. \
	Shellguard would then use the technology of the L-1 as the basis for its own LG line of laser rifles."
	. += ""
	. += "Despite no longer being in production, ease of maintenance and a plentiful supply of spare components has allowed the L-1 to remain in use even to the present day, \
	mostly among spacers and colonists on the frontier; and various outlaw groups."

//////////////////////////////
// MARK: ANTIQUE
//////////////////////////////
/obj/item/gun/energy/laser/captain
	name = "antique laser gun"
	icon_state = "caplaser"
	item_state = null
	desc = "This is an antique laser gun. All craftsmanship is of the highest quality. It is decorated with bovine leather and chrome. \
	The object menaces with spikes of energy. On the item is an image of Space Station 13. The station is exploding."
	force = 10
	origin_tech = null
	ammo_x_offset = 3
	selfcharge = TRUE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF

/obj/item/gun/energy/laser/captain/Initialize(mapload, ...)
	. = ..()
	RegisterSignal(src, COMSIG_PARENT_QDELETING, PROC_REF(alert_admins_on_destroy))

/obj/item/gun/energy/laser/captain/examine(mob/user)
	. = ..()
	. += "<span class='notice'>[src] contains a miniturised nuclear reactor that will slowly reacharge its power cell at all times. It can still be put into a gun charger for faster charging.</span>"

/obj/item/gun/energy/laser/captain/examine_more(mob/user)
	..()
	. = list()
	. += "This unique laser gun was commissioned by the research director of Nanotrasen's old Martian research facility back in 2451. \
	It served as the testbed of several breakthroughs in laser weapon research that wouldn't trickle into mainstream laser weapons for decades - whilst modern laserarms have a similar performance, \
	it was vastly superior to any of its contemporaries back when it was originally made."
	. += ""
	. += "The most revolutionary component is the miniaturised nuclear fission reactor that charges the gun's power cell, allowing for theoretically unlimited shots. \
	All radiation emitted is contained by a plasma-lead alloy, making it safe to handle. \
	This single example cost a considerable fortune to produce, and has never been successfully replicated. \
	The gun's furniture and decorative embellishments were all hand-made by small group highly trained artisans for a comparatively tiny cost."
	. += ""
	. += "The laser was passed down several generations until it finally ended up in Epsilon Eridani. Today, it is kept on this station as a memento and reminder of what Nanotrasen R&D can achieve. \
	Its age, craftsmanship, and unique technology marks it as one of the most expensive objects in the entire station that can be stuffed into a backpack-sized container."

//////////////////////////////
// MARK: SCATTERSHOT
//////////////////////////////
/obj/item/gun/energy/laser/captain/scattershot
	name = "scatter shot laser rifle"
	icon_state = "lasercannon"
	item_state = "laser"
	desc = "A heavy-duty laser rifle fitted with a retractable prism that scatters its beam into multiple smaller shots. The fire selector has two settings: 'scatter', and 'kill'."
	origin_tech = "combat=5;materials=4;powerstorage=4"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/scatter, /obj/item/ammo_casing/energy/laser)
	shaded_charge = FALSE

/obj/item/gun/energy/laser/captain/scattershot/examine_more(mob/user)
	..()
	return list()	// Never seen this get used so it probably doesn't need an extended description.

/obj/item/gun/energy/laser/scatter
	name = "scatter laser gun"
	desc = "A laser gun equipped with a retractable prism that scatters its beam into multiple smaller shots. The fire selector has two settings: 'scatter', and 'kill'."
	ammo_type = list(/obj/item/ammo_casing/energy/laser/scatter, /obj/item/ammo_casing/energy/laser)

/obj/item/gun/energy/laser/scattershot/examine_more(mob/user)
	..()
	return list()	// Never seen this get used so it probably doesn't need an extended description.

//////////////////////////////
// MARK: ACCELERATOR
//////////////////////////////
/obj/item/gun/energy/lasercannon
	name = "accelerator laser cannon"
	desc = "An advanced laser cannon that does more damage the farther away the target is. At close range, damage is less than an LG-5 laser carbine shot."
	icon_state = "lasercannon"
	item_state = null
	w_class = WEIGHT_CLASS_BULKY
	force = 10
	flags =  CONDUCT
	slot_flags = SLOT_FLAG_BACK
	can_holster = FALSE
	origin_tech = "combat=4;magnets=4;powerstorage=3"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/accelerator)
	ammo_x_offset = 3
	execution_speed = 8 SECONDS

/obj/item/gun/energy/lasercannon/examine_more(mob/user)
	..()
	. = list()
	. += "This offering from Nanotrasen R&D is a real headscratcher. No one is quite sure how it works or how they did it, \
	but the fired beam becomes more damaging the further it travels from the barrel. Kind of like a gyrojet but made of light. No plasma or bluespace to account for this one."
	. += ""
	. += "At any rate, Nanotrasen is looking to sell these to sniper units who will undoubtedly appreciate the devastating effect that one of these can have when given proper operating distance."

/obj/item/ammo_casing/energy/laser/accelerator
	projectile_type = /obj/item/projectile/beam/laser/accelerator
	select_name = "accelerator"
	fire_sound = 'sound/weapons/lasercannonfire.ogg'

/obj/item/projectile/beam/laser/accelerator
	name = "accelerator laser"
	icon_state = "heavylaser"
	range = 255
	damage = 6

/obj/item/projectile/beam/laser/accelerator/Range()
	..()
	damage = min(damage+7, 100)

/obj/item/gun/energy/lasercannon/cyborg
	name = "mounted accelerator laser cannon"
	desc = "A frame-mounted accellerator laser cannon that draws power directly from your internal energy cell. The warranty is accelerating away too fast for you to retrieve it."

/obj/item/gun/energy/lasercannon/cyborg/newshot()
	..()
	robocharge()

/obj/item/gun/energy/lasercannon/cyborg/emp_act()
	return

//////////////////////////////
// MARK: LWAP SNIPER
//////////////////////////////
/obj/item/gun/energy/lwap
	name = "\improper LWAP laser sniper"
	desc = "A highly advanced laser sniper that does more damage the farther away the target is, but fires slowly. Comes with a super advanced scope, which can highlight threats through walls, and pierce one object, after being deployed for a while."
	icon_state = "esniper"
	item_state = null
	w_class = WEIGHT_CLASS_BULKY
	force = 12
	flags = CONDUCT
	slot_flags = SLOT_FLAG_BACK
	can_holster = FALSE
	weapon_weight = WEAPON_HEAVY
	origin_tech = "combat=6;magnets=6;powerstorage=4"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/sniper, /obj/item/ammo_casing/energy/laser/sniper/pierce)
	shaded_charge = TRUE
	execution_speed = 8 SECONDS

/obj/item/gun/energy/lwap/examine_more(mob/user)
	..()
	. = list()
	. += "The LWAP is a further iteration of the accelerator laser cannon, featuring a more powerful laser and a highly advanced \
	thermal optic that can pick up the heat signatures of a person-sized target even through thick cover."
	. += ""
	. += "If given enough time, the built-in targeting computer is able to generate firing solutions that can reliably allow the user to shoot through seams, \
	cracks, or other imperfections in walls, allowing targets in other rooms to be struck without fear of retaliation."

/obj/item/gun/energy/lwap/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/scope, range_modifier = 2, time_to_scope = 3 SECONDS, movement_cancels_scope = TRUE)

/obj/item/gun/energy/lwap/on_scope_success(mob/living/user)
	to_chat(user, "<b><span class='robot'>SCOPE_CREEPER_[rand(1, 9999)] Online.</span></b>")
	select_fire(user)
	user.apply_status_effect(STATUS_EFFECT_LWAPSCOPE)

/obj/item/gun/energy/lwap/on_scope_end(mob/living/user)
	select_fire(user)
	user.remove_status_effect(STATUS_EFFECT_LWAPSCOPE)

/obj/item/gun/energy/lwap/attack_self()
	return //no manual ammo changing.

/obj/item/ammo_casing/energy/laser/sniper
	projectile_type = /obj/item/projectile/beam/laser/sniper
	muzzle_flash_color = LIGHT_COLOR_PINK
	muzzle_flash_range = MUZZLE_FLASH_RANGE_STRONG
	muzzle_flash_strength = MUZZLE_FLASH_STRENGTH_STRONG
	select_name = null
	fire_sound = 'sound/weapons/marauder.ogg'
	delay = 5 SECONDS

/obj/item/ammo_casing/energy/laser/sniper/pierce
	projectile_type = /obj/item/projectile/beam/laser/sniper/pierce

/obj/item/projectile/beam/laser/sniper
	name = "sniper laser"
	icon_state = "sniperlaser"
	range = 255
	damage = 10
	speed = 0.75
	impact_effect_type = /obj/effect/temp_visual/impact_effect/purple_laser
	forced_accuracy = TRUE
	var/can_knockdown = TRUE

/obj/item/projectile/beam/laser/sniper/Range()
	..()
	damage = min(damage + 5, 100)

/obj/item/projectile/beam/laser/sniper/on_hit(atom/target, blocked = 0, hit_zone)
	..()
	var/mob/living/carbon/human/H = target
	if(istype(H) && damage >= 40 && can_knockdown)
		H.KnockDown(2 SECONDS * (damage / 10))
	can_knockdown = FALSE //Projectiles that pierce can not knockdown, no wall knockdowns.

/obj/item/projectile/beam/laser/sniper/pierce
	forcedodge = 1 // Can pierce one non wall thing.
	speed = 0.5
	/// Have we hit an r_wall? If we have, don't pierce it again so we don't become too effective on reinforced locations (AI sat)
	var/hit_a_r_wall = FALSE

/obj/item/projectile/beam/laser/sniper/pierce/prehit(atom/target)
	if(istype(target, /turf/simulated/wall/r_wall))
		if(!hit_a_r_wall)
			hit_a_r_wall = TRUE
			if(!forcedodge)
				forcedodge++
	else if((isturf(target) || istype(target, /obj/structure/alien/resin)) && !forcedodge)
		forcedodge++
	..()

//////////////////////////////
// MARK: X-RAY
//////////////////////////////
/obj/item/gun/energy/xray
	name = "\improper X-ray laser gun"
	desc = "A high-power laser gun capable of expelling concentrated X-ray beams. These beams can penetrate any number of solid objects, but will decrease in power the longer they have to travel."
	icon_state = "xray"
	item_state = null
	shaded_charge = TRUE
	origin_tech = "combat=6;materials=4;magnets=4;syndicate=1"
	ammo_type = list(/obj/item/ammo_casing/energy/xray)

/obj/item/gun/energy/xray/examine_more(mob/user)
	..()
	. = list()
	. += "The X-Ray laser gun is an unusual entry into Nanotrasen's R&D line-up. \
	It generates beams of ultra-short wavelength light (~750 picometers) that are capable of passing through solid objects, \
	making it an ideal weapon for attacking targets in indoor environments or behind cover with impunity."
	. += ""
	. += "When a target is hit by the X-ray beam, only a portion of the beam's energy is transferred into the target, allowing it to continue flying. \
	The very high energy used to generate the beam ensures that the damage dealt is roughly equivalent to a traditional laser rifle (at close range)."
	. += ""
	. += "Due to the difficulty in creating compact optical assemblies that can effectively focus X-ray wavelengths, the potency of the beam degrades the further it gets from the point of firing."

//////////////////////////////
// MARK: IMMOLATOR
//////////////////////////////
/obj/item/gun/energy/immolator
	name = "immolator laser gun"
	desc = "A laser rifle that shoots incendiary bolts, struck targets will be set on fire. Each shot consumes more energy than a regular laser rifle, draining the power cell more quickly."
	icon_state = "immolator"
	item_state = null
	ammo_type = list(/obj/item/ammo_casing/energy/immolator)
	origin_tech = "combat=4;magnets=4;powerstorage=3"
	shaded_charge = TRUE

/obj/item/gun/energy/immolator/examine_more(mob/user)
	..()
	. = list()
	. += "The Immolator laser gun is a brutally effective laserarm that was accidentally created by Nanotrasen R&D whilst experimenting with plasma-based lasers. \
	The lasing medium is a slug of ultra-pure plasma doped with silver, producing two beam emissions: a 1 μm infrared beam and a secondary, \
	much less intense 650 nm red beam (responsible for the visibility of the fired beam)."
	. += ""
	. += "During testing it was found that it the intense infrared beam would often set the testing targets ablaze thanks to how efficiently it dumps heat into struck material. \
	Employing a more powerful electron pump allowed for this effect to be reliably reproduced at the cost of increased power draw. \
	Shots from the Immolator will ignite practically any remotely flammable material, from clothing to flesh, causing severe full-body burns in addition to the damage caused at the site of impact."
	. += ""
	. += "Many groups have called for these types of weapons to be banned for the especially painful and grievous injuries that they cause, but at the present time they remain legal in most regions of space."

/obj/item/gun/energy/immolator/multi
	name = "multi-lens immolator cannon"
	desc = "The bigger brother of the Immolator Laser Gun, featuring toggleable firemodes. The fire selector has two settings: 'scatter', and 'precise'."
	icon_state = "multilensimmolator"
	item_state = null
	ammo_type = list(/obj/item/ammo_casing/energy/immolator/strong, /obj/item/ammo_casing/energy/immolator/scatter)
	origin_tech = "combat=5;magnets=5;powerstorage=4"

/obj/item/gun/energy/immolator/multi/examine_more(mob/user)
	..()
	. = list()
	. += "Following numerous refinements by Nanotrasen R&D, the Immolator laser gun was upgraded to make it a truly terrifying killing machine. \
	Beefed up components, a more powerful lasing apparatus, and a bigger cell to offset the increased power draw lend this weapon more heft than the original, but also give it more powerful shots."
	. += ""
	. += "However, the most devastating feature is the addition of a toggleable multifaceted plasma glass prism at the end of the cannon's optical assembly. \
	When set into position by the operator, the prism splits the laser into multiple weaker shots that spread out in a wide arc in front of the barrel, \
	allowing entire rooms to be quickly peppered with incendiary laser fire."
	. += ""
	. += "Few weapons inspire quite the same fear and loathing as this. Nanotrasen reserves this weapon for its elite combat operatives and cyborgs. If you're holding it, be glad you're not the one on the other end."
	
/obj/item/gun/energy/immolator/multi/update_overlays()
	. = ..()
	var/obj/item/ammo_casing/energy/shot = ammo_type[select]
	var/append = shot.select_name
	. += image(icon = icon, icon_state = "multilensimmolator-[append]")

/obj/item/gun/energy/immolator/multi/cyborg
	name = "mounted multi-lens immolator cannon"
	desc = "A modified multi-lens immolator cannon that draws power directly from your internal energy cell. Thankfully this usage is covered under Nanotrasen's own warranty."
	ammo_type = list(/obj/item/ammo_casing/energy/immolator/scatter/cyborg, /obj/item/ammo_casing/energy/immolator/strong/cyborg) // scatter is default, because it is more useful

//////////////////////////////
// MARK: EMITTER GUN
//////////////////////////////
/obj/item/gun/energy/emitter
	name = "portable laser emitter"
	desc = "An emitter removed from its base, and attached to a laser cannon frame."
	icon_state = "emittercannon"
	item_state = "laser"
	w_class = WEIGHT_CLASS_BULKY
	shaded_charge = TRUE
	can_holster = FALSE
	origin_tech = "combat=4;magnets=4;powerstorage=3"
	ammo_type = list(/obj/item/ammo_casing/energy/emitter)
	ammo_x_offset = 3

/obj/item/gun/energy/emitter/examine_more(mob/user)
	..()
	. = list()
	. += "Emitters are very robust lasers used in special industrial applications. It doesn't take a genius to figure out that they can also be used in combat. \
	Their industrial nature makes them more bulky than laserarms designed from the onset as weapons, but this is offset by the larger and more powerful beam that they can generate."
	. += ""
	. += "Usually these are seen being used by cyborgs, but self-contained emitter guns intended for regular humanoid use also exist, however they are generally quite rare."

/obj/item/gun/energy/emitter/cyborg
	name = "mounted laser emitter"
	desc = "A modified mobile laser emitter that draws power directly from your internal energy cell. draining charge from your cell. Time to void some warranties..."
	ammo_type = list(/obj/item/ammo_casing/energy/emitter/cyborg)

/obj/item/gun/energy/emitter/cyborg/newshot()
	..()
	robocharge()

/obj/item/gun/energy/emitter/cyborg/emp_act()
	return

// Special version given by the Safety Override upgrade and as a standard module for ERT engiborgs.
/obj/item/gun/energy/emitter/cyborg/proto	
	name = "mounted prototype laser emitter"
	desc = "A modified mobile laser emitter that draws power directly from your internal energy cell. This one operates on unoptimised software, reducing its effectiveness."
	ammo_type = list(/obj/item/ammo_casing/energy/emitter/cyborg/proto)

//////////////////////////////
// MARK: LASER TAG
//////////////////////////////
/obj/item/gun/energy/laser/tag
	name = "laser tag gun"
	desc = "Standard issue weapon of the Imperial Guard"
	origin_tech = "combat=2;magnets=2"
	clumsy_check = FALSE
	needs_permit = FALSE
	ammo_x_offset = 2
	selfcharge = TRUE

/obj/item/gun/energy/laser/tag/examine_more(mob/user)
	..()
	return list()	// It's a laser tag gun.

/obj/item/gun/energy/laser/tag/blue
	icon_state = "bluetag"
	item_state = "bluetag"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/bluetag)

/obj/item/gun/energy/laser/tag/red
	icon_state = "redtag"
	item_state = "redtag"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/redtag)
