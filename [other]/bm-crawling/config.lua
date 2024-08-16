BMConfig = {}

BMConfig.ShowTutorial   = true
--BMConfig.TutorialText   = 'Move ~INPUT_MOVE_UP_ONLY~~INPUT_MOVE_LEFT_ONLY~~INPUT_MOVE_DOWN_ONLY~~INPUT_MOVE_RIGHT_ONLY~ - Sprint ~INPUT_SPRINT~ - Stop ~INPUT_JUMP~'
BMConfig.TutorialText   = '移动~INPUT_MOVE_UP_ONLY~~INPUT_MOVE_LEFT_ONLY~~INPUT_MOVE_DOWN_ONLY~~INPUT_MOVE_RIGHT_ONLY~ - 冲刺 ~INPUT_SPRINT~ - 停止 ~INPUT_JUMP~'

BMConfig.ProneStart     = `INPUT_DUCK`
BMConfig.ProneStop      = `INPUT_JUMP`
BMConfig.MoveForward    = `INPUT_MOVE_UP_ONLY`
BMConfig.MoveSprint     = `INPUT_SPRINT`
BMConfig.MoveBackward   = `INPUT_MOVE_DOWN_ONLY`
BMConfig.MoveLeft       = `INPUT_MOVE_LEFT_ONLY`
BMConfig.MoveRight      = `INPUT_MOVE_RIGHT_ONLY`

BMConfig.IdleTurnLR = 90 -- 设置为使用90度或180度的空闲转动