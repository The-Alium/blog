---
title: "June 2023 Update for Garry's Mod"
date: 2023-06-30
draft: false
description: "June 2023 Update for Garry's Mod"
summary: "About the update ..."
tags: ["news", "Global Matter"]
authors:
  - "chebrik"
---

---

Yesterday, an update for Garry's Mod was released, introducing new features for developers, visual effects, and fixes that enhance gameplay.

The issue preventing players from joining servers directly via the "Join Game" button, which arose due to recent Steam updates, has been resolved. The spawn list has improved effect names in the texturing tab. Additionally, in the main menu, when the add-ons list is open, it will now update immediately when subscriptions change.

The color modification tool has been updated to include the ability to invert colors. A new ConVar, "gmod_delete_temp_files," has been added, which will handle the deletion of the materials/temp/ and sounds/temp/ folders upon game launch and exit. An experimental change has also been implemented, completely removing the limit on the number of Lua files in single-player mode.

The issue of incomplete add-on loading when joining servers with more than a hundred add-ons has been fixed. The game crash caused by the premature removal of npc_manhack has been addressed. The toggle_duck command in multiplayer has been corrected, and a server crash when entering the commands sv_parallel_sendsnapshot and sv_parallel_packentities has been resolved.

Regarding technical changes for developers, the Hammer Editor now has full support for "Static Prop Lightmap." Each Input/Output will have its own description. New inputs/outputs for func_tracktrain have been added, along with six new inputs for all entities. A keyvalue "Disable Flashlight" has been added for all entities, as well as prop_sphere and func_friction. New entities filter_activator_context and filter_activator_model have been introduced. New parameters for the shaders "LightmappedGeneric" and "VertexLitGeneric" have been added. Configuration files with difficulty settings for Half-Life: Source have also been included.

This covers the main highlights of the update; more detailed information can be found on the Facepunch website in the changelog.

> [June 2023 update on the Facepunch blog](https://gmod.facepunch.com/news/june-2023-update)<br/>
> [June 2023 update as a publication on Steam](https://steamcommunity.com/games/garrysmod/announcements/detail/3672171270309976083)<br/>
> [Chebrik retains authorship of the article](https://steamcommunity.com/profiles/76561198417964670)
