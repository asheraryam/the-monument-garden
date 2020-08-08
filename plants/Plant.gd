extends Spatial

const rotation_y_range = PI
const rotation_x_range = 0.2
const scale_range = 0.2

func _ready():
	spawn()
	$AnimationPlayer.play("Spawn")

func spawn():
	var plant_asset = GameState.get_selected_plant_asset()
	var Plant = load(plant_asset.path)
	var plant = Plant.instance()

	plant.rotation = random_rotation()
	plant.scale = random_scale()
	add_child(plant)
	
func random_rotation():
	var rotation_y = rand_range(-rotation_y_range, rotation_y_range)
	var rotation_x = rand_range(-rotation_x_range, rotation_x_range)
	
	return Vector3(rotation_x, rotation_y, 0)
	
func random_scale():
	var scale = rand_range(1-scale_range, 1+scale_range)
	
	return Vector3(scale, scale, scale)
