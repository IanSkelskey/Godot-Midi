extends StaticBody2D

var ball_position : Vector2
var distance_from_ball : int
var move_by_distance : int
var window_height : int
var paddle_height : int


# Called when the node enters the scene tree for the first time.
func _ready():
	window_height = get_viewport_rect().size.y
	paddle_height = $ColorRect.get_size().y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ball_position = $"../Ball".position
	distance_from_ball = position.y - ball_position.y
	
	if abs(distance_from_ball) > get_parent().PADDLE_SPEED *delta:
		move_by_distance = get_parent().PADDLE_SPEED * delta * (distance_from_ball / abs(distance_from_ball))
	else:
		move_by_distance = distance_from_ball
		
	position.y -= move_by_distance
	
	position.y = clamp(position.y, 0, window_height - paddle_height)
