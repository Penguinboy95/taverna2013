////////////////////////////////////////////////////////////////////////////////
/// Pills.
////////////////////////////////////////////////////////////////////////////////
/obj/item/weapon/reagent_containers/pill
	name = "pill"
	desc = "A pill."
	icon = 'icons/obj/chemical.dmi'
	icon_state = null
	item_state = "pill"
	possible_transfer_amounts = null
	w_class = 1
	randpixel = 8
	slot_flags = SLOT_EARS
	volume = 60
	center_of_mass = list("x"=16, "y"=15)

/obj/item/weapon/reagent_containers/pill/New()
	..()
	if(!icon_state)
		icon_state = "pill[rand(1, 20)]"


/obj/item/weapon/reagent_containers/pill/do_surgery(mob/M, mob/user)
	if(user.a_intent != I_HELP) //in case it is ever used as a surgery tool
		return ..()
	attack(M, user) //default surgery behaviour is just to scan as usual
	return 1

/obj/item/weapon/reagent_containers/pill/attack(mob/M as mob, mob/user as mob, def_zone)
	if(standard_feed_mob(user, M))
		qdel(src)
		return 1
	return 0

/obj/item/weapon/reagent_containers/pill/self_feed_message(var/mob/user)
	user << "<span class='notice'>You swallow \the [src].</span>"

/obj/item/weapon/reagent_containers/pill/other_feed_message_start(var/mob/user, var/mob/target)
	user.visible_message("<span class='warning'>[user] attempts to force [target] to swallow \the [src].</span>")

/obj/item/weapon/reagent_containers/pill/other_feed_message_finish(var/mob/user, var/mob/target)
	user.visible_message("<span class='warning'>[user] forces [target] to swallow \the [src].</span>")

/obj/item/weapon/reagent_containers/pill/afterattack(obj/target, mob/user, proximity)
	if(!proximity) return

	..()

	if(target.is_open_container() && target.reagents)
		if(!target.reagents.total_volume)
			user << "<span class='notice'>[target] is empty. Can't dissolve \the [src].</span>"
			return
		user << "<span class='notice'>You dissolve \the [src] in [target].</span>"

		self_attack_log(user, "Spiked \a [key_name(target)] with a pill. Reagents: [reagentlist()]", 1)

		reagents.trans_to(target, reagents.total_volume)
		for(var/mob/O in viewers(2, user))
			O.show_message("<span class='warning'>[user] puts something in \the [target].</span>", 1)

		qdel(src)

	return

////////////////////////////////////////////////////////////////////////////////
/// Pills. END
////////////////////////////////////////////////////////////////////////////////

//Pills
/obj/item/weapon/reagent_containers/pill/antitox
	name = "Anti-toxins pill"
	desc = "Neutralizes many common toxins."
	icon_state = "pill17"

/obj/item/weapon/reagent_containers/pill/antitox/New()
	..()
	reagents.add_reagent("anti_toxin", 25)


/obj/item/weapon/reagent_containers/pill/tox
	name = "Toxins pill"
	desc = "Highly toxic."
	icon_state = "pill5"

/obj/item/weapon/reagent_containers/pill/tox/New()
	..()
	reagents.add_reagent("toxin", 50)


/obj/item/weapon/reagent_containers/pill/cyanide
	name = "Cyanide pill"
	desc = "Don't swallow this."
	icon_state = "pill5"

/obj/item/weapon/reagent_containers/pill/cyanide/New()
	..()
	reagents.add_reagent("cyanide", 50)


/obj/item/weapon/reagent_containers/pill/adminordrazine
	name = "Adminordrazine pill"
	desc = "It's magic. We don't have to explain it."
	icon_state = "pill16"

/obj/item/weapon/reagent_containers/pill/adminordrazine/New()
	..()
	reagents.add_reagent("adminordrazine", 50)

/obj/item/weapon/reagent_containers/pill/stox
	name = "Sleeping pill"
	desc = "Commonly used to treat insomnia."
	icon_state = "pill8"

/obj/item/weapon/reagent_containers/pill/stox/New()
	..()
	reagents.add_reagent("stoxin", 15)


/obj/item/weapon/reagent_containers/pill/kelotane
	name = "Kelotane pill"
	desc = "Used to treat burns."
	icon_state = "pill11"

/obj/item/weapon/reagent_containers/pill/kelotane/New()
	..()
	reagents.add_reagent("kelotane", 15)


