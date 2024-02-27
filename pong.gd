extends Node2D

var score := [0, 0] # 0: CPU, 1: Player
const PADDLE_SPEED : int = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_ball_timer_timeout():
	$Ball.new_ball()


func _on_left_goal_body_entered(body):
	score[1] += 1
	$HUD/PlayerScore.text = str(score[1])
	$BallTimer.start()
	

func _on_right_goal_body_entered(body):
	score[0] += 1
	$HUD/CPUScore.text = str(score[0])
	$BallTimer.start()

