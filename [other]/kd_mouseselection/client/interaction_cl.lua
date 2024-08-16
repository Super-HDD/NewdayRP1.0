local promptGroups = {}

GenericChairs = {
	"mp005_s_posse_col_chair01x",
	"mp005_s_posse_foldingchair_01x",
	"mp005_s_posse_trad_chair01x",
	"p_ambchair01x",
	"p_ambchair02x",
	"p_armchair01x",
	"p_bistrochair01x",
	"p_bench20x",
	"p_benchpiano02x",
	"p_chair02x",
	"p_chair04x",
	"p_chair05x",
	"p_chair06x",
	"p_chair07x",
	"p_chair09x",
	"p_chair_10x",
	"p_chair11x",
	"p_chair12bx",
	"p_chair12x",
	"p_chair13x",
	"p_chair14x",
	"p_chair15x",
	"p_chair16x",
	"p_chair17x",
	"p_chair18x",
	"p_chair19x",
	"p_chair20x",
	"p_chair21x",
	"p_chair21x_fussar",
	"p_chair22x",
	"p_chair23x",
	"p_chair24x",
	"p_chair25x",
	"p_chair26x",
	"p_chair27x",
	"p_chair30x",
	"p_chair31x",
	"p_chair37x",
	"p_chair38x",
	"p_chair_barrel04b",
	"p_chaircomfy01x",
	"p_chaircomfy02",
	"p_chaircomfy03x",
	"p_chaircomfy04x",
	"p_chaircomfy05x",
	"p_chaircomfy06x",
	"p_chaircomfy07x",
	"p_chaircomfy08x",
	"p_chaircomfy09x",
	"p_chaircomfy10x",
	"p_chaircomfy11x",
	"p_chaircomfy12x",
	"p_chaircomfy14x",
	"p_chaircomfy17x",
	"p_chaircomfy18x",
	"p_chaircomfy22x",
	"p_chaircomfy23x",
	"p_chairdoctor01x",
	"p_chair_crate02x",
	"p_chair_crate15x",
	"p_chair_cs05x",
	"p_chairdesk01x",
	"p_chairdesk02x",
	"p_chairdining01x",
	"p_chairdining02x",
	"p_chairdining03x",
	"p_chaireagle01x",
	"p_chairfolding02x",
	"p_chairhob01x",
	"p_chairhob02x",
	"p_chairmed01x",
	"p_chairmed02x",
	"p_chairoffice02x",
	"p_chairpokerfancy01x",
	"p_chairporch01x",
	"p_chair_privatedining01x",
	"p_chairrocking02x",
	"p_chairrocking03x",
	"p_chairrocking04x",
	"p_chairrocking05x",
	"p_chairrocking06x",
	"p_chairrustic01x",
	"p_chairrustic02x",
	"p_chairrustic03x",
	"p_chairrustic04x",
	"p_chairrustic05x",
	"p_chairsalon01x",
	"p_chairvictorian01x",
	"p_chairwhite01x",
	"p_chairwicker01x",
	"p_chairwicker02x",
	"p_cs_electricchair01x",
	"p_diningchairs01x",
	"p_gen_chair07x",
	"p_oldarmchair01x",
	"p_pianochair01x",
	"p_privatelounge_chair01x",
	"p_rockingchair01x",
	"p_rockingchair02x",
	"p_rockingchair03x",
	"p_seatbench01x",
	"p_settee02bx",
	"p_settee03x",
	"p_settee03bx",
	"p_sit_chairwicker01b",
	"p_stool01x",
	"p_stool02x",
	"p_stool03x",
	"p_stool04x",
	"p_stool05x",
	"p_stool06x",
	"p_stool07x",
	"p_stool08x",
	"p_stool09x",
	"p_stool10x",
	"p_stool12x",
	"p_stool13x",
	"p_stool14x",
	"p_stoolcomfy01x",
	"p_stoolcomfy02x",
	"p_stoolfolding01bx",
	"p_stoolfolding01x",
	"p_stoolwinter01x",
	"o_stoolfoldingstatic01x",
	"p_theaterchair01b01x",
	"p_windsorchair01x",
	"p_windsorchair02x",
	"p_windsorchair03x",
	"p_woodbench02x",
	"p_woodendeskchair01x",
	"s_bench01x"
}

