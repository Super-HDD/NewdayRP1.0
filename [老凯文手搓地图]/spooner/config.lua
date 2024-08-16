Config = {}

Config.isRDR = not TerraingridActivate

-- Configurable controls
if Config.isRDR then
	Config.IncreaseSpeedControl   = {`INPUT_CREATOR_LT`, `INPUT_PREV_WEAPON`} -- Page Up, Mouse Wheel Up
	Config.DecreaseSpeedControl   = {`INPUT_CREATOR_RT`, `INPUT_NEXT_WEAPON`} -- Page Down, Mouse Wheel Down
	Config.UpControl              = `INPUT_JUMP` -- Spacebar
	Config.DownControl            = `INPUT_SPRINT` -- Shift
	Config.ForwardControl         = `INPUT_MOVE_UP_ONLY` -- W
	Config.BackwardControl        = `INPUT_MOVE_DOWN_ONLY` -- S
	Config.LeftControl            = `INPUT_MOVE_LEFT_ONLY` -- A
	Config.RightControl           = `INPUT_MOVE_RIGHT_ONLY` -- D
	Config.ToggleControl          = `` -- Del
	Config.SpawnControl           = `INPUT_DYNAMIC_SCENARIO` -- E
	Config.SelectControl          = `INPUT_CURSOR_ACCEPT` -- Left mouse button
	Config.DeleteControl          = `INPUT_CONTEXT_LT` -- Right mouse button
	Config.AdjustUpControl        = `INPUT_FRONTEND_LB` -- Q
	Config.AdjustDownControl      = `INPUT_FRONTEND_LS` -- Z
	Config.AdjustForwardControl   = `INPUT_FRONTEND_UP` -- Up arrow key
	Config.AdjustBackwardControl  = `INPUT_FRONTEND_DOWN` -- Down arrow key
	Config.AdjustLeftControl      = `INPUT_FRONTEND_LEFT` -- Left arrow key
	Config.AdjustRightControl     = `INPUT_FRONTEND_RIGHT` -- Right arrow key
	Config.RotateRightControl     = `INPUT_CREATOR_RS` -- C
	Config.RotateLeftControl      = `INPUT_NEXT_CAMERA` -- V
	Config.RotateModeControl      = `INPUT_OPEN_SATCHEL_MENU` -- B
	Config.SpawnMenuControl       = `INPUT_CONTEXT_B` -- F
	Config.DbMenuControl          = `INPUT_SWITCH_SHOULDER` -- X
	Config.PropMenuControl        = `INPUT_CREATOR_MENU_TOGGLE` -- Tab
	Config.SaveLoadDbMenuControl  = `INPUT_OPEN_JOURNAL` -- J
	Config.AdjustModeControl      = `INPUT_QUICK_USE_ITEM` -- I
	Config.PlaceOnGroundControl   = `INPUT_AIM_IN_AIR` -- U
	Config.FreeAdjustModeControl  = `INPUT_SELECT_QUICKSELECT_PRIMARY_LONGARM` -- 8
	Config.AdjustOffControl       = `INPUT_SELECT_QUICKSELECT_THROWN` -- 7
	Config.HelpMenuControl        = {`INPUT_WHISTLE_HORSEBACK`, `INPUT_WHISTLE`} -- H
	Config.CloneControl           = `INPUT_INTERACT_ANIMAL` -- G
	Config.SpeedModeControl       = `INPUT_RELOAD` -- R
	Config.ToggleControlsControl  = `INPUT_SELECT_QUICKSELECT_SIDEARMS_LEFT` -- 1
	Config.FocusControl           = `INPUT_PC_FREE_LOOK` -- Alt
	Config.ToggleFocusModeControl = {`INPUT_DUCK`, `INPUT_HORSE_STOP`} -- Ctrl
	Config.LookLrControl          = `INPUT_LOOK_LR`
	Config.LookUdControl          = `INPUT_LOOK_UD`
	Config.EntityHandlesControl   = `INPUT_MAP` -- M
