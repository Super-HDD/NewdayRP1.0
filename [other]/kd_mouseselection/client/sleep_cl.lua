local bedTarget = 0

local Animations = {
  "PROP_HUMAN_SLEEP_BED_PILLOW_HIGH",
}

local bedModels = {
  `p_bedpanladies01x`,
  `p_bed01x`,
  `p_bed02bx`,
  `p_bed02x`,
  `p_bed03x`,
  `p_bed04x`,
  `p_bed05x`,
  `p_bed08x`,
  `p_bed09x`,
  `p_bed10x`,
  `p_bed12x`,
  `p_bed13x`,
  `p_bed14x`,
  `p_bed15brassx`,
  `p_bed17x`,
  `p_bed18x`,
  `p_bed20bloodyx`,
  `p_bed20madex`,
  `p_bed20x`,
  `p_bed21x`,
  `p_bed22x`,
  `p_bed_abigail3x`,
  `p_bedbunk03x`,
  `p_bedindian01x`,
  `p_bedking01x`,
  `p_bedking02x`,
  `p_bedlog01x`,
  `p_bedmosquitonet01x`,
  `p_bedsleptin01x`,
  `p_bedsleptinold04x`,
  `p_nightbedking01x`,
  `p_singlebrassbed01x`,
  `p_ambbed01x`,
  `p_gangbed01x`,
  `p_bedrollclosed01x`,
  `p_bedrollclosed03x`,
  `p_bedrollclosed_sml01x`,
  `p_bedrollclosed_sml02x`,
  `p_bedrollopen01x`,
  `p_bedrollopen03x`,
  `p_bedindian02x`,
  `p_bedindian04x`,
  `p_indianbedrollclosed01x`,
  `p_medbed01x`,
  `p_tablebedside01x`,
  `p_tablebedside02x`,
  `s_bedarthur01x`,
  `s_bedrollfurlined01x`,
  `s_bedrollopen01x`,
  `s_craftedbed01x`,
  `p_cs_ann_wrkr_bed01x`,
  `p_cs_bed20madex`,
  `p_cs_bedrollclsd01x`,
  `p_cs_bedsleptinbed08x`,
  `p_cs_pro_bed_unmade`,
  `p_cs_roc_hse_bed`,
  `s_bed17x`,
  `s_bed17x_blanket`,
  `p_re_bedrollopen01x`,
  `s_lootablebedchest`,
  `s_lootablebedchest_a`,
  `s_lootablebedchest_b`,
  `s_lootablebedchest_c`,
  `s_lootablebedchest_d`,
  `s_pro_bunkbeds01x`,
  `p_bedundone_trelawny01x`,
  `collision_bedroll`,
  `cs_obediahhinton`,
  `p_gen_bedrollopen01x`,
  `p_gen_bedrollopen02x`,
  `p_gen_bedsleptin02x`,
  `p_gen_bedsleptin01x_tc01`,
  `p_opensleeper_bed01x`,
  `p_opensleeper_tre2_bed01`,
  `des_utp2_rvrbed`,
  `des_utp2_rvrbed_01`,
  `des_utp2_rvrbed_02`,
  `mp007_p_bed_nat01x`,
  `proc_algae_lakebed_01`,
  `proc_algae_lakebed_02`,
  `proc_algae_lakebed_03`,
  `proc_algae_lakebed_04`,
  `proc_algae_lakebed_05`,
  `proc_bedrollclosed01x`,
  `proc_bedrollopen01x`,
  `proc_rock_lakebed_01`,
  `proc_rock_lakebed_02`,
  `proc_rock_lakebed_03`,
  `proc_trolley_lakebed`,
  `proc_tyre_lakebed`,
  `reg_bgv_rvrbed_end`,
  `reg_bgv_rvrbed_start`,
  `p_mattress03x`,
  `p_mattress04x`,
  `p_mattress07x`,
  `p_mattress08x`,
  `p_amb_mattress04x`,
  `p_oldmattress01x`,
  `p_mattresscombined01x`,
  `p_cs_mattress01x`,
  `mp007_p_mp_oldmattress01x`,

}

AddEventHandler('mouse-selection:CanInteract', function(entity, callback)
  bedTarget = 0
  local _model = GetEntityModel(entity)
  for cat,validModel in pairs (bedModels) do
    if _model == validModel then
      bedTarget = entity
      callback(true)
      return
    end
  end
end)

AddEventHandler("mouse-selection:ClickEntity", function()
  if (bedTarget == 0) then return end
  
  CMenu.AddItem({
    title=Lang['sleep'],
    id="slep",
    callback="mouse-selection:Sleep"
  })
end)

AddEventHandler('mouse-selection:Sleep', function()
  if (bedTarget == 0) then return end

  local player = PlayerPedId()
  local chairpos = GetOffsetFromEntityInWorldCoords(bedTarget,0.0,0.0,0.5)
  local chairheading = GetEntityHeading(bedTarget)
  TaskStartScenarioAtPosition(player, GetHashKey(Animations[1]), chairpos.x, chairpos.y, chairpos.z, chairheading+180.0, 0, true, false)
  while not IsPedUsingAnyScenario(player) do
    Wait(1000)
  end
  Citizen.CreateThread(function()
    while IsPedUsingAnyScenario(player) do
      Wait(2)
      DisplayPrompt('sleep_prompt')
      if IsPromptCompleted('sleep_prompt','INPUT_FRONTEND_CANCEL') then
        ClearPedTasks(player)
        return
      end
    end
  end)
end)
Citizen.CreateThread(function()
  CreatePromptButton('sleep_prompt',Lang['leave'], 'INPUT_FRONTEND_CANCEL', 1000)
end)