GenericBenches = {
	"p_bench03x",
	"p_bench06x",
	"p_bench08bx",
	"p_bench09x",
	"p_bench15_mjr",
	"p_bench15x",
	"p_bench18x",
	"p_benchch01x",
	"p_benchironnbx01x",
	"p_bench_log01x",
	"p_bench_log02x",
	"p_bench_log03x",
	"p_bench_log04x",
	"p_bench_log05x",
	"p_bench_log06x",
	"p_bench_log07x",
	"p_bench_logsnow07x",
	"p_benchnbx02x",
	"p_benchnbx03x",
	"p_couch01x",
	"p_couch02x",
	"p_couch05x",
	"p_couch06x",
	"p_couch08x",
	"p_couch09x",
	"p_couch10x",
	"p_couch11x",
	"p_couchwicker01x",
	"p_hallbench01x",
	"p_loveseat01x",
	"p_settee01x",
	"p_settee04x",
	"p_settee_05x",
	"p_sit_chairwicker01a",
	"p_sofa02x",
	"p_windsorbench01x"
}

GenericChairAndBenchScenarios = {
	{name = "GENERIC_SEAT_BENCH_SCENARIO"},
	{name = "GENERIC_SEAT_CHAIR_SCENARIO", isCompatible = IsPedHumanMale},
	{name = "GENERIC_SEAT_CHAIR_TABLE_SCENARIO"},
	{name = "MP_LOBBY_PROP_HUMAN_SEAT_BENCH_PORCH_DRINKING"},
	{name = "MP_LOBBY_PROP_HUMAN_SEAT_BENCH_PORCH_SMOKING"},
	{name = "MP_LOBBY_PROP_HUMAN_SEAT_CHAIR"},
	{name = "MP_LOBBY_PROP_HUMAN_SEAT_CHAIR_KNIFE_BADASS"},
	{name = "MP_LOBBY_PROP_HUMAN_SEAT_CHAIR_WHITTLE"},
	{name = "PROP_CAMP_FIRE_SEAT_CHAIR"},
	{name = "PROP_HUMAN_CAMP_FIRE_SEAT_BOX"},
	{name = "PROP_HUMAN_SEAT_BENCH_CONCERTINA", isCompatible = IsPedHumanMale},
	{name = "PROP_HUMAN_SEAT_BENCH_FIDDLE", isCompatible = IsPedHumanFemale},
	{name = "PROP_HUMAN_SEAT_BENCH_JAW_HARP", isCompatible = IsPedHumanMale},
	{name = "PROP_HUMAN_SEAT_BENCH_MANDOLIN", isCompatible = IsPedHumanMale},
	{name = "PROP_HUMAN_SEAT_CHAIR"},
	{name = "PROP_HUMAN_SEAT_CHAIR_BANJO", isCompatible = IsPedHumanMale},
	{name = "PROP_HUMAN_SEAT_CHAIR_CLEAN_RIFLE"},
	{name = "PROP_HUMAN_SEAT_CHAIR_CLEAN_SADDLE"},
	{name = "PROP_HUMAN_SEAT_CHAIR_CRAB_TRAP", isCompatible = IsPedHumanMale},
	{name = "PROP_HUMAN_SEAT_CHAIR_CIGAR", isCompatible = IsPedHumanMale},
	{name = "PROP_HUMAN_SEAT_CHAIR_GROOMING_GROSS", isCompatible = IsPedHumanMale},
	{name = "PROP_HUMAN_SEAT_CHAIR_GROOMING_POSH", isCompatible = IsPedHumanFemale},
	{name = "PROP_HUMAN_SEAT_CHAIR_GUITAR", isCompatible = IsPedHumanMale},
	{name = "PROP_HUMAN_SEAT_CHAIR_KNIFE_BADASS", isCompatible = IsPedHumanMale},
	{name = "PROP_HUMAN_SEAT_CHAIR_KNITTING", isCompatible = IsPedHumanFemale},
	{name = "PROP_HUMAN_SEAT_CHAIR_PORCH"},
	{name = "PROP_HUMAN_SEAT_CHAIR_READING", isCompatible = IsPedHumanFemale},
	{name = "PROP_HUMAN_SEAT_CHAIR_TABLE_DRINKING"}
}

