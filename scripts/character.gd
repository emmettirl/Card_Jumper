extends CharacterBody2D

@onready var collision = $CollisionShape2D

const DAMPING = 0.975

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func jump(vector):
    velocity = vector * 2
    
func _physics_process(delta):
    # Add the gravity.
    if not is_on_floor():
        velocity.y += gravity * delta
        
    var collsionShapeExtents = collision.shape.extents
    if position.x <= 0 + collsionShapeExtents.x or position.x >= get_viewport().get_visible_rect().size.x - collsionShapeExtents.x:
        velocity.x *= -1
        
    position.x = clamp(position.x, 0 + collision.shape.extents.x , get_viewport().get_visible_rect().size.x -collision.shape.extents.x)
    
    var coll = move_and_collide(velocity * delta)
    if not is_on_floor() and coll:
        velocity = velocity.bounce(coll.get_normal())

    if velocity.y < 0:
        velocity.y *= DAMPING
    velocity.x *= DAMPING