else
	Config.IncreaseSpeedControl   = 15 -- Page Up, Mouse Wheel Up
	Config.DecreaseSpeedControl   = 14 -- Page Down, Mouse Wheel Down
	Config.UpControl              = 22 -- Spacebar
	Config.DownControl            = 21 -- Shift
	Config.ForwardControl         = 32 -- W
	Config.BackwardControl        = 33 -- S
	Config.LeftControl            = 34 -- A
	Config.RightControl           = 35 -- D
	Config.ToggleControl          = 178 -- Del
	Config.SpawnControl           = 38 -- E
	Config.SelectControl          = 176 -- Left mouse button
	Config.DeleteControl          = 177 -- Right mouse button
	Config.AdjustUpControl        = 44 -- Q
	Config.AdjustDownControl      = 48 -- Z
	Config.AdjustForwardControl   = 188 -- Up arrow key
	Config.AdjustBackwardControl  = 187 -- Down arrow key
	Config.AdjustLeftControl      = 189 -- Left arrow key
	Config.AdjustRightControl     = 190 -- Right arrow key
	Config.RotateRightControl     = 26 -- C
	Config.RotateLeftControl      = 0 -- V
	Config.RotateModeControl      = 29 -- B
	Config.SpawnMenuControl       = 23 -- F
	Config.DbMenuControl          = 73 -- X
	Config.PropMenuControl        = 37 -- Tab
	Config.SaveLoadDbMenuControl  = 288 -- J
	Config.AdjustModeControl      = 39 -- I
	Config.PlaceOnGroundControl   = 81 -- U
	Config.FreeAdjustModeControl  = 82 -- 8
	Config.AdjustOffControl       = 84 -- 7
	Config.HelpMenuControl        = 74 -- H
	Config.CloneControl           = 58 -- G
	Config.SpeedModeControl       = 45 -- R
	Config.ToggleControlsControl  = 170 -- F3
	Config.FocusControl           = 19 -- Alt
	Config.ToggleFocusModeControl = 36 -- Ctrl
	Config.LookLrControl          = 1
	Config.LookUdControl          = 2
	Config.EntityHandlesControl   = 244 -- M
end

-- 最大移动速度
Config.MaxSpeed = 1.00

-- 最小移动速度
Config.MinSpeed = 0.01

-- 当按下加速/减速控件时，速度增加/减小的量
Config.SpeedIncrement = 0.01

-- 默认移动速度
Config.Speed = 0.10

-- 相机X轴旋转速度
Config.SpeedLr = 8.0

-- 相机Y轴旋转速度
Config.SpeedUd = 8.0

-- 最小的X、Y、Z调整速度
Config.MinAdjustSpeed = 0.001

-- 最大的X、Y、Z调整速度
Config.MaxAdjustSpeed = 100.0

-- 当按下加速/减速控件时，X、Y、Z调整速度增加/减小的量
Config.AdjustSpeedIncrement = 0.001

-- X、Y、Z调整速度
Config.AdjustSpeed = 0.01

-- 最小的俯仰、滚转、偏航调整速度
Config.MinRotateSpeed = 0.1

-- 最大的俯仰、滚转、偏航调整速度
Config.MaxRotateSpeed = 360.0

-- 当按下加速/减速控件时，俯仰、滚转、偏航调整速度增加/减小的量
Config.RotateSpeedIncrement = 0.1

-- 俯仰、滚转、偏航调整速度
Config.RotateSpeed = 1.0

-- 组成员的雷达脉冲图标
Config.GroupMemberBlipSprite = -214162151

-- 在没有spooner.noEntityLimit权限的玩家的情况下，可以同时生成的实体的最大数量
Config.MaxEntities = 0

-- 当资源停止时是否自动从玩家的数据库中删除所有实体
Config.CleanUpOnStop = true

-- 实体处理器的绘制距离
Config.EntityHandleDrawDistance = 20.0