BedScenarios = {
	{name = "PROP_HUMAN_SLEEP_BED_PILLOW"},
	{name = "PROP_HUMAN_SLEEP_BED_PILLOW_HIGH", isCompatible = IsPedHumanMale},
	{name = "WORLD_HUMAN_SLEEP_GROUND_ARM"},
	{name = "WORLD_HUMAN_SLEEP_GROUND_PILLOW"},
	{name = "WORLD_HUMAN_SIT_FALL_ASLEEP"},
	{name = "WORLD_PLAYER_SLEEP_BEDROLL"},
	{name = "WORLD_PLAYER_SLEEP_GROUND"}
}

local Interactions = {}
Citizen.CreateThread(function()
  Interactions = {
	-- Pianos
	{
		isCompatible = IsPedHuman,
		objects = {"p_piano03x"},
		radius = 2.0,
		scenarios = {
			{name = "PROP_HUMAN_PIANO", isCompatible = IsPedHumanMale},
			{name = "PROP_HUMAN_ABIGAIL_PIANO", isCompatible = IsPedHumanFemale}
		},
		x = 0.0,
		y = -0.70,
		z = 0.5,
		heading = 0.0,
    label = "Play"
	},
	{
		isCompatible = IsPedHuman,
		objects = {"p_piano02x"},
		radius = 2.0,
		scenarios = {
			{name = "PROP_HUMAN_PIANO", isCompatible = IsPedHumanMale},
			{name = "PROP_HUMAN_ABIGAIL_PIANO", isCompatible = IsPedHumanFemale}
		},
		x = 0.0,
		y = -0.70,
		z = 0.5,
		heading = 0.0,
    label = "Play"
	},
	{
		isCompatible = IsPedHuman,
		objects = {"p_nbxpiano01x"},
		radius = 2.0,
		scenarios = {
			{name = "PROP_HUMAN_PIANO", isCompatible = IsPedHumanMale},
			{name = "PROP_HUMAN_ABIGAIL_PIANO", isCompatible = IsPedHumanFemale}
		},
		x = -0.1,
		y = -0.75,
		z = 0.5,
		heading = 0.0,
    label = "Play"
	},
	{
		isCompatible = IsPedHuman,
		objects = {"p_nbmpiano01x"},
		radius = 2.0,
		scenarios = {
			{name = "PROP_HUMAN_PIANO", isCompatible = IsPedHumanMale},
			{name = "PROP_HUMAN_ABIGAIL_PIANO", isCompatible = IsPedHumanFemale}
		},
		x = 0.0,
		y = -0.77,
		z = 0.5,
		heading = 0.0,
    label = "Play"
	},
	{
		objects = {"sha_man_piano01"},
		radius = 2.0,
		scenarios = {
			{name = "PROP_HUMAN_PIANO", isCompatible = IsPedHumanMale},
			{name = "PROP_HUMAN_ABIGAIL_PIANO", isCompatible = IsPedHumanFemale}
		},
		x = 0.0,
		y = -0.75,
		z = 0.5,
		heading = 0.0,
    label = "Play"
	},
	{
		isCompatible = IsPedAdult,
		objects = GenericChairs,
		radius = 1.5,
		scenarios = {
			{name = "PROP_HUMAN_SEAT_CHAIR_DRINKING"}
		},
		x = 0.0,
		y = 0.05,
		z = -0.1,
		heading = 180.0
	},
	{
		isCompatible = IsPedAdult,
		objects = GenericBenches,
		radius = 1.5,
		scenarios = {
			{name = "PROP_HUMAN_SEAT_CHAIR_DRINKING"}
		},
		label = "left",
		x = 0.4,
		y = -0.05,
		z = -0.1,
		heading = 180.0
	},
	{
		isCompatible = IsPedAdult,
		objects = GenericBenches,
		radius = 1.5,
		scenarios = {
			{name = "PROP_HUMAN_SEAT_CHAIR_DRINKING"}
		},
		label = "right",
		x = -0.4,
		y = -0.05,
		z = -0.1,
		heading = 180.0
	},
	{
		isCompatible = IsPedHumanMale,
		objects = GenericChairs,
		radius = 1.5,
		scenarios = {
			{name = "PROP_HUMAN_SEAT_BENCH_HARMONICA"}
		},
		x = 0.0,
		y = -0.3,
		z = 0.5,
		heading = 180.0
	},
	{
		isCompatible = IsPedAdultFemale,
		objects = GenericChairs,
		radius = 1.5,
		scenarios = {
			{name = "PROP_HUMAN_SEAT_CHAIR_FAN"}
		},
		x = 0.0,
		y = 0.0,
		z = 0.5,
		heading = 240.0
	},
	{
		isCompatible = IsPedAdult,
		objects = {"p_chairrusticsav01x"},
		radius = 1.5,
		scenarios = GenericChairAndBenchScenarios,
		x = 0.0,
		y = -0.1,
		z = 0.5,
		heading = 180.0
	},
	{
		isCompatible = IsPedAdult,
		objects = {"p_chairtall01x"},
		radius = 1.5,
		scenarios = GenericChairAndBenchScenarios,
		x = 0.0,
		y = 0.0,
		z = 0.8,
		heading = 180.0
	},
	{
		isCompatible = IsPedHuman,
		objects = {"p_barstool01x"},
		radius = 1.5,
		scenarios = GenericChairAndBenchScenarios,
		x = 0.0,
		y = 0.0,
		z = 0.8,
		heading = 0.0
	},
	{
		isCompatible = IsPedChild,
		objects = GenericChairs,
		radius = 1.5,
		scenarios = GenericChairAndBenchScenarios,
		x = 0.0,
		y = 0.0,
		z = 0.4,
		heading = 180.0
	},
	{
		isCompatible = IsPedHuman,
		objects = GenericBenches,
		label = "right",
		radius = 2.0,
		scenarios = GenericChairAndBenchScenarios,
		x = -0.5,
		y = 0.0,
		z = 0.5,
		heading = 180.0
	},
	{
		isCompatible = IsPedHuman,
		objects = GenericBenches,
		label = "left",
		radius = 2.0,
		scenarios = GenericChairAndBenchScenarios,
		x = 0.5,
		y = 0.0,
		z = 0.5,
		heading = 180.0
	},
	{
		isCompatible = IsPedHuman,
		objects = {
			"p_bench17x",
			"p_benchbear01x"
		},
		label = "right",
		radius = 1.5,
		scenarios = GenericChairAndBenchScenarios,
		x = -0.3,
		y = 0.0,
		z = 0.5,
		heading = 180.0
	},
	{
		objects = {
			"p_bench17x",
			"p_benchbear01x"
		},
		label = "left",
		radius = 1.5,
		scenarios = GenericChairAndBenchScenarios,
		x = 0.3,
		y = 0.0,
		z = 0.5,
		heading = 180.0
	},
	{
		objects = {
			"p_bed14x",
			"p_bed17x",
			"p_bed21x",
			"p_bedbunk03x",
			"p_bedindian02x",
			"p_cot01x"
		},
		radius = 2.0,
		scenarios = BedScenarios,
		x = 0.0,
		y = 0.0,
		z = 0.5,
		heading = 180.0
	},
	{
		objects = {
			"p_bed20madex",
			"p_cs_pro_bed_unmade",
			"p_cs_bed20madex"
		},
		label = "right",
		radius = 2.0,
		scenarios = BedScenarios,
		x = -0.3,
		y = -0.2,
		z = 0.5,
		heading = 180.0
	},
	{
		objects = {
			"p_bed20madex",
			"p_cs_pro_bed_unmade",
			"p_cs_bed20madex"
		},
		label = "left",
		radius = 2.0,
		scenarios = BedScenarios,
		x = 0.3,
		y = -0.2,
		z = 0.5,
		heading = 180.0
	},
	{
		objects = {
			"p_ambbed01x",
			"p_bed03x",
			"p_bed09x",
			"p_bedindian01x",
		},
		radius = 2.0,
		scenarios = BedScenarios,
		x = 0.0,
		y = 0.0,
		z = 0.5,
		heading = 270.0
	},
	{
		objects = {
			"p_bed05x"
		},
		radius = 2.0,
		scenarios = BedScenarios,
		x = 0.0,
		y = -0.5,
		z = 0.5,
		heading = 180.0
	},
	{
		objects = {
			"p_bed10x",
			"p_bed12x",
			"p_bed13x",
			"p_bed22x"
		},
		radius = 2.0,
		scenarios = BedScenarios,
		x = 0.0,
		y = -0.3,
		z = 0.8,
		heading = 180.0
	},
	{
		objects = {
			"p_bed20x"
		},
		label = "right",
		radius = 2.0,
		scenarios = BedScenarios,
		x = -0.3,
		y = -0.2,
		z = 0.8,
		heading = 180.0
	},
	{
		objects = {
			"p_bed20x"
		},
		label = "left",
		radius = 2.0,
		scenarios = BedScenarios,
		x = 0.3,
		y = -0.2,
		z = 0.8,
		heading = 180.0
	},
	{
		objects = {
			"p_bedking02x"
		},
		label = "left",
		radius = 2.0,
		scenarios = BedScenarios,
		x = -0.5,
		y = 0.5,
		z = 0.5,
		heading = 180.0
	},
	{
		objects = {
			"p_bedking02x"
		},
		label = "right",
		radius = 2.0,
		scenarios = BedScenarios,
		x = 0.5,
		y = 0.5,
		z = 0.5,
		heading = 180.0
	},
	{
		objects = {
			"p_bedrollopen01x",
			"p_bedrollopen03x",
			"p_re_bedrollopen01x",
			"s_bedrollfurlined01x",
			"s_bedrollopen01x",
			"p_amb_mattress04x",
			"p_mattress04x",
			"p_mattress07x",
			"p_mattresscombined01x"
		},
		radius = 1.5,
		scenarios = BedScenarios,
		x = 0.0,
		y = 0.0,
		z = 0.0,
		heading = 180.0
	},
	{
		objects = {
			"p_cs_ann_wrkr_bed01x",
			"p_cs_roc_hse_bed",
			"p_medbed01x"
		},
		radius = 2.0,
		scenarios = BedScenarios,
		x = 0.1,
		y = 0.0,
		z = 0.85,
		heading = 270.0
	},
	{
		objects = {
			"p_cs_bedsleptinbed08x"
		},
		label = "left",
		radius = 2.0,
		scenarios = BedScenarios,
		x = 0.3,
		y = -0.3,
		z = 0.5,
		heading = 270.0
	},
	{
		objects = {
			"p_cs_bedsleptinbed08x"
		},
		label = "right",
		radius = 2.0,
		scenarios = BedScenarios,
		x = 0.3,
		y = 0.3,
		z = 0.5,
		heading = 270.0
	}
}
end)