/obj/item/weapon/reagent_containers/pill/paracetamol
	name = "Paracetamol pill"
	desc = "Tylenol! A painkiller for the ages. Chewables!"
	icon_state = "pill8"

/obj/item/weapon/reagent_containers/pill/paracetamol/New()
	..()
	reagents.add_reagent("paracetamol", 15)


/obj/item/weapon/reagent_containers/pill/tramadol
	name = "Tramadol pill"
	desc = "A simple painkiller."
	icon_state = "pill8"

/obj/item/weapon/reagent_containers/pill/tramadol/New()
	..()
	reagents.add_reagent("tramadol", 15)


/obj/item/weapon/reagent_containers/pill/methylphenidate
	name = "Methylphenidate pill"
	desc = "Improves the ability to concentrate."
	icon_state = "pill8"

/obj/item/weapon/reagent_containers/pill/methylphenidate/New()
	..()
	reagents.add_reagent("methylphenidate", 15)


/obj/item/weapon/reagent_containers/pill/citalopram
	name = "Citalopram pill"
	desc = "Mild anti-depressant."
	icon_state = "pill8"

/obj/item/weapon/reagent_containers/pill/citalopram/New()
	..()
	reagents.add_reagent("citalopram", 15)


/obj/item/weapon/reagent_containers/pill/inaprovaline
	name = "Inaprovaline pill"
	desc = "Used to stabilize patients."
	icon_state = "pill20"

/obj/item/weapon/reagent_containers/pill/inaprovaline/New()
	..()
	reagents.add_reagent("inaprovaline", 30)


/obj/item/weapon/reagent_containers/pill/dexalin
	name = "Dexalin pill"
	desc = "Used to treat oxygen deprivation."
	icon_state = "pill16"

/obj/item/weapon/reagent_containers/pill/dexalin/New()
	..()
	reagents.add_reagent("dexalin", 15)


/obj/item/weapon/reagent_containers/pill/dexalin_plus
	name = "Dexalin Plus pill"
	desc = "Used to treat extreme oxygen deprivation."
	icon_state = "pill8"

/obj/item/weapon/reagent_containers/pill/dexalin_plus/New()
	..()
	reagents.add_reagent("dexalinp", 15)


/obj/item/weapon/reagent_containers/pill/dermaline
	name = "Dermaline pill"
	desc = "Used to treat burn wounds."
	icon_state = "pill12"

/obj/item/weapon/reagent_containers/pill/dermaline/New()
	..()
	reagents.add_reagent("dermaline", 15)


/obj/item/weapon/reagent_containers/pill/dylovene
	name = "Dylovene pill"
	desc = "A broad-spectrum anti-toxin."
	icon_state = "pill13"

/obj/item/weapon/reagent_containers/pill/dylovene/New()
	..()
	reagents.add_reagent("anti_toxin", 15)


/obj/item/weapon/reagent_containers/pill/inaprovaline
	name = "Inaprovaline pill"
	desc = "Used to stabilize patients."
	icon_state = "pill20"

/obj/item/weapon/reagent_containers/pill/inaprovaline/New()
	..()
	reagents.add_reagent("inaprovaline", 30)


/obj/item/weapon/reagent_containers/pill/bicaridine
	name = "Bicaridine pill"
	desc = "Used to treat physical injuries."
	icon_state = "pill18"

/obj/item/weapon/reagent_containers/pill/bicaridine/New()
	..()
	reagents.add_reagent("bicaridine", 20)


/obj/item/weapon/reagent_containers/pill/happy
	name = "Happy pill"
	desc = "Happy happy joy joy!"
	icon_state = "pill18"

/obj/item/weapon/reagent_containers/pill/happy/New()
	..()
	reagents.add_reagent("space_drugs", 15)
	reagents.add_reagent("sugar", 15)


/obj/item/weapon/reagent_containers/pill/zoom
	name = "Zoom pill"
	desc = "Zoooom!"
	icon_state = "pill18"

/obj/item/weapon/reagent_containers/pill/zoom/New()
	..()
	reagents.add_reagent("impedrezene", 10)
	reagents.add_reagent("synaptizine", 5)
	reagents.add_reagent("hyperzine", 5)


/obj/item/weapon/reagent_containers/pill/spaceacillin
	name = "Spaceacillin pill"
	desc = "Contains antiviral agents."
	icon_state = "pill19"

/obj/item/weapon/reagent_containers/pill/spaceacillin/New()
	..()
	reagents.add_reagent("spaceacillin", 15)