local entity = 0


AddEventHandler('mouse-selection:CanInteract', function(_entityHover, callback)
  entity = 0
  local model = GetEntityModel(_entityHover)
  for _,_interaction in pairs (Interactions) do
    if not _interaction.isCompatible or _interaction.isCompatible(PlayerPedId()) then
      if _interaction.objects then
        for _,_object in pairs (_interaction.objects) do
          if model == GetHashKey(_object) then
						entity = _entityHover
            callback(true)
            return
          end
        end
      end
    end
  end
end)

AddEventHandler("mouse-selection:ClickEntity", function(_entityHover)
  if (entity ~= _entityHover) then return end

	me = PlayerPedId()
  local model = GetEntityModel(entity)

	local children = {}
	for _,_interaction in pairs (Interactions) do
		if not _interaction.isCompatible or _interaction.isCompatible(me) then
			if _interaction.objects then
				for _,_object in pairs (_interaction.objects) do
					if model == GetHashKey(_object) then
						if _interaction.scenarios then
							for _, scenario in pairs (_interaction.scenarios) do
								if not scenario.isCompatible or scenario.isCompatible(PlayerPedId()) then
									table.insert(children,{
										title = scenario.name,
										argument = {
											interation = _interaction,
											scenario = scenario.name
										}
									})
								end
							end
						end
					end
				end
			end
		end
	end

	CMenu.AddItem({
		title="互动",
		id="interaction",
		callback="mouse-selection:Interaction",
		children = children
	})


  
end)

AddEventHandler("mouse-selection:Interaction", function(_entityHover, id, argument)
  if (entity ~= _entityHover) then return end

	local interaction = argument.interation

  local StartingCoords = GetEntityCoords(ped)
  local objectHeading = GetEntityHeading(_entityHover)
	local objectCoords = GetEntityCoords(_entityHover)

	local r = math.rad(objectHeading)
	local cosr = math.cos(r)
	local sinr = math.sin(r)

	local x = interaction.x * cosr - interaction.y * sinr + objectCoords.x
	local y = interaction.y * cosr + interaction.x * sinr + objectCoords.y
	local z = interaction.z + objectCoords.z
	local h = interaction.heading + objectHeading

	local ped = PlayerPedId()

	StartingCoords = GetEntityCoords(ped)

	ClearPedTasksImmediately(ped)

	FreezeEntityPosition(ped, true)

	if argument.scenario then
		TaskStartScenarioAtPosition(ped, GetHashKey(argument.scenario), x, y, z, h, -1, false, true)
	end

  if not promptGroups['cancel'] then
    CreatePromptButton('cancel', '取消','INPUT_FRONTEND_CANCEL',1000)
  end

  while true do
    Wait(0)
    DisplayPrompt('cancel',"互动")
    if IsPromptCompleted('cancel','INPUT_FRONTEND_CANCEL') then
      ClearPedTasksImmediately(ped)
      FreezeEntityPosition(ped, false)
		  SetEntityCoordsNoOffset(ped, StartingCoords.x, StartingCoords.y, StartingCoords.z)
      return
    end
  end
end)

function IsPromptCompleted(group,key)
  if UiPromptHasHoldMode(promptGroups[group].prompts[key]) then
    if PromptHasHoldModeCompleted(promptGroups[group].prompts[key]) then
      UiPromptSetEnabled(promptGroups[group].prompts[key], false)
      Citizen.CreateThread(function()
        local group = group
        local key = key
        while IsDisabledControlPressed(0,GetHashKey(key)) do
          Wait(0)
        end
        UiPromptSetEnabled(promptGroups[group].prompts[key], true)
      end)
      return true
    end
  else
    if IsControlJustPressed(0,GetHashKey(key)) then
      return true
    end
  end
  return false
end

function CreatePromptButton(group, str, key, holdTime)
  --Check if group exist
  if (promptGroups[group] == nil) then
    promptGroups[group] = {
      group = GetRandomIntInRange(0, 0xffffff),
      prompts = {}
    }
  end
  promptGroups[group].prompts[key] = PromptRegisterBegin()
  PromptSetControlAction(promptGroups[group].prompts[key], GetHashKey(key))
  str = CreateVarString(10, 'LITERAL_STRING', str)
  PromptSetText(promptGroups[group].prompts[key], str)
  PromptSetEnabled(promptGroups[group].prompts[key], true)
  PromptSetVisible(promptGroups[group].prompts[key], true)
  if holdTime then
    PromptSetHoldMode(promptGroups[group].prompts[key], holdTime)
  end
  PromptSetGroup(promptGroups[group].prompts[key], promptGroups[group].group)
  PromptRegisterEnd(promptGroups[group].prompts[key])
end

function DisplayPrompt(group,str)
  local promptName  = CreateVarString(10, 'LITERAL_STRING', str)
  PromptSetActiveGroupThisFrame(promptGroups[group].group, promptName)
end

function UiPromptSetEnabled(...)
  return Citizen.InvokeNative(0x8A0FB4D03A630D21,...)
end

function IsPedChild(ped)
	return Citizen.InvokeNative(0x137772000DAF42C5, ped)
end

function IsPedAdult(ped)
	return IsPedHuman(ped) and not IsPedChild(ped)
end

function IsPedHumanMale(ped)
	return IsPedHuman(ped) and IsPedMale(ped)
end

function IsPedHumanFemale(ped)
	return IsPedHuman(ped) and not IsPedMale(ped)
end

function IsPedAdultMale(ped)
	return not IsPedChild(ped) and IsPedMale(ped)
end

function IsPedAdultFemale(ped)
	return not IsPedChild(ped) and not IsPedMale(ped)